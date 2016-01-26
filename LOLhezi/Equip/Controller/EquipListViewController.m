//
//  EquipListViewController.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "EquipListViewController.h"
#import "EquipLisetView.h"
#import "NetHandler.h"
#import "EquipList.h"
#import "EquipDetailViewController.h"

@interface EquipListViewController () <UICollectionViewDelegate>
@property (nonatomic, strong) EquipLisetView *equipListView;
@property (nonatomic, strong) NSMutableArray *equipListArr;
@end

@implementation EquipListViewController

- (void)getEquipListData {
    [NetHandler getDataWithUrl:[NSString stringWithFormat:kEquipList, self.equipSort.tag] completion:^(NSData *data) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.equipListArr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in arr) {
            EquipList *equipList = [[EquipList alloc] init];
            [equipList setValuesForKeysWithDictionary:dic];
            [self.equipListArr addObject:equipList];
            
        }
        self.equipListView.equipListArr = self.equipListArr;
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self getEquipListData];
    
    self.equipListView = [[EquipLisetView alloc] initWithFrame:CGRectMake(10, kHeight / 5, kWidth - 20, kHeight / 5 * 4)];
    self.equipListView.collectionView.delegate = self;
    [self.view addSubview:_equipListView];
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    EquipDetailViewController *equipDetailVC = [[EquipDetailViewController alloc] init];
    equipDetailVC.equipListM = self.equipListArr[indexPath.row];
    [self.navigationController pushViewController:equipDetailVC animated:YES];
    
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
