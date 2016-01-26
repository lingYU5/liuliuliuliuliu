//
//  EquipSortTableView.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "EquipSortTableView.h"
#import "EquipSort.h"

@interface EquipSortTableView () <UITableViewDataSource>

@end

@implementation EquipSortTableView


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.backgroundColor = [UIColor clearColor];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.equipSortArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sort"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"sort"];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    EquipSort *equip = self.equipSortArr[indexPath.row];
    cell.textLabel.text = equip.text;
    cell.textLabel.textColor = [UIColor orangeColor];
    return cell;
}

- (void)setEquipSortArr:(NSMutableArray *)equipSortArr {
    _equipSortArr = equipSortArr;
    [self reloadData];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
