//
//  AppearEquipTableView.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/15.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "AppearEquipTableView.h"
#import "AppearEquipTableViewCell.h"
#import "NetHandler.h"
#import "AppearEquip.h"

@interface AppearEquipTableView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *arr;

@end

@implementation AppearEquipTableView



- (void)setHero:(Hero *)hero {
    _hero = hero;
    [self getAppearEquipData];
}

- (void)getAppearEquipData {
    [NetHandler getDataWithUrl:[NSString stringWithFormat:kHeroAppearEquip, self.hero.enName] completion:^(NSData *data) {
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.arr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in array) {
            AppearEquip *appearEquip = [[AppearEquip alloc] init];
            [appearEquip setValuesForKeysWithDictionary:dic];
            [_arr addObject:appearEquip];
            [self reloadData];
        }
    }];
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UIScreen mainScreen].bounds.size.width / 7.5 + 75;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _arr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 1) {
        AppearEquipTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"a"];
        if (!cell) {
            cell = [[AppearEquipTableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"a"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        cell.appearEquip = _arr[indexPath.section];
        return cell;
    } else {
    
    
    
    AppearEquipTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"appear"];
    if (!cell) {
        cell = [[AppearEquipTableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"appear"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    cell.appearEquip = _arr[indexPath.section];
    return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
