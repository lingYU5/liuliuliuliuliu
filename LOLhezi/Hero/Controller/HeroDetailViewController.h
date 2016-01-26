//
//  HeroDetailViewController.h
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "BaseViewController.h"
#import "Hero.h"

@interface HeroDetailViewController : BaseViewController

@property (nonatomic, strong) Hero *hero;
@property (nonatomic, strong) NSMutableArray *allHero;
@end
