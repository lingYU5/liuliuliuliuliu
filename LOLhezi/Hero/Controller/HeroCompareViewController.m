//
//  HeroCompareViewController.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/16.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroCompareViewController.h"
#import "HeroCompareImage.h"
#import "CompareTableView.h"
#import "AttributesCompare.h"
#import "SkillCompare.h"
#import "ChoseHeroViewController.h"
#import "UIButton+WebCache.h"
#import "NetHandler.h"

@interface HeroCompareViewController ()
@property (nonatomic, strong) Hero *hero;
@property (nonatomic, strong) HeroCompareImage *imageView;
@property (nonatomic, strong) CompareTableView *compare;
@property (nonatomic, strong) AttributesCompare *attribute;
@property (nonatomic, strong) SkillCompare *skillCompare;
@property (nonatomic, strong) HeroDetail *heroDetail2;

@end

@implementation HeroCompareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.imageView = [[HeroCompareImage alloc] initWithFrame:(CGRectMake(0, kHeight / 5.5, kWidth, kHeight / 6))];
    self.imageView.heroDetail = self.heroDetail;
    [self.imageView.enemyImage addTarget:self action:@selector(compareWithHero:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.imageView];
    
    
    UISegmentedControl *segmentC = [[UISegmentedControl alloc] initWithItems:@[@"属性", @"技能"]];
    segmentC.frame = CGRectMake(0, kHeight / 2.7, kWidth, 30);
    [segmentC addTarget:self action:@selector(changeView:) forControlEvents:UIControlEventValueChanged];
    segmentC.tintColor = [UIColor orangeColor];
    segmentC.selectedSegmentIndex = 0;
    [self.view addSubview:segmentC];
    
    
    self.attribute = [[AttributesCompare alloc] initWithFrame:CGRectMake(0, kHeight / 2.7 + 30, kWidth, kHeight / 2.7 * 1.7 - 30)];
    _attribute.tag = 12344;
    _attribute.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    self.attribute.heroDetail = self.heroDetail;
    
    
    
    
    self.skillCompare  = [[SkillCompare alloc] initWithFrame:CGRectMake(0, kHeight / 2.7 + 30, kWidth, kHeight / 2.7 * 1.7 - 30)];
    _skillCompare.tag = 12345;
    _skillCompare.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    _skillCompare.heroDetail = self.heroDetail;
    [self.view addSubview:_skillCompare];
    [self.view addSubview:self.attribute];
    
}
//  实现点击button进行选择对比英雄
- (void)compareWithHero:(UIButton *)button {
    ChoseHeroViewController *choseHeroVC = [[ChoseHeroViewController alloc] init];
    
    choseHeroVC.choseHero = ^void(Hero *hero) {
        self.hero = hero;
        
        [self.imageView.enemyImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kHeroHeadPortrait, hero.enName]] forState:UIControlStateNormal];
        [self getHeroDetailData];
        
    };
    
    [self.navigationController pushViewController:choseHeroVC animated:YES];
}

- (void)getHeroDetailData {
    [NetHandler getDataWithUrl:[NSString stringWithFormat:kHeroDetail, self.hero.enName] completion:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.heroDetail2 = [[HeroDetail alloc] initWithHero:self.hero];
        [self.heroDetail2 setValuesForKeysWithDictionary:dic];
        self.attribute.heroDetail2 = self.heroDetail2;
        self.skillCompare.heroDetail2 = self.heroDetail2;
    }];
}



//  实现UISegmentedControl方法
- (void)changeView:(UISegmentedControl *)segment {
    UIView *view = [self.view viewWithTag:12344 + segment.selectedSegmentIndex];
    [self.view bringSubviewToFront:view];
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
