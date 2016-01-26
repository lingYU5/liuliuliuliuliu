//
//  GiftPicViewController.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "GiftPicViewController.h"
#import "UIImageView+WebCache.h"

@interface GiftPicViewController ()

@end

@implementation GiftPicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIScrollView *View = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kHeight / 5, kWidth, kHeight / 5 * 4)];
    View.pagingEnabled = YES;
    View.contentSize = CGSizeMake(2 * kWidth, 0);
    
    [self.view addSubview:View];
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight / 2)];
    [image sd_setImageWithURL:[NSURL URLWithString:self.gift.fuPic]];
    [View addSubview:image];
    
    UIImageView *image1 = [[UIImageView alloc] initWithFrame:CGRectMake(kWidth, 0, kWidth, kHeight / 2)];
    [image1 sd_setImageWithURL:[NSURL URLWithString:self.gift.tianPic]];
    [View addSubview:image1];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
