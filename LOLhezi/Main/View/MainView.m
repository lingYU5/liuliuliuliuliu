//
//  MainView.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "MainView.h"
#import "UIColor+AddColor.h"



@implementation MainView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *upImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT / 2)];
        [upImage setImage:[UIImage imageNamed:@"main2.jpg"]];
        [self addSubview:upImage];
        
        UIImageView *downImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, kHEIGHT / 2, kWIDTH, kHEIGHT / 2)];
        [downImage setImage:[UIImage imageNamed:@"huise.jpg"]];
        [self addSubview:downImage];
        
        self.heroButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.heroButton.frame = CGRectMake(20, kHEIGHT / 2 + 20, kWIDTH / 4, kWIDTH / 4);
        [self.heroButton setBackgroundImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
        self.heroButton.layer.cornerRadius = kWIDTH / 8;
        self.heroButton.layer.masksToBounds = YES;
        [self addSubview:self.heroButton];
        
        UILabel *heroLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kWIDTH / 4 - 20, kWIDTH / 4, 20)];
        heroLabel.text = @"英雄";
        heroLabel.backgroundColor = [UIColor anheiColor];
        heroLabel.alpha = 0.8;
        heroLabel.textAlignment = NSTextAlignmentCenter;
        [self.heroButton addSubview:heroLabel];
        
        
        self.equipButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.equipButton.frame = CGRectMake(kWIDTH - 20 - kWIDTH / 4, kHEIGHT / 2 + 20, kWIDTH / 4, kWIDTH / 4);
        [self.equipButton setBackgroundImage:[UIImage imageNamed:@"2.png"] forState:(UIControlStateNormal)];
        self.equipButton.layer.cornerRadius = kWIDTH / 8;
        self.equipButton.layer.masksToBounds = YES;
        [self addSubview:self.equipButton];
        
        UILabel *equipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kWIDTH / 4 - 20, kWIDTH / 4, 20)];
        equipLabel.text = @"装备";
        equipLabel.backgroundColor = [UIColor anheiColor];
        equipLabel.alpha = 0.8;
        equipLabel.textAlignment = NSTextAlignmentCenter;
        [self.equipButton addSubview:equipLabel];
        
        
        self.informationButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.informationButton.frame = CGRectMake(kWIDTH / 2 - kWIDTH / 8, kHEIGHT / 1.4, kWIDTH / 4, kWIDTH / 4);
        [self.informationButton setBackgroundImage:[UIImage imageNamed:@"3.png"] forState:(UIControlStateNormal)];
        self.informationButton.layer.cornerRadius = kWIDTH / 8;
        self.informationButton.layer.masksToBounds = YES;
        [self addSubview:self.informationButton];
        
        UILabel *informationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kWIDTH / 4 - 20, kWIDTH / 4, 20)];
        informationLabel.text = @"资料";
        informationLabel.backgroundColor = [UIColor anheiColor];
        informationLabel.alpha = 0.8;
        informationLabel.textAlignment = NSTextAlignmentCenter;
        [self.informationButton addSubview:informationLabel];
        
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
