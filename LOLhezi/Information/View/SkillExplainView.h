//
//  SkillExplainView.h
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SummonerSkill.h"

@interface SkillExplainView : UIView
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) SummonerSkill *skill;
@end
