//
//  HeroDetailView.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroDetailView.h"
#import "UIImageView+WebCache.h"

@interface HeroDetailView ()

@property (nonatomic, strong) UIImageView *heroImage;
@property (nonatomic, strong) UILabel *cnName;
@property (nonatomic, strong) UILabel *price;
@property (nonatomic, strong) UILabel *rating;


@end

@implementation HeroDetailView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.heroImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, kWIDTH / 15, kWIDTH / 5, kWIDTH / 5)];
//        self.heroImage.backgroundColor = [UIColor cyanColor];
        [self addSubview:self.heroImage];
        
        self.cnName = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH / 5 + 30, kWIDTH / 15, kWIDTH / 5 * 2, kWIDTH / 15)];
        _cnName.textColor = [UIColor whiteColor];
//        self.cnName.backgroundColor = [UIColor cyanColor];
//        _cnName.font = [UIFont systemFontOfSize:14];
        [self addSubview:self.cnName];
        
        self.price = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH / 5 + 30, kWIDTH / 15 * 2, kWIDTH / 5 * 2, kWIDTH / 15)];
        _price.textColor = [UIColor whiteColor];
//        self.price.backgroundColor = [UIColor cyanColor];
        _price.font = [UIFont systemFontOfSize:14];
        [self addSubview:self.price];
        
        self.rating = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH / 5 +30, kWIDTH / 15 * 3, kWIDTH / 5 * 2, kWIDTH / 15)];
        _rating.textColor = [UIColor whiteColor];
//        self.rating.backgroundColor = [UIColor cyanColor];
        _rating.font = [UIFont systemFontOfSize:14];
        [self addSubview:self.rating];
        
        self.heroCompareButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        _heroCompareButton.layer.cornerRadius = 10;
        
        self.heroCompareButton.frame = CGRectMake(kWIDTH / 5 * 4 - 30, kWIDTH / 15, kWIDTH / 5, [UIScreen mainScreen].bounds.size.width / 12);
        self.heroCompareButton.backgroundColor = [UIColor orangeColor];
        [self.heroCompareButton setTitle:@"英雄对比" forState:(UIControlStateNormal)];
        [self addSubview:self.heroCompareButton];
        
        self.giftAndRuneButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        _giftAndRuneButton.layer.cornerRadius = 10;
        self.giftAndRuneButton.frame = CGRectMake(kWIDTH / 5 * 4 - 30, kWIDTH / 6, kWIDTH / 5, [UIScreen mainScreen].bounds.size.width / 12);
        [self.giftAndRuneButton setTitle:@"天赋符文" forState:(UIControlStateNormal)];
        self.giftAndRuneButton.backgroundColor = [UIColor orangeColor];
        [self addSubview:self.giftAndRuneButton];
        
    }
    return self;
}

- (void)setHero:(Hero *)hero {
    _hero = hero;
    [_heroImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kHeroHeadPortrait, hero.enName]] placeholderImage:nil];
    _cnName.text = hero.cnName;
    NSArray *strArr = [hero.price componentsSeparatedByString:@","];
    _price.text = [NSString stringWithFormat:@"金:%@,券:%@", strArr[0], strArr[1]];
    NSArray *arr = [hero.rating componentsSeparatedByString:@","];
    _rating.text = [NSString stringWithFormat:@"攻:%@防:%@法:%@难:%@", arr[0], arr[1], arr[2], arr[3]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
