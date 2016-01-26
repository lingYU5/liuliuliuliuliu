//
//  CompareTableView.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/16.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "CompareTableView.h"
#import "HeroFigureTableViewCell.h"

@interface CompareTableView () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation CompareTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 14;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        HeroFigureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HF"];
        if (!cell) {
            cell = [[HeroFigureTableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"HF"];
            cell.backgroundColor = [UIColor clearColor];
        }
        return cell;
    } else if (indexPath.row != 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TC"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"TC"];
            cell.backgroundColor = [UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        return cell;
    }
    return nil;
}

- (void)setHeroDetail:(HeroDetail *)heroDetail {
    _heroDetail = heroDetail;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
