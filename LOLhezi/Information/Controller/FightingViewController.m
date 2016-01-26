//
//  FightingViewController.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "FightingViewController.h"
#import "UserLoginView.h"
#import "NetHandler.h"
#import "Eara.h"
#import "QueryFightViewController.h"

@interface FightingViewController ()
@property (nonatomic, strong) UserLoginView *userLoginView;

@property (nonatomic, strong) NSMutableArray *earaArr;
@end

@implementation FightingViewController

- (void)getAllAreaData {
    [NetHandler getDataWithUrl:kAllArea completion:^(NSData *data) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.earaArr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in arr) {
            Eara *earaM = [[Eara alloc] init];
            [earaM setValuesForKeysWithDictionary:dic];
            [self.earaArr addObject:earaM];
        }
        self.userLoginView.earaArr = self.earaArr;
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getAllAreaData];
    self.userLoginView = [[UserLoginView alloc] initWithFrame:CGRectMake(0, kHeight / 5, kWidth, kHeight / 5 * 4)];
    [self.view addSubview:_userLoginView];
    
    UIButton *finishButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    finishButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 18 * 15, [UIScreen mainScreen].bounds.size.height / 25 * 3, [UIScreen mainScreen].bounds.size.width / 18 * 3, 30);
    [finishButton setTitle:@"完成" forState:UIControlStateNormal];
    [finishButton setTitleColor:[UIColor orangeColor] forState:(UIControlStateNormal)];
    [self.view addSubview:finishButton];
    
    [finishButton addTarget:self action:@selector(queryFighting:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
}

- (void)queryFighting:(UIButton *)button {
    QueryFightViewController *queryFVC = [[QueryFightViewController alloc] init];
    queryFVC.name = self.userLoginView.nameT.text;
    queryFVC.area = self.userLoginView.str;
    
//    NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
//    [uf setBool:YES forKey:@"login"];
//    [uf setObject:self.userLoginView.nameT.text forKey:@"user"];
//    [uf setObject:self.userLoginView.str forKey:@"area"];
    
    
//    BOOL isHeroTo = [uf boolForKey:@"myheroto"];
//    if (isHeroTo == YES) {
//        [self.navigationController popViewControllerAnimated:YES];
//        
//        
//    } else {
//        
//    [self.navigationController pushViewController:queryFVC animated:YES];
//    }
    [self.navigationController pushViewController:queryFVC animated:YES];
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
