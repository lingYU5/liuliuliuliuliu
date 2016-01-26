//
//  MyHeroView.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "MyHeroView.h"
#import "MyHTableViewCell.h"
#import "Hero.h"

@interface MyHeroView () <UITableViewDataSource>
@property (nonatomic, strong) UILabel *myPriceL;

@end

@implementation MyHeroView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.myPriceL = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 20, 60)];
        self.myPriceL.textColor = [UIColor cyanColor];
        _myPriceL.numberOfLines = 0;
        [self addSubview:_myPriceL];
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 5 * 4 - 104) style:(UITableViewStylePlain)];
        self.tableView.dataSource = self;
        [self addSubview:self.tableView];
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        

    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.myHeroArr.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyHTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myh"];
    if (!cell) {
        cell = [[MyHTableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"myh"];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    Hero *hero = self.myHeroArr[indexPath.row];
    cell.heroM = hero;
    
    return cell;
}



- (void)setMyHeroArr:(NSMutableArray *)myHeroArr {
    _myHeroArr = myHeroArr;
    [self.tableView reloadData];
}

- (void)setServerName:(NSString *)serverName {
    _serverName = serverName;
    
    NSInteger sum = 0;
    for (int i = 0; i < self.myHeroArr.count; i++) {
        Hero *hero = self.myHeroArr[i];
    NSArray *arr = [hero.price componentsSeparatedByString:@","];
        sum += [arr[0] integerValue];
    }
    
    
    
    self.myPriceL.text = [NSString stringWithFormat:@"英雄资产(%@)\n您总共有%ld个英雄, 价值 %ld 金币", serverName, (unsigned long)self.myHeroArr.count, sum];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
