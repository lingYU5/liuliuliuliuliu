//
//  EquipListCollectionViewCell.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "EquipListCollectionViewCell.h"


@implementation EquipListCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.equipImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width / 5, [UIScreen mainScreen].bounds.size.width / 5)];
        [self.contentView addSubview:_equipImage];
        
        self.equipName = [[UILabel alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.width / 5 + 20, [UIScreen mainScreen].bounds.size.width / 5, 20)];
        _equipName.textColor = [UIColor whiteColor];
        self.equipName.font = [UIFont systemFontOfSize:13];
        self.equipName.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_equipName];
        
    }
    return self;
}


@end
