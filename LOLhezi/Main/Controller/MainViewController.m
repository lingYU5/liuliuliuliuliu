//
//  MainViewController.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"
#import "HeroViewController.h"
#import "EquipViewController.h"
#import "InformationViewController.h"

@interface MainViewController ()
@property (nonatomic, strong) MainView *mainView;
@end

@implementation MainViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [UIView animateKeyframesWithDuration:1 delay:0 options:UIViewKeyframeAnimationOptionAllowUserInteraction animations:^{
        [UIView setAnimationRepeatCount:MAXFLOAT];
        [UIView setAnimationRepeatAutoreverses:YES];

        self.mainView.heroButton.transform = CGAffineTransformMakeRotation(M_PI/ 6);
        self.mainView.heroButton.transform = CGAffineTransformMakeRotation(0);
        self.mainView.equipButton.transform = CGAffineTransformMakeRotation(-M_PI/ 6);
        self.mainView.equipButton.transform = CGAffineTransformMakeRotation(0);
        self.mainView.informationButton.transform = CGAffineTransformMakeRotation(-M_PI/6);
        self.mainView.informationButton.transform = CGAffineTransformMakeRotation(M_PI/6);
    } completion:nil];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.hidden = YES;
    
    self.mainView = [[MainView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    [self.view addSubview:self.mainView];
    
    [self.mainView.heroButton addTarget:self action:@selector(goToHero:) forControlEvents:UIControlEventTouchUpInside];
    [self.mainView.equipButton addTarget:self action:@selector(goToEquip:) forControlEvents:UIControlEventTouchUpInside];
    [self.mainView.informationButton addTarget:self action:@selector(goToInformation:) forControlEvents:UIControlEventTouchUpInside];
    
}
//  点击进入英雄界面
- (void)goToHero:(UIButton *)button {
    HeroViewController *heroVC = [[HeroViewController alloc] init];
    [self.navigationController pushViewController:heroVC animated:YES];
}
//  点击进入装备界面
- (void)goToEquip:(UIButton *)button {
    EquipViewController *equipVC = [[EquipViewController alloc] init];
    [self.navigationController pushViewController:equipVC animated:YES];
}
//  点击进入资料界面
- (void)goToInformation:(UIButton *)button {
    InformationViewController *informationVC = [[InformationViewController alloc] init];
    [self.navigationController pushViewController:informationVC animated:YES];
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
