//
//  EquipDetailViewController.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "EquipDetailViewController.h"
#import "EquipDetailView.h"
#import "NetHandler.h"
#import "EquipDetail.h"

@interface EquipDetailViewController ()

@property (nonatomic, strong) EquipDetailView *equipDetailView;
@property (nonatomic, strong) EquipDetail *equipDetailM;
@end

@implementation EquipDetailViewController

- (void)getEquipDeyailData {
    [NetHandler getDataWithUrl:[NSString stringWithFormat:kEquipDetail, self.equipListM.ID] completion:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.equipDetailM = [[EquipDetail alloc] init];
        [self.equipDetailM setValuesForKeysWithDictionary:dic];
        self.equipDetailView.equipDetailM = self.equipDetailM;
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getEquipDeyailData];
    self.equipDetailView = [[EquipDetailView alloc] initWithFrame:CGRectMake(0, kHeight / 5, kWidth, kHeight / 5 * 4)];
    [self.view addSubview:_equipDetailView];
    
    
    
    
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
