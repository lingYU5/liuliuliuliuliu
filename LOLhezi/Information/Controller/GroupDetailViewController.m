//
//  GroupDetailViewController.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "GroupDetailViewController.h"
#import "GroupDetailTableView.h"

@interface GroupDetailViewController ()
@property (nonatomic, strong) GroupDetailTableView *groupDetailTableView;
@end

@implementation GroupDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.groupDetailTableView = [[GroupDetailTableView alloc] initWithFrame:CGRectMake(0, kHeight / 5, kWidth, kHeight / 5 * 4)];
    _groupDetailTableView.groupM = self.groupM;
    [self.view addSubview:_groupDetailTableView];
    
    
    
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
