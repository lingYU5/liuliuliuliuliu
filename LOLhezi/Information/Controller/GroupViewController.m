//
//  GroupViewController.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "GroupViewController.h"
#import "GroupTableView.h"
#import "NetHandler.h"
#import "Group.h"
#import "GroupDetailViewController.h"

@interface GroupViewController () <UITableViewDelegate>
@property (nonatomic, strong) GroupTableView *groupTableView;
@property (nonatomic, strong) NSMutableArray *groupArr;
@end

@implementation GroupViewController

- (void)getGroupData {
    [NetHandler getDataWithUrl:kGroup completion:^(NSData *data) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.groupArr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in arr) {
            Group *groupM = [[Group alloc] init];
            [groupM setValuesForKeysWithDictionary:dic];
            [self.groupArr addObject:groupM];
        }
        self.groupTableView.groupArr = self.groupArr;
        [self.groupTableView reloadData];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getGroupData];
    
    self.groupTableView = [[GroupTableView alloc] initWithFrame:CGRectMake(0, kHeight / 5, kWidth, kHeight / 5 * 4)];
    self.groupTableView.delegate = self;
    [self.view addSubview:_groupTableView];
    
    
    
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GroupDetailViewController *groupDetailVC = [[GroupDetailViewController alloc] init];
    
    groupDetailVC.groupM = self.groupArr[indexPath.row];
    
    [self.navigationController pushViewController:groupDetailVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
    Group *groupM = self.groupArr[indexPath.row];
    CGRect rect = [groupM.des boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 30, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    return rect.size.height + [UIScreen mainScreen].bounds.size.width / 6 + 60;
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
