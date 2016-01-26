//
//  KengdieViewController.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/21.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "KengdieViewController.h"

@interface KengdieViewController () <UIWebViewDelegate>

@end

@implementation KengdieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height / 5, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 5 * 4)];
    webView.delegate = self;
    
    
    [webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:kKengD] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15]];
    
    [self.view addSubview:webView];
    
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
