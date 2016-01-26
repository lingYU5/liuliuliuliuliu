//
//  EquipDetail.h
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EquipDetail : NSObject

@property (nonatomic, copy) NSString *equipID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *description2;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *allPrice;
@property (nonatomic, copy) NSString *sellPrice;
@property (nonatomic, copy) NSString *tags;
@property (nonatomic, strong) NSMutableDictionary *extAttrs;
@property (nonatomic, copy) NSString *need;
@property (nonatomic, copy) NSString *compose;
@property (nonatomic, copy) NSString *extDesc;

@end
