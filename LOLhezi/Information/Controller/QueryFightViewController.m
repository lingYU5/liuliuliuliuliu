//
//  QueryFightViewController.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "QueryFightViewController.h"

@interface QueryFightViewController () <UIWebViewDelegate>

@end

@implementation QueryFightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height / 5, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 5 * 4)];
    webView.delegate = self;
    
    
    [webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:kFighting, [self.area stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]], [self.name stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]]] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15]];
    
    [self.view addSubview:webView];
    
    UIButton *registButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    registButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 18 * 15, [UIScreen mainScreen].bounds.size.height / 25 * 3, [UIScreen mainScreen].bounds.size.width / 18 * 3, 30);
    [registButton setTitle:@"注销" forState:UIControlStateNormal];
    [registButton setTitleColor:[UIColor orangeColor] forState:(UIControlStateNormal)];
    [self.view addSubview:registButton];
    
    [registButton addTarget:self action:@selector(backFighting:) forControlEvents:UIControlEventTouchUpInside];
    
    NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
    [uf setBool:YES forKey:@"login"];
    [uf setObject:self.name forKey:@"user"];
    [uf setObject:self.area forKey:@"area"];
    
}

- (void)backFighting:(UIButton *)button {
    NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
    [uf setBool:NO forKey:@"login"];
    
    [self.navigationController popViewControllerAnimated:YES];
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
