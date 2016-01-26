//
//  ChoseHeroViewController.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "ChoseHeroViewController.h"
#import "AllHeroView.h"
#import "NetHandler.h"
#import "Hero.h"

@interface ChoseHeroViewController ()
@property (nonatomic, strong) NSMutableArray *allHeroArray;
@property (nonatomic, strong) AllHeroView *all;
@end

@implementation ChoseHeroViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(choseHero:) name:@"进入详情界面" object:nil];
}




- (void)choseHero:(NSNotification *)notifi {
    NSDictionary *dic = notifi.userInfo;
    NSInteger i = [dic[@"index"] integerValue];
    self.choseHero(self.allHeroArray[i]);
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getAllHeroData];
    
    self.all = [[AllHeroView alloc] initWithFrame:CGRectMake(5, kHeight / 5, kWidth - 10, kHeight / 5 * 4 - 44)];
    self.all.allArr = self.allHeroArray;
    [self.view addSubview:self.all];
    
    
    
    
    
    
    
}

- (void)getAllHeroData {
    [NetHandler getDataWithUrl:kAllHeroURL completion:^(NSData *data) {
        NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *all = [dict objectForKey:@"all"];
        self.allHeroArray = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in all) {
            Hero *hero = [[Hero alloc] init];
            [hero setValuesForKeysWithDictionary:dic];
            [self.allHeroArray addObject:hero];
            
        }
        self.all.allArr = self.allHeroArray;
    }];
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
