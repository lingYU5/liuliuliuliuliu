//
//  SummonerSkill.h
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SummonerSkill : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *Id;
@property (nonatomic, copy) NSString *level;
@property (nonatomic, copy) NSString *cooldown;
@property (nonatomic, copy) NSString *des;
@property (nonatomic, copy) NSString *strong;
@property (nonatomic, copy) NSString *tips;

@end
