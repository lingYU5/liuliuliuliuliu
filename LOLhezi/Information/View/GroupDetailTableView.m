//
//  GroupDetailTableView.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "GroupDetailTableView.h"
#import "GroupDetailTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface GroupDetailTableView () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation GroupDetailTableView


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        
        self.dataSource = self;
        
        self.delegate = self;
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"desl"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"desl"];
            cell.backgroundColor = [UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.textLabel.text = self.groupM.des;
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.numberOfLines = 0;
        return cell;
    } else {
        if (self.groupM != nil) {
            
        
        NSArray *arr = @[self.groupM.hero1, self.groupM.hero2, self.groupM.hero3, self.groupM.hero4, self.groupM.hero5];
        NSArray *arr2 = @[self.groupM.des1, self.groupM.des2, self.groupM.des3, self.groupM.des4, self.groupM.des5];
        GroupDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Gd"];
        if (!cell) {
            cell = [[GroupDetailTableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"Gd"];
            cell.backgroundColor = [UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        [cell.heroImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kHeroHeadPortrait, arr[indexPath.row - 1]]]];
        cell.desL.text = arr2[indexPath.row - 1];
        return cell;
        }
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
    if (self.groupM != nil) {
    if (indexPath.row == 0) {
        CGRect rect = [_groupM.des boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width / 4 * 3 - 20, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
        return rect.size.height + 10;
    } else {
        
            
        
    NSArray *arr2 = @[self.groupM.des1, self.groupM.des2, self.groupM.des3, self.groupM.des4, self.groupM.des5];
    
    CGRect rect = [arr2[indexPath.row - 1] boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width / 4 * 3 - 20, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    if (rect.size.height > [UIScreen mainScreen].bounds.size.width / 4) {
        return rect.size.height + 20;
    } else {
        return [UIScreen mainScreen].bounds.size.width / 4 + 20;
    }
    }
    }
    return 100;
}



- (void)setGroupM:(Group *)groupM {
    _groupM = groupM;
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
