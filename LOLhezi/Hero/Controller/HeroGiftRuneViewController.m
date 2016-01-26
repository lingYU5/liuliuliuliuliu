//
//  HeroGiftRuneViewController.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroGiftRuneViewController.h"
#import "NetHandler.h"
#import "GiftAndRune.h"
#import "GiftTableView.h"
#import "GiftPicViewController.h"

@interface HeroGiftRuneViewController () <UITableViewDelegate>
@property (nonatomic, strong) GiftAndRune *heroGift;
@property (nonatomic, strong) GiftTableView *giftTableView;
@end

@implementation HeroGiftRuneViewController


- (void)getHeroGiftAndRune {
    [NetHandler getDataWithUrl:[NSString stringWithFormat:kHeroGiftRune, self.hero.enName] completion:^(NSData *data) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.heroGift = [[GiftAndRune alloc] init];
        for (NSDictionary *dic in arr) {
            [self.heroGift setValuesForKeysWithDictionary:dic];
        }
        self.giftTableView.gift = self.heroGift;
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getHeroGiftAndRune];
    
    self.giftTableView = [[GiftTableView alloc] initWithFrame:CGRectMake(0, kHeight / 5, kWidth, kHeight / 5 * 4)];
    self.giftTableView.delegate = self;
    [self.view addSubview:_giftTableView];
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GiftPicViewController *giftVC = [[GiftPicViewController alloc] init];
    giftVC.gift = self.heroGift;
    [self.navigationController pushViewController:giftVC animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
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
