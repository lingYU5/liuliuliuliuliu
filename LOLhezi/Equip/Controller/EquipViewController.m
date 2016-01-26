//
//  EquipViewController.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "EquipViewController.h"
#import "EquipSort.h"
#import "NetHandler.h"
#import "EquipSortTableView.h"
#import "EquipListViewController.h"

@interface EquipViewController () <UITableViewDelegate>
@property (nonatomic, strong) EquipSort *equipSort;
@property (nonatomic, strong) NSMutableArray *equipSortArr;
@property (nonatomic, strong) EquipSortTableView *equipSortTableView;
@end

@implementation EquipViewController

- (void)getEquipSortData {
    [NetHandler getDataWithUrl:kEquipSort completion:^(NSData *data) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.equipSortArr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in arr) {
            EquipSort *equip = [[EquipSort alloc] init];
            [equip setValuesForKeysWithDictionary:dic];
            [self.equipSortArr addObject:equip];
        }
        self.equipSortTableView.equipSortArr = self.equipSortArr;
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getEquipSortData];
    
    self.equipSortTableView = [[EquipSortTableView alloc] initWithFrame:CGRectMake(0, kHeight / 5, kWidth, kHeight / 5 * 4)];
    self.equipSortTableView.delegate = self;
    [self.view addSubview:_equipSortTableView];
    
    
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    EquipListViewController *equipList = [[EquipListViewController alloc] init];
    equipList.equipSort = self.equipSortArr[indexPath.row];
    [self.navigationController pushViewController:equipList animated:YES];
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
