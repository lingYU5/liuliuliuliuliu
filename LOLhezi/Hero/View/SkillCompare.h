//
//  SkillCompare.h
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroDetail.h"

@interface SkillCompare : UITableView
@property (nonatomic, strong) HeroDetail *heroDetail;
@property (nonatomic, strong) HeroDetail *heroDetail2;
@end
