//
//  GroupTableView.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "GroupTableView.h"
#import "GroupTableViewCell.h"

@interface GroupTableView () <UITableViewDataSource>

@end

@implementation GroupTableView


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.dataSource = self;
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.groupArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"gr"];
    if (!cell) {
        cell = [[GroupTableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"gr"];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.groupM = self.groupArr[indexPath.row];
    
    return cell;
}


- (void)setGroupArr:(NSMutableArray *)groupArr {
    _groupArr = groupArr;
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
