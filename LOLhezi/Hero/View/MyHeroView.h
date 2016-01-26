//
//  MyHeroView.h
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyHeroView : UIView

@property (nonatomic, strong) NSMutableArray *myHeroArr;
@property (nonatomic, copy) NSString *serverName;
@property (nonatomic, strong) UITableView *tableView;
@end
