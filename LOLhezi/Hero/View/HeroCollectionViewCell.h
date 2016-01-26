//
//  HeroCollectionViewCell.h
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Hero;
@interface HeroCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *cnName;
@property (nonatomic, strong) UILabel *location;
@property (nonatomic, strong) Hero *hero;

@end
