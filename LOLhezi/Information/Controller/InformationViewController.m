//
//  InformationViewController.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "InformationViewController.h"
#import "InformationView.h"
#import "GameEncyclopediaViewController.h"
#import "FightingViewController.h"
#import "QueryFightViewController.h"
#import "KengdieViewController.h"

@interface InformationViewController ()
@property (nonatomic, strong) InformationView *informationView;
@end

@implementation InformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.informationView = [[InformationView alloc] initWithFrame:CGRectMake(0, kHeight / 5, kWidth, kHeight / 5 * 4)];
    [self.view addSubview:_informationView];
    
    [self.informationView.fightingButton addTarget:self action:@selector(goTofighting:) forControlEvents:UIControlEventTouchUpInside];
    [self.informationView.gameEncyclopediaButton addTarget:self action:@selector(goToGameEncyclopedia:) forControlEvents:UIControlEventTouchUpInside];
    [self.informationView.happyTimeButton addTarget:self action:@selector(goToHappyTimes:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)goToHappyTimes:(UIButton *)button {
    KengdieViewController *kengDVC = [[KengdieViewController alloc] init];
    [self.navigationController pushViewController:kengDVC animated:YES];
}

- (void)goTofighting:(UIButton *)button {
    NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
//    [uf setBool:NO forKey:@"myheroto"];
    BOOL yesOrNo = [uf boolForKey:@"login"];
    if (yesOrNo == YES) {
        QueryFightViewController *queryFVC = [[QueryFightViewController alloc] init];
        queryFVC.area = [uf objectForKey:@"area"];
        queryFVC.name = [uf objectForKey:@"user"];

        [self.navigationController pushViewController:queryFVC animated:YES];
    } else {
    
    FightingViewController *fightingVC = [[FightingViewController alloc] init];
    [self.navigationController pushViewController:fightingVC animated:YES];
    }
}
- (void)goToGameEncyclopedia:(UIButton *)button {
    GameEncyclopediaViewController *gameEncyclopediaVC = [[GameEncyclopediaViewController alloc] init];
    [self.navigationController pushViewController:gameEncyclopediaVC animated:YES];
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
