//
//  GameEncyclopediaViewController.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "GameEncyclopediaViewController.h"
#import "GameEncyclopediaView.h"
#import "RuneViewController.h"
#import "GroupViewController.h"
#import "SkillViewController.h"
#import "EquipViewController.h"

@interface GameEncyclopediaViewController () <UITableViewDelegate>

@property (nonatomic, strong) GameEncyclopediaView *gameEncyclopediaView;

@end

@implementation GameEncyclopediaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.gameEncyclopediaView = [[GameEncyclopediaView alloc] initWithFrame:CGRectMake(0, kHeight / 5, kWidth, kHeight / 5 * 4)];
    self.gameEncyclopediaView.delegate = self;
    [self.view addSubview:_gameEncyclopediaView];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 2) {
        RuneViewController *runeVC = [[RuneViewController alloc] init];
        [self.navigationController pushViewController:runeVC animated:YES];
    } else if (indexPath.row == 3) {
        GroupViewController *groupVC = [[GroupViewController alloc] init];
        [self.navigationController pushViewController:groupVC animated:YES];
    } else if (indexPath.row == 4) {
        SkillViewController *skillVC = [[SkillViewController alloc] init];
        [self.navigationController pushViewController:skillVC animated:YES];
    } else if (indexPath.row == 0) {
        EquipViewController *equipVC = [[EquipViewController alloc] init];
        [self.navigationController pushViewController:equipVC animated:YES];
    }
    
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
