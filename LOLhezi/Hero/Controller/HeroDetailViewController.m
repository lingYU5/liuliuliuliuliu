//
//  HeroDetailViewController.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroDetailViewController.h"
#import "HeroDetailView.h"
#import "SkillTableViewCell.h"
#import "UIButton+WebCache.h"
#import "NetHandler.h"
#import "HeroDetail.h"
#import "Skill.h"
#import "HeroRelationTableViewCell.h"
#import "HeroFigureTableViewCell.h"
#import "AppearEquipTableView.h"
#import "AppearEquip.h"
#import "HeroCompareViewController.h"
#import "HeroGiftRuneViewController.h"

@interface HeroDetailViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, copy) NSString *str;
@property (nonatomic, strong) HeroDetailView *heroDetailView;
@property (nonatomic, strong) AppearEquipTableView *appearEquip;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HeroDetail *heroDetail;
@property (nonatomic, strong) Skill *skill;
@property (nonatomic, strong) NSMutableArray *arr;
@property (nonatomic, strong) NSMutableArray *likeArr;
@property (nonatomic, strong) NSMutableArray *hateArr;
@property (nonatomic, strong) NSMutableArray *figureArr;

@end

@implementation HeroDetailViewController



- (void)getHeorDetailData {
    [NetHandler getDataWithUrl:[NSString stringWithFormat:kHeroDetail, self.hero.enName] completion:^(NSData *data) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        
        [self.heroDetail setValuesForKeysWithDictionary:dict];
        self.skill = self.heroDetail.skill_B;
        self.str = @"B";
        self.likeArr = [NSMutableArray arrayWithArray:self.heroDetail.like];
        self.hateArr = [NSMutableArray arrayWithArray:self.heroDetail.hate];
        self.figureArr = [NSMutableArray arrayWithArray:@[@"1", _heroDetail.range, _heroDetail.moveSpeed, _heroDetail.attackBase, _heroDetail.armorBase, _heroDetail.manaBase, _heroDetail.healthBase, _heroDetail.criticalChanceBase, _heroDetail.manaRegenBase, _heroDetail.healthRegenBase, _heroDetail.magicResistBase]];
        [self.tableView reloadData];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.heroDetail = [[HeroDetail alloc] initWithHero:self.hero];
    
    [self getHeorDetailData];
    
    self.heroDetailView = [[HeroDetailView alloc] initWithFrame:CGRectMake(0, kHeight / 5.5, kWidth, kHeight / 6)];
    [self.heroDetailView.heroCompareButton addTarget:self action:@selector(heroCompare:) forControlEvents:UIControlEventTouchUpInside];
    [self.heroDetailView.giftAndRuneButton addTarget:self action:@selector(heroGiftAndRune:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.heroDetailView];
    self.heroDetailView.hero = self.hero;
    
    
    UISegmentedControl *segmentC = [[UISegmentedControl alloc] initWithItems:@[@"资料", @"出装"]];
    segmentC.frame = CGRectMake(0, kHeight / 5.6 * 2, kWidth, 30);
    [segmentC addTarget:self action:@selector(changeView:) forControlEvents:UIControlEventValueChanged];
    segmentC.tintColor = [UIColor cyanColor];
    segmentC.selectedSegmentIndex = 0;
    [self.view addSubview:segmentC];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kHeight / 2.8 + 30, kWidth, kHeight / 2.8 * 1.8 - 30) style:(UITableViewStylePlain)];
    

    
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tag = 2889;
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    
    
    self.appearEquip = [[AppearEquipTableView alloc] initWithFrame:CGRectMake(0, kHeight / 2.8 + 30, kWidth, kHeight / 2.8 * 1.8 - 30)];
    self.appearEquip.tag = 2890;
    self.appearEquip.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    self.appearEquip.hero = self.hero;
    [self.view addSubview:self.appearEquip];
    [self.view addSubview:self.tableView];
}
- (void)changeView:(UISegmentedControl *)segment {
    UITableView *tableView = [self.view viewWithTag:2889 + segment.selectedSegmentIndex];
    [self.view bringSubviewToFront:tableView];
}

//  每个分区的标题名
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSArray *headerTitle = @[@"技能说明", @"最佳搭档", @"最佳克制", @"使用技巧", @"应对技巧", @"英雄数据", @"英雄背景"];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 30)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, kWidth, 30)];
    label.text = headerTitle[section];
    label.textColor = [UIColor orangeColor];
    [view addSubview:label];
    return view;
    
}
//  每个分区标题的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}
//  设置分区标题不悬停
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat sectionHeaderHeight = 40;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }
    else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}
//  返回多少个分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 7;
}

#pragma mark -- UITableViewDataSource -----
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 2;
    } else if (section == 2) {
        return 2;
    } else if (section == 3) {
        return 1;
    } else if (section == 4) {
        return 1;
    } else if (section == 5) {
        return 12;
    } else if (section == 6) {
        return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
    
    
    SkillTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[SkillTableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
        NSArray *array = @[cell.buttonB, cell.buttonQ, cell.buttonW, cell.buttonE, cell.buttonR];
        NSArray *arr = @[@"B", @"Q", @"W", @"E", @"R"];
        for (int i = 0; i < 5; i++) {
            [array[i] sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kHeroSkill, self.hero.enName, arr[i]]] forState:(UIControlStateNormal)];
            [array[i] addTarget:self action:@selector(changeSkill:) forControlEvents:(UIControlEventTouchUpInside)];
        }
        cell.str = self.str;
        cell.skill = self.skill;
        return cell;
        
        
    } else if (indexPath.section == 1 || indexPath.section == 2) {
        
        HeroRelationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"partner"];
        if (!cell) {
            cell = [[HeroRelationTableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"partner"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        if (indexPath.section == 1) {
            dict = self.likeArr[indexPath.row];
        } else {
            dict = self.hateArr[indexPath.row];
        }
        

        NSString *str = [dict objectForKey:@"partner"];
        NSString *des = [dict objectForKey:@"des"];
        
        if (indexPath.section == 1) {
            cell.partnerImage.tag = 4000 + indexPath.row;
        } else if (indexPath.section == 2) {
            cell.partnerImage.tag = 4002 + indexPath.row;
        }
        [cell.partnerImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kHeroHeadPortrait, str]] forState:(UIControlStateNormal)];
        [cell.partnerImage addTarget:self action:@selector(goToHeroDetail:) forControlEvents:UIControlEventTouchUpInside];
        
        cell.des.text = des;
        cell.backgroundColor = [UIColor clearColor];
        return cell;

    } else if (indexPath.section == 3 || indexPath.section == 4 || indexPath.section == 6) {
        
        NSArray *array = @[self.heroDetail.tips, self.heroDetail.opponentTips, self.heroDetail.description1];
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"111"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"111"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        if (indexPath.section == 3) {
            cell.textLabel.text = array[0];
        } else if (indexPath.section == 4) {
            cell.textLabel.text = array[1];
        } else {
            cell.textLabel.text = array[2];
        }
        cell.textLabel.textColor = [UIColor cyanColor];
        cell.textLabel.numberOfLines = 0;
        cell.backgroundColor = [UIColor clearColor];
        return cell;

    } else if (indexPath.section == 5 && indexPath.row == 0) {
        
        
        HeroFigureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"figure"];
        if (!cell) {
            cell = [[HeroFigureTableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"figure"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.backgroundColor = [UIColor clearColor];
        [cell.slider addTarget:self action:@selector(changeHeroFigure:) forControlEvents:UIControlEventValueChanged];
        return cell;
    } else if (indexPath.section == 5 && indexPath.row != 0) {
        
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"111"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"111"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        NSArray *arr = @[@"等级:", @"攻击距离:", @"移动速度:", @"基础攻击:", @"基础防御:", @"基础魔法值:", @"基础生命值:", @"暴击几率:", @"魔法回复:", @"生命回复:", @"魔法抗性:"];
        NSArray *array1 = @[@"", @"", @"", _heroDetail.attackLevel, _heroDetail.armorLevel, _heroDetail.manaLevel, _heroDetail.healthLevel, _heroDetail.criticalChanceLevel, _heroDetail.manaRegenLevel, _heroDetail.healthRegenLevel, _heroDetail.magicResistLevel];
        if (indexPath.row <= 3) {
            cell.textLabel.text = [NSString stringWithFormat:@"%@  %@", arr[(indexPath.row) - 1], _figureArr[(indexPath.row) - 1]];
        } else {
        cell.textLabel.text = [NSString stringWithFormat:@"%@  %@(+%@/每级)", arr[(indexPath.row) - 1], _figureArr[(indexPath.row) - 1], array1[(indexPath.row) - 1]];
        }
        cell.textLabel.textColor = [UIColor cyanColor];
        cell.textLabel.numberOfLines = 0;
        cell.backgroundColor = [UIColor clearColor];
        return cell;
    }
    return nil;
}
//  设置每个cell的自适应高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
    if (indexPath.section == 0) {
        CGRect rect = [self.skill.description1 boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width / 8 * 7 - 30, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
        CGRect rect1 = [self.skill.effect boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width / 8 * 7 - 30, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
        return 30 * 4 + 5 * 10 + [UIScreen mainScreen].bounds.size.width / 7 + rect.size.height + rect1.size.height;
    } else if (indexPath.section == 1 || indexPath.section == 2) {
        NSString *str;
        if (indexPath.section == 1) {
            str = [self.heroDetail.like[indexPath.row] objectForKey:@"des"];
        } else {
            str = [self.heroDetail.hate[indexPath.row] objectForKey:@"des"];
        }
        CGRect rect = [str boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width / 5 * 4 - 40, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
        if (rect.size.height < [UIScreen mainScreen].bounds.size.width / 5) {
            return [UIScreen mainScreen].bounds.size.width / 5 + 50;
        }
        return rect.size.height + 50;

    } else if (indexPath.section == 3 || indexPath.section == 4 || indexPath.section == 6) {
        NSString *str;
        if (indexPath.section == 3) {
            str = self.heroDetail.tips;
        } else if (indexPath.section == 4) {
            str = self.heroDetail.opponentTips;
        } else {
            str = self.heroDetail.description1;
        }
        CGRect rect = [str boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width / 8 * 6.7 - 30, 3000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
        return rect.size.height;
    } else if (indexPath.section == 5 && indexPath.row == 0) {
        return 50;
    }
    return 30;
}

//  实现slider的方法
- (void)changeHeroFigure:(UISlider *)slider {
    int a = (int)slider.value;
  
    NSArray *array = @[@"1", _heroDetail.range, _heroDetail.moveSpeed, _heroDetail.attackBase, _heroDetail.armorBase, _heroDetail.manaBase, _heroDetail.healthBase, _heroDetail.criticalChanceBase, _heroDetail.manaRegenBase, _heroDetail.healthRegenBase, _heroDetail.magicResistBase];
    NSArray *array1 = @[@"1", @"", @"", _heroDetail.attackLevel, _heroDetail.armorLevel, _heroDetail.manaLevel, _heroDetail.healthLevel, _heroDetail.criticalChanceLevel, _heroDetail.manaRegenLevel, _heroDetail.healthRegenLevel, _heroDetail.magicResistLevel];
    for (int i = 0; i < 11; i++) {
        
        NSString *figure;
        float a1 = [array[i] floatValue];
        float a2 = [array1[i] floatValue];
        
        if (i == 0) {
            int a3 = (int)a1 + a2 * a;
            figure = [NSString stringWithFormat:@"%d", a3];
        } else {
        figure = [NSString stringWithFormat:@"%.2f", a1 + a2 * a];
        }
        _figureArr[i] = figure;
    }

    [_tableView reloadData];
}
//  实现更改技能button的方法
- (void)changeSkill:(UIButton *)button {
    if (button.tag == 2000) {
        self.skill = self.heroDetail.skill_B;
        self.str = @"B";
        [self.tableView reloadData];
    } else if (button.tag == 2001) {
        self.skill = self.heroDetail.skill_Q;
        self.str = @"Q";
        [self.tableView reloadData];
    } else if (button.tag == 2002) {
        self.skill = self.heroDetail.skill_W;
        self.str = @"W";
        [self.tableView reloadData];
    } else if (button.tag == 2003) {
        self.skill = self.heroDetail.skill_E;
        self.str = @"E";
        [self.tableView reloadData];
    } else if (button.tag == 2004) {
        self.skill = self.heroDetail.skill_R;
        self.str = @"R";
        [self.tableView reloadData];
    }
}
//***************有问题!!!Model类不能直接对另一个Model赋值吗?*******************************
- (void)goToHeroDetail:(UIButton *)button {
    
    
    if (button.tag == 4000) {
        self.hero.enName = [self.heroDetail.like[0] objectForKey:@"partner"];
    } else if (button.tag == 4001) {
        self.hero.enName = [self.heroDetail.like[1] objectForKey:@"partner"];
    } else if (button.tag == 4002) {
        self.hero.enName = [self.heroDetail.hate[0] objectForKey:@"partner"];
    } else if (button.tag == 4003) {
        self.hero.enName = [self.heroDetail.hate[1] objectForKey:@"partner"];
    }
        [self getHeorDetailData];
        for (Hero *hero in self.allHero) {
            if ([self.hero.enName isEqualToString:hero.enName]) {
                
                _hero.enName = hero.enName;
                _hero.cnName = hero.cnName;
                _hero.price = hero.price;
                _hero.tags = hero.tags;
                _hero.title = hero.title;
                _hero.rating = hero.rating;
                _hero.location = hero.location;
            }
        }
        self.heroDetailView.hero = self.hero;
        self.appearEquip.hero = self.hero;
        [_tableView reloadData];
        NSLog(@"1");
    }

//  界面push 不知道为什么button对不上号...*********************************************
//        HeroDetailViewController *thisVC = [[HeroDetailViewController alloc] init];
//        self.hero.enName = [self.heroDetail.like[1] objectForKey:@"partner"];
//        for (Hero *hero in self.allHero) {
//            if ([self.hero.enName isEqualToString:hero.enName]) {
//                _hero.enName = hero.enName;
//                _hero.cnName = hero.cnName;
//                _hero.price = hero.price;
//            }
//        }
//        thisVC.hero = _hero;
//        thisVC.allHero = _allHero;
//        self.heroDetailView.hero = _hero;
//        [self.navigationController pushViewController:thisVC animated:YES];
//}
//  *************************************************************************

//*********************************************************************************
//  实现点击英雄对比button
- (void)heroCompare:(UIButton *)button {
    HeroCompareViewController *heroCompareVC = [[HeroCompareViewController alloc] init];
    heroCompareVC.heroDetail = self.heroDetail;
    [self.navigationController pushViewController:heroCompareVC animated:YES];
}
//  实现点击英雄天赋符文
- (void)heroGiftAndRune:(UIButton *)button {
    HeroGiftRuneViewController *heroGiftRuneVC = [[HeroGiftRuneViewController alloc] init];
    heroGiftRuneVC.hero = self.hero;
    [self.navigationController pushViewController:heroGiftRuneVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setAllHero:(NSMutableArray *)allHero {
    _allHero = allHero;
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
