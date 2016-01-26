//
//  ChoseRune.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "ChoseRune.h"

@implementation ChoseRune


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.redButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.redButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 3, [UIScreen mainScreen].bounds.size.width / 3, [UIScreen mainScreen].bounds.size.width / 3, 30);
        self.redButton.backgroundColor = [UIColor redColor];
        [self.redButton setTitle:@"印记" forState:(UIControlStateNormal)];
        [self addSubview:_redButton];
        
        self.yellowButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.yellowButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 3, [UIScreen mainScreen].bounds.size.width / 3 + 50, [UIScreen mainScreen].bounds.size.width / 3, 30);
        self.yellowButton.backgroundColor = [UIColor orangeColor];
        [self.yellowButton setTitle:@"符印" forState:(UIControlStateNormal)];
        [self addSubview:_yellowButton];
        
        self.blueButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.blueButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 3, [UIScreen mainScreen].bounds.size.width / 3 + 100, [UIScreen mainScreen].bounds.size.width / 3, 30);
        self.blueButton.backgroundColor = [UIColor blueColor];
        [self.blueButton setTitle:@"雕文" forState:(UIControlStateNormal)];
        [self addSubview:_blueButton];
        
        self.purpleButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.purpleButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 3, [UIScreen mainScreen].bounds.size.width / 3 + 150, [UIScreen mainScreen].bounds.size.width / 3, 30);
        self.purpleButton.backgroundColor = [UIColor purpleColor];
        [self.purpleButton setTitle:@"精华" forState:(UIControlStateNormal)];
        [self addSubview:_purpleButton];
        
        
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
