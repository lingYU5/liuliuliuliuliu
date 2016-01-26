//
//  GameEncyclopediaView.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "GameEncyclopediaView.h"

@interface GameEncyclopediaView () <UITableViewDataSource>

@end

@implementation GameEncyclopediaView

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
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"game"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"game"];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSArray *arr = @[@"10.png", @"11.png", @"12.png", @"13.png", @"14.png"];
    NSArray *arr1 = @[@"装备", @"天赋", @"符文", @"最佳整容", @"召唤师技能"];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", arr[indexPath.row]]];
    cell.textLabel.text = arr1[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    return cell;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
