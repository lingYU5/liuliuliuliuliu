//
//  HeroDetail.h
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/14.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Skill.h"
#import "Hero.h"

@interface HeroDetail : NSObject

- (instancetype)initWithHero:(Hero *)hero;
@property (nonatomic, strong) Hero *hero;

@property(nonatomic, copy) NSString *nameid;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *displayName;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *iconPath;
@property(nonatomic, copy) NSString *portraitPath;
@property(nonatomic, copy) NSString *splashPath;
@property(nonatomic, copy) NSString *tags;
@property(nonatomic, copy) NSString *description1;
@property(nonatomic, copy) NSString *quote;
@property(nonatomic, copy) NSString *quoteAuthor;
@property(nonatomic, copy) NSString *range;
@property(nonatomic, copy) NSString *moveSpeed;
@property(nonatomic, copy) NSString *armorBase;
@property(nonatomic, copy) NSString *armorLevel;
@property(nonatomic, copy) NSString *manaBase;
@property(nonatomic, copy) NSString *manaLevel;
@property(nonatomic, copy) NSString *criticalChanceBase;
@property(nonatomic, copy) NSString *criticalChanceLevel;
@property(nonatomic, copy) NSString *manaRegenBase;
@property(nonatomic, copy) NSString *manaRegenLevel;
@property(nonatomic, copy) NSString *healthRegenBase;
@property(nonatomic, copy) NSString *healthRegenLevel;
@property(nonatomic, copy) NSString *magicResistBase;
@property(nonatomic, copy) NSString *magicResistLevel;
@property(nonatomic, copy) NSString *healthBase;
@property(nonatomic, copy) NSString *healthLevel;
@property(nonatomic, copy) NSString *attackBase;
@property(nonatomic, copy) NSString *attackLevel;
@property(nonatomic, copy) NSString *ratingDefense;
@property(nonatomic, copy) NSString *ratingMagic;
@property(nonatomic, copy) NSString *ratingDifficulty;
@property(nonatomic, copy) NSString *ratingAttack;
@property(nonatomic, copy) NSString *tips;
@property(nonatomic, copy) NSString *opponentTips;
@property(nonatomic, retain) Skill *skill_B;
@property(nonatomic, retain) Skill *skill_Q;
@property(nonatomic, retain) Skill *skill_W;
@property(nonatomic, retain) Skill *skill_E;
@property(nonatomic, retain) Skill *skill_R;
@property(nonatomic, retain) NSArray *like;
@property(nonatomic, retain) NSArray *hate;

@end
