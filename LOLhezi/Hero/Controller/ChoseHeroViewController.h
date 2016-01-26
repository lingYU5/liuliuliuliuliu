//
//  ChoseHeroViewController.h
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "BaseViewController.h"
@class Hero;



@interface ChoseHeroViewController : BaseViewController
@property (nonatomic, copy) void (^choseHero)(Hero *hero);
@end
