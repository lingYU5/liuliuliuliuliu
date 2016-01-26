//
//  Base.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "Base.h"

@implementation Base

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT / 5)];
        [topImageView setImage:[UIImage imageNamed:@"main.jpg"]];
        [self addSubview:topImageView];
        
        UIImageView *belowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, kHEIGHT / 5, kWIDTH, kHEIGHT / 5 * 4)];
        [belowImageView setImage:[UIImage imageNamed:@"huise.jpg"]];
        [self addSubview:belowImageView];
        
        self.backButton = [[UIButton alloc] initWithFrame:CGRectMake(kWIDTH / 18, kHEIGHT / 5 / 5 * 3, kWIDTH / 15, kHEIGHT / 22)];
        [self.backButton setImage:[UIImage imageNamed:@"small.png"] forState:(UIControlStateNormal)];
        [self addSubview:self.backButton];
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
