//
//  AppearEquipTableViewCell.h
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/15.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppearEquip.h"

@interface AppearEquipTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *serverLabel;
@property (nonatomic, strong) UILabel *authorLabel;

@property (nonatomic, strong) UIButton *equipButton1;
@property (nonatomic, strong) UIButton *equipButton2;
@property (nonatomic, strong) UIButton *equipButton3;
@property (nonatomic, strong) UIButton *equipButton4;
@property (nonatomic, strong) UIButton *equipButton5;
@property (nonatomic, strong) UIButton *equipButton6;


@property (nonatomic, strong) AppearEquip *appearEquip;

@end
