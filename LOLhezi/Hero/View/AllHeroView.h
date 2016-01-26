//
//  AllHeroView.h
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FreeHeroView;

@interface AllHeroView : UIView
@property (nonatomic, strong) FreeHeroView *freeHeroView;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UITextField *text;
@property (nonatomic, strong) NSMutableArray *allArr;
@end
