//
//  HeroCollectionViewCell.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "Hero.h"

@interface HeroCollectionViewCell ()

@end

@implementation HeroCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH / 2 - 10, kWIDTH / 2 - 10)];
//        self.imageView.backgroundColor = [UIColor cyanColor];
        [self.contentView addSubview:self.imageView];
        
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH / 2 - 5, 0, kWIDTH / 2 + 5, kWIDTH / 7)];
        self.title.textColor = [UIColor whiteColor];
//        _title.adjustsFontSizeToFitWidth = YES; // 字体自适应
//        self.title.backgroundColor = [UIColor cyanColor];
        [self.contentView addSubview:self.title];
        
        self.cnName = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH / 2 - 5, kWIDTH / 7, kWIDTH / 2 + 5, kWIDTH / 7)];
        self.cnName.textColor = [UIColor whiteColor];
        _cnName.font = [UIFont systemFontOfSize:14];
//        self.cnName.backgroundColor = [UIColor cyanColor];
        [self.contentView addSubview:self.cnName];
        
        self.location = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH / 2 - 5, kWIDTH / 7 * 2, kWIDTH / 2 + 5, kWIDTH / 7)];
        self.location.textColor = [UIColor orangeColor];
        _location.font = [UIFont systemFontOfSize:14];
//        self.location.backgroundColor = [UIColor cyanColor];
        [self.contentView addSubview:self.location];
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        
    }
    return self;
}

- (void)setHero:(Hero *)hero {
    _hero = hero;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kHeroHeadPortrait, hero.enName]] placeholderImage:nil];
    _title.text = hero.title;
    _cnName.text = hero.cnName;
    _location.text = hero.location;
}


@end
