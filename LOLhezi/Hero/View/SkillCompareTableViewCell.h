//
//  SkillCompareTableViewCell.h
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Skill.h"

@interface SkillCompareTableViewCell : UITableViewCell
@property (nonatomic, copy) NSString *str;
@property (nonatomic, strong) Skill *skill;

@property (nonatomic, strong) UIButton *mySkill;
@property (nonatomic, strong) UIButton *enemySkill;
@property (nonatomic, strong) UILabel *skillID;

@property (nonatomic, strong) UIImageView *myImage;
@property (nonatomic, strong) UIImageView *enemyImage;

@end
