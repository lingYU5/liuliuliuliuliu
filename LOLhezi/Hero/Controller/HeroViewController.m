//
//  HeroViewController.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroViewController.h"
#import "UIColor+AddColor.h"
#import "FreeHeroView.h"
#import "AllHeroView.h"
#import "MyHeroView.h"
#import "NetHandler.h"
#import "Hero.h"
#import "HeroDetailViewController.h"
#import "FightingViewController.h"

@interface HeroViewController () <UICollectionViewDelegate, UITableViewDelegate>

@property (nonatomic, strong) FreeHeroView *freeView;
@property (nonatomic, strong) AllHeroView *allView;
@property (nonatomic, strong) MyHeroView *myView;

@property (nonatomic, strong) NSMutableArray *myArray;
@property (nonatomic, strong) NSMutableArray *freeArray;
@property (nonatomic, strong) NSMutableArray *allArray;
@property (nonatomic, assign) BOOL isSelect;
@property (nonatomic, strong) NSMutableArray *resultArr;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *area;
@property (nonatomic, copy) NSString *serverName;

@property (nonatomic, strong) UIView *loginView;
@property (nonatomic, strong) UIButton *button;

@end

@implementation HeroViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self getFreeHeroData];
    [self getAllHeroData];
    
    NSArray *array = @[@"周免英雄", @"我的英雄", @"全部英雄"];
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:array];
    segment.frame = CGRectMake(0, kHeight / 5, kWidth, 40);
    segment.selectedSegmentIndex = 0;
    segment.tintColor = [UIColor carrotColor];
    [self.view addSubview:segment];
    
    [segment addTarget:self action:@selector(changeController:) forControlEvents:UIControlEventValueChanged];
    
    
    self.freeView = [[FreeHeroView alloc] initWithFrame:CGRectMake(5, kHeight / 5 + 44, kWidth - 10, kHeight / 5 * 4 - 44)];
    self.freeView.tag = 100;
    self.freeView.collect.delegate = self;
    
    
    self.allView = [[AllHeroView alloc] initWithFrame:CGRectMake(5, kHeight / 5 + 44, kWidth - 10, kHeight / 5 * 4 - 44)];
    self.allView.tag = 102;
    [self.allView.button addTarget:self action:@selector(selectHero:) forControlEvents:UIControlEventTouchUpInside];
    [self.allView.text addTarget:self action:@selector(heroChange:) forControlEvents:UIControlEventEditingChanged];
    
    self.myView = [[MyHeroView alloc] initWithFrame:CGRectMake(0, kHeight / 5 + 44, kWidth, kHeight / 5 * 4 - 44)];
    self.myView.tableView.delegate = self;
    [self.view addSubview:_myView];
    
    // 使用bool值来判断button是否是搜索键或取消键
    self.isSelect = YES;
    [self.view addSubview:self.allView];
    
    
    
    self.loginView = [[UIView alloc] initWithFrame:CGRectMake(0, kHeight / 5 + 44, kWidth, kHeight / 5 * 4 - 44)];
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(30, 30, [UIScreen mainScreen].bounds.size.width - 60, 30)];
    [self.loginView addSubview:self.button];
    [self.button setTitle:@"请先登录" forState:(UIControlStateNormal)];
    [self.button setTitleColor:[UIColor cyanColor] forState:(UIControlStateNormal)];
    self.loginView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    [self.button addTarget:self action:@selector(userLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginView];
    
    NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
    BOOL yesOrN = [uf boolForKey:@"login"];
    if (yesOrN == YES) {
        self.myView.tag = 101;
        
    } else {
        self.loginView.tag = 101;
        
    }
    self.name = [uf objectForKey:@"user"];
    self.area = [uf objectForKey:@"area"];
    
    
    [self.view addSubview:self.freeView];
    
    [self getMyHeroData];
}


//  使用通知进入详情界面
- (void)goToDetail:(NSNotification *)noti {
    HeroDetailViewController *heroDetailVC = [[HeroDetailViewController alloc] init];
    AllHeroView *allView = (AllHeroView *)[self.view viewWithTag:102];
    NSDictionary *dic = noti.userInfo;
    if (self.isSelect == YES) {
        heroDetailVC.hero = self.allArray[[dic[@"index"] integerValue]];
    } else {
        heroDetailVC.hero = self.resultArr[[dic[@"index"] integerValue]];
    }
    
    if ([allView.text.text isEqualToString:@""] || allView.text.text == nil) {
        heroDetailVC.hero = self.allArray[[dic[@"index"] integerValue]];
        heroDetailVC.allHero = self.allArray;
    } else {
        heroDetailVC.hero = self.resultArr[[dic[@"index"] integerValue]];
        heroDetailVC.allHero = self.allArray;
    }
    
    
    [self.navigationController pushViewController:heroDetailVC animated:YES];
}

//  周免界面点击英雄跳转到英雄详情界面
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    HeroDetailViewController *heroDetailVC = [[HeroDetailViewController alloc] init];
    heroDetailVC.hero = self.freeArray[indexPath.item];
    heroDetailVC.allHero = self.allArray;
    [self.navigationController pushViewController:heroDetailVC animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HeroDetailViewController *heroDetailVC = [[HeroDetailViewController alloc] init];
    heroDetailVC.hero = self.myArray[indexPath.row];
    heroDetailVC.allHero = self.allArray;
    [self.navigationController pushViewController:heroDetailVC animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UIScreen mainScreen].bounds.size.width / 5 + 20;
}


//  在allView.text输入文本时进行实时响应,实时搜索  上面target:action要使用UIControlEventEditingChanged状态
- (void)heroChange:(UITextField *)text {
    AllHeroView *allView = (AllHeroView *)[self.view viewWithTag:102];
    self.resultArr = [NSMutableArray arrayWithCapacity:0];
    if ([allView.text.text isEqualToString:@""] || allView.text.text == nil) {
        allView.allArr = self.allArray;
    } else {
    for (Hero *hero in self.allArray) {
        if ([hero.enName containsString:allView.text.text]) {
            [self.resultArr addObject:hero];
        }
    }
    allView.allArr = self.resultArr;
    }
}
//  点击button搜索英雄
- (void)selectHero:(UIButton *)button {
    AllHeroView *allView = (AllHeroView *)[self.view viewWithTag:102];
    // 判断搜索框内内容是否为空
    if ([allView.text.text isEqualToString:@""] || allView.text.text == nil) {
        allView.allArr = self.allArray;
    } else {
    if (self.isSelect == YES) {
        self.resultArr = [NSMutableArray arrayWithCapacity:0];
        for (Hero *hero in self.allArray) {
            if ([hero.enName containsString:allView.text.text]) {
                [self.resultArr addObject:hero];
            }
        }
        [allView.button setTitle:@"取消" forState:(UIControlStateNormal)];
        allView.allArr = self.resultArr;
        self.isSelect = NO; // 将bool值手动变成NO表示现在是取消按钮
    } else {
        [allView.button setTitle:@"搜索" forState:(UIControlStateNormal)];
        allView.allArr = self.allArray;
        allView.text.text = @"";
        self.isSelect = YES; // 将bool值手动变成NO表示现在是搜索按钮
    }
    }
}

- (void)userLogin:(UIButton *)button {
    
//    NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
//    [uf setBool:YES forKey:@"myheroto"];
//    
//    self.myView.tag = 101;
//    
//    
//    FightingViewController *fightVC = [[FightingViewController alloc] init];
//    [self.navigationController pushViewController:fightVC animated:YES];
}

//  UISegmentedControl切换界面
- (void)changeController:(UISegmentedControl *)segment {
    UIView *view = [self.view viewWithTag:100 + segment.selectedSegmentIndex];
    [self.view bringSubviewToFront:view];
    
}
//  请求全部英雄数据
- (void)getAllHeroData {
    [NetHandler getDataWithUrl:kAllHeroURL completion:^(NSData *data) {
        self.allArray = [[NSMutableArray alloc] initWithCapacity:0];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray *array = [dic objectForKey:@"all"];
        for (NSDictionary *dict in array) {
            Hero *hero = [[Hero alloc] init];
            [hero setValuesForKeysWithDictionary:dict];
            [self.allArray addObject:hero];
        }
        self.allView.allArr = self.allArray;
    }];
    
}

//  请求周免英雄数据
- (void)getFreeHeroData {
    [NetHandler getDataWithUrl:kFreeHeroURL completion:^(NSData *data) {
        self.freeArray = [[NSMutableArray alloc] initWithCapacity:0];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray *array = [dic objectForKey:@"free"];
        for (NSDictionary *dict in array) {
            Hero *hero = [[Hero alloc] init];
            [hero setValuesForKeysWithDictionary:dict];
            [self.freeArray addObject:hero];
        }
        self.freeView.freeArr = self.freeArray;
    }];
}
//  请求我的英雄数据
- (void)getMyHeroData {
    [NetHandler getDataWithUrl:[NSString stringWithFormat:kMyHero, self.area, self.name] completion:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.myArray = [NSMutableArray arrayWithCapacity:0];
        NSMutableArray *array = [dic objectForKey:@"myHeroes"];
        for (NSDictionary *dict in array) {
            Hero *hero = [[Hero alloc] init];
            [hero setValuesForKeysWithDictionary:dict];
            [self.myArray addObject:hero];
        }
        self.serverName = [dic objectForKey:@"serverName"];
        
        self.myView.myHeroArr = self.myArray;
        self.myView.serverName = self.serverName;
    }];
}



//  在视图将要出现的时候添加一个观察者
- (void)viewWillAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(goToDetail:) name:@"进入详情界面" object:nil];
    
    
}
//  在视图将要消失的时候将通知中的一个消息移除
- (void)viewDidDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"进入详情界面" object:nil];
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
