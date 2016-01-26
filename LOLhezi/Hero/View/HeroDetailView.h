//
//  HeroDetailView.h
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hero.h"

@interface HeroDetailView : UIView

@property (nonatomic, strong) Hero *hero;

@property (nonatomic, strong) UIButton *heroCompareButton;
@property (nonatomic, strong) UIButton *giftAndRuneButton;

@end
