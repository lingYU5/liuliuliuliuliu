//
//  SkillViewController.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "SkillViewController.h"
#import "NetHandler.h"
#import "SummonerSkill.h"
#import "SkillCollectionView.h"
#import "SkillExplainView.h"

@interface SkillViewController () <UICollectionViewDelegate>

@property (nonatomic, strong) NSMutableArray *skillArr;
@property (nonatomic, strong) SkillExplainView *skillExplainView;
@property (nonatomic, strong) SkillCollectionView *skillCollectionView;

@end

@implementation SkillViewController

- (void)getSkillData {
    [NetHandler getDataWithUrl:kSkill completion:^(NSData *data) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.skillArr = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in arr) {
            SummonerSkill *skill = [[SummonerSkill alloc] init];
            [skill setValuesForKeysWithDictionary:dic];
            [self.skillArr addObject:skill];
        }
        self.skillCollectionView.skillArr = self.skillArr;
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self getSkillData];
    

    self.skillCollectionView = [[SkillCollectionView alloc] initWithFrame:CGRectMake(10, kHeight / 5, kWidth - 20, kHeight / 5 * 4)];
    self.skillCollectionView.collectionView.delegate = self;
    self.skillCollectionView.tag = 1638;
    
    
    self.skillExplainView = [[SkillExplainView alloc] init];

    [self.skillExplainView.cancelButton addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    self.skillExplainView.tag = 1639;
    
    [self.view addSubview:_skillCollectionView];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    self.skillExplainView.skill = self.skillArr[indexPath.item];
    [self.view addSubview:_skillExplainView];

    
    SummonerSkill *skill = self.skillArr[indexPath.item];
    
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
    CGRect rect = [skill.des boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width / 5 * 4, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    self.skillExplainView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 8, [UIScreen mainScreen].bounds.size.height / 4, [UIScreen mainScreen].bounds.size.width / 5 * 4, rect.size.height + 130);
    
}

- (void)cancel:(UIButton *)button {
    UIView *view = [self.view viewWithTag:1638];
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
