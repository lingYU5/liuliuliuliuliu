//
//  InformationView.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "InformationView.h"

@implementation InformationView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.fightingButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.fightingButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 16, [UIScreen mainScreen].bounds.size.width / 8, [UIScreen mainScreen].bounds.size.width / 4, [UIScreen mainScreen].bounds.size.width / 4);
        [self.fightingButton setBackgroundImage:[UIImage imageNamed:@"333.png"] forState:UIControlStateNormal];
        [self addSubview:_fightingButton];
        
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 16, [UIScreen mainScreen].bounds.size.width / 8 * 3, [UIScreen mainScreen].bounds.size.width / 4, 30)];
        label1.text = @"战斗力";
        label1.textColor = [UIColor orangeColor];
        label1.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label1];
        
        
        self.gameEncyclopediaButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _gameEncyclopediaButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 8 * 3, [UIScreen mainScreen].bounds.size.width / 8, [UIScreen mainScreen].bounds.size.width / 4, [UIScreen mainScreen].bounds.size.width / 4);
        [self.gameEncyclopediaButton setBackgroundImage:[UIImage imageNamed:@"666.png"] forState:UIControlStateNormal];
        [self addSubview:_gameEncyclopediaButton];
        
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 8 * 3, [UIScreen mainScreen].bounds.size.width / 8 * 3, [UIScreen mainScreen].bounds.size.width / 4, 30)];
        label2.text = @"游戏百科";
        label2.textColor = [UIColor orangeColor];
        label2.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label2];
        
        self.happyTimeButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _happyTimeButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 16 * 11, [UIScreen mainScreen].bounds.size.width / 8, [UIScreen mainScreen].bounds.size.width / 4, [UIScreen mainScreen].bounds.size.width / 4);
        [self.happyTimeButton setBackgroundImage:[UIImage imageNamed:@"888.png"] forState:UIControlStateNormal];
        [self addSubview:_happyTimeButton];
        
        UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 16 * 11, [UIScreen mainScreen].bounds.size.width / 8 * 3, [UIScreen mainScreen].bounds.size.width / 4, 30)];
        label3.text = @"坑爹查询";
        label3.textColor = [UIColor orangeColor];
        label3.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label3];
        
    }
    return self;
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
