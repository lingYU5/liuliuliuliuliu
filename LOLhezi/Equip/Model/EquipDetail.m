//
//  EquipDetail.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "EquipDetail.h"

@implementation EquipDetail

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        self.equipID = value;
    }
    if ([key isEqualToString:@"description"]) {
        self.description2 = value;
    }
}

@end
