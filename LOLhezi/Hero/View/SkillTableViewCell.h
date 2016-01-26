//
//  SkillTableViewCell.h
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/14.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Skill.h"

@interface SkillTableViewCell : UITableViewCell

@property (nonatomic, copy) NSString *str;
@property (nonatomic, strong) Skill *skill;


@property (nonatomic, strong) UIButton *buttonB;
@property (nonatomic, strong) UIButton *buttonQ;
@property (nonatomic, strong) UIButton *buttonW;
@property (nonatomic, strong) UIButton *buttonE;
@property (nonatomic, strong) UIButton *buttonR;
@property (nonatomic, strong) UIView *imageB;
@property (nonatomic, strong) UIView *imageQ;
@property (nonatomic, strong) UIView *imageW;
@property (nonatomic, strong) UIView *imageE;
@property (nonatomic, strong) UIView *imageR;

@property (nonatomic, strong) UILabel *skillName;
@property (nonatomic, strong) UILabel *cost;
@property (nonatomic, strong) UILabel *descrip;
@property (nonatomic, strong) UILabel *cooldown;
@property (nonatomic, strong) UILabel *range;
@property (nonatomic, strong) UILabel *effect;



@end
