//
//  SkillCollectionViewCell.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "SkillCollectionViewCell.h"

@implementation SkillCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.skillImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width / 5, [UIScreen mainScreen].bounds.size.width / 5)];
        [self.contentView addSubview:_skillImage];
        
        self.skillName = [[UILabel alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.width / 5 + 20, [UIScreen mainScreen].bounds.size.width / 5, 30)];
        _skillName.textColor = [UIColor whiteColor];
//        self.skillName.font = [UIFont systemFontOfSize:13];
        self.skillName.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_skillName];
        
    }
    return self;
}

@end
