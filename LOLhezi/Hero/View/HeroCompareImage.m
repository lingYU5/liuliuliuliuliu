//
//  HeroCompareImage.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/16.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroCompareImage.h"
#import "UIImageView+WebCache.h"

@interface HeroCompareImage ()
@property (nonatomic, strong) UIImageView *myImage;

@end

@implementation HeroCompareImage


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.myImage = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 5, [UIScreen mainScreen].bounds.size.width / 15, [UIScreen mainScreen].bounds.size.width / 6, [UIScreen mainScreen].bounds.size.width / 6)];
        self.myImage.backgroundColor = [UIColor redColor];
        [self addSubview:self.myImage];
        
        UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 5, [UIScreen mainScreen].bounds.size.width / 5, [UIScreen mainScreen].bounds.size.width / 6, [UIScreen mainScreen].bounds.size.width / 9)];
        myLabel.text = @"己方";
        myLabel.textColor = [UIColor orangeColor];
        myLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:myLabel];
        
        
        
        UILabel *vsLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 15, [UIScreen mainScreen].bounds.size.width / 9, 30, 30)];
        vsLabel.text = @"VS";
        vsLabel.textColor = [UIColor orangeColor];
        [self addSubview:vsLabel];
        
        self.enemyImage = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 8 * 5, [UIScreen mainScreen].bounds.size.width / 15, [UIScreen mainScreen].bounds.size.width / 6, [UIScreen mainScreen].bounds.size.width / 6)];
        self.enemyImage.backgroundColor = [UIColor redColor];
        [self.enemyImage setBackgroundImage:[UIImage imageNamed:@"123.jpg"] forState:UIControlStateNormal];
        [self addSubview:_enemyImage];
        
        
        UILabel *enemyLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 8 * 5, [UIScreen mainScreen].bounds.size.width / 5, [UIScreen mainScreen].bounds.size.width / 6, [UIScreen mainScreen].bounds.size.width / 9)];
        enemyLabel.text = @"敌方";
        enemyLabel.textColor = [UIColor orangeColor];
        enemyLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:enemyLabel];
        
    }
    return self;
}

- (void)setHeroDetail:(HeroDetail *)heroDetail {
    _heroDetail = heroDetail;
    [self.myImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kHeroHeadPortrait, heroDetail.name]]];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
