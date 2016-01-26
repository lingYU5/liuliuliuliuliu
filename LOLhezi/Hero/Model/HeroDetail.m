//
//  HeroDetail.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/14.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroDetail.h"

@implementation HeroDetail

- (instancetype)initWithHero:(Hero *)hero {
    self = [super init];
    if (self) {
        _hero = hero;
    }
    return self;
}



- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"description"]) {
        self.description1 = value;
    }
    if ([key isEqualToString:@"id"]) {
        self.nameid = value;
    }
    if ([key isEqualToString:[NSString stringWithFormat:@"%@_B", self.hero.enName]]) {
        self.skill_B = [[Skill alloc] init];
        [self.skill_B setValuesForKeysWithDictionary:value];
    }
    if ([key isEqualToString:[NSString stringWithFormat:@"%@_Q", self.hero.enName]]) {
        self.skill_Q = [[Skill alloc] init];
        [self.skill_Q setValuesForKeysWithDictionary:value];
    }
    if ([key isEqualToString:[NSString stringWithFormat:@"%@_W", self.hero.enName]]) {
        self.skill_W = [[Skill alloc] init];
        [self.skill_W setValuesForKeysWithDictionary:value];
    }
    if ([key isEqualToString:[NSString stringWithFormat:@"%@_E", self.hero.enName]]) {
        self.skill_E = [[Skill alloc] init];
        [self.skill_E setValuesForKeysWithDictionary:value];
    }
    if ([key isEqualToString:[NSString stringWithFormat:@"%@_R", self.hero.enName]]) {
        self.skill_R = [[Skill alloc] init];
        [self.skill_R setValuesForKeysWithDictionary:value];
    }
}

@end
