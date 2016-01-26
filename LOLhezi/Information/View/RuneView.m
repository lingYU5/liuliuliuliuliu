//
//  RuneView.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "RuneView.h"
#import "RuneTableViewCell.h"

@interface RuneView () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation RuneView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.choseButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.choseButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 3, 20, [UIScreen mainScreen].bounds.size.width / 3, 30);
        [self.choseButton setTitle:@"印记" forState:(UIControlStateNormal)];
        self.choseButton.backgroundColor = [UIColor redColor];
        [self addSubview:_choseButton];
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 55, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 5 * 4 - 55) style:(UITableViewStylePlain)];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        [self addSubview:_tableView];
        
        self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        
    }
    return self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.runeArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RuneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rrr"];
    if (!cell) {
        cell = [[RuneTableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"rrr"];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.runeM = self.runeArr[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UIScreen mainScreen].bounds.size.width / 4 + 10;
}

- (void)setRuneArr:(NSMutableArray *)runeArr {
    _runeArr = runeArr;
    [self.tableView reloadData];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
