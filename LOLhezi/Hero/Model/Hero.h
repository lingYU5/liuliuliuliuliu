//
//  Hero.h
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hero : NSObject

@property (nonatomic, copy) NSString *enName; // 英文名字
@property (nonatomic, copy) NSString *cnName; // 中文名字
@property (nonatomic, copy) NSString *title; // 英雄标题
@property (nonatomic, copy) NSString *tags; // tag值,用来拼接
@property (nonatomic, copy) NSString *rating; // 英雄难度
@property (nonatomic, copy) NSString *location; // 英雄定位
@property (nonatomic, copy) NSString *price; // 英雄价格

@property (nonatomic, copy) NSString *presentTimes; // 场次

@end
