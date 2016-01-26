//
//  Skill.h
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/14.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Skill : NSObject

@property (nonatomic, copy) NSString *skillId; // 技能id
@property (nonatomic, copy) NSString *name; // 技能名称
@property (nonatomic, copy) NSString *cost; // 技能消耗
@property (nonatomic, copy) NSString *cooldown; // 技能冷却
@property (nonatomic, copy) NSString *description1; // 技能描述
@property (nonatomic, copy) NSString *range; // 范围
@property (nonatomic, copy) NSString *effect; // 影响

@end
