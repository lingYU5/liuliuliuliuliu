//
//  Skill.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/14.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "Skill.h"

@implementation Skill

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        self.skillId = value;
    }
    if ([key isEqualToString:@"description"]) {
        self.description1 = value;
    }
}




@end
