//
//  RuneViewController.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "RuneViewController.h"
#import "NetHandler.h"
#import "Rune.h"
#import "RuneView.h"
#import "ChoseRune.h"

@interface RuneViewController ()
@property (nonatomic, strong) ChoseRune *choseRuneView;
@property (nonatomic, strong) RuneView *runeView;
@property (nonatomic, strong) NSMutableArray *redArr;
@property (nonatomic, strong) NSMutableArray *blueArr;
@property (nonatomic, strong) NSMutableArray *yellowArr;
@property (nonatomic, strong) NSMutableArray *purpleArr;

@end

@implementation RuneViewController

- (void)getRnueData {
    [NetHandler getDataWithUrl:kRune completion:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.redArr = [NSMutableArray arrayWithCapacity:0];
        self.blueArr = [NSMutableArray arrayWithCapacity:0];
        self.yellowArr = [NSMutableArray arrayWithCapacity:0];
        self.purpleArr = [NSMutableArray arrayWithCapacity:0];
        NSArray *red = [dic objectForKey:@"Red"];
        for (NSDictionary *dict in red) {
            Rune *rune = [[Rune alloc] init];
            [rune setValuesForKeysWithDictionary:dict];
            [self.redArr addObject:rune];
        }
        self.runeView.runeArr = self.redArr;
        
        NSArray *blue = [dic objectForKey:@"Blue"];
        for (NSDictionary *dict in blue) {
            Rune *rune = [[Rune alloc] init];
            [rune setValuesForKeysWithDictionary:dict];
            [self.blueArr addObject:rune];
        }
        
        NSArray *yellow = [dic objectForKey:@"Yellow"];
        for (NSDictionary *dict in yellow) {
            Rune *rune = [[Rune alloc] init];
            [rune setValuesForKeysWithDictionary:dict];
            [self.yellowArr addObject:rune];
        }
        
        NSArray *purple = [dic objectForKey:@"Purple"];
        for (NSDictionary *dict in purple) {
            Rune *rune = [[Rune alloc] init];
            [rune setValuesForKeysWithDictionary:dict];
            [self.purpleArr addObject:rune];
        }
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getRnueData];
    self.runeView = [[RuneView alloc] initWithFrame:CGRectMake(0, kHeight / 5, kWidth, kHeight / 5 * 4)];
    self.runeView.tag = 1512;
    [self.runeView.choseButton addTarget:self action:@selector(choseRune:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.choseRuneView = [[ChoseRune alloc] initWithFrame:CGRectMake(0, kHeight / 5, kWidth, kHeight / 5 * 4)];
    self.choseRuneView.tag = 1511;
    [self.choseRuneView.redButton addTarget:self action:@selector(choseArr:) forControlEvents:UIControlEventTouchUpInside];
    self.choseRuneView.redButton.tag = 1314;
    
    [self.choseRuneView.blueButton addTarget:self action:@selector(choseArr:) forControlEvents:UIControlEventTouchUpInside];
    self.choseRuneView.blueButton.tag = 1316;
    
    [self.choseRuneView.yellowButton addTarget:self action:@selector(choseArr:) forControlEvents:UIControlEventTouchUpInside];
    self.choseRuneView.yellowButton.tag = 1315;
    
    [self.choseRuneView.purpleButton addTarget:self action:@selector(choseArr:) forControlEvents:UIControlEventTouchUpInside];
    self.choseRuneView.purpleButton.tag = 1317;
    
    [self.view addSubview:_choseRuneView];
    [self.view addSubview:_runeView];
}

- (void)choseRune:(UIButton *)button {
    UIView *view = [self.view viewWithTag:1511];
    [self.view bringSubviewToFront:view];
    
}
- (void)choseArr:(UIButton *)button {
    
    NSArray *arr = @[self.redArr, self.yellowArr, self.blueArr, self.purpleArr];
    self.runeView.runeArr = arr[button.tag - 1314];
    
    NSArray *array = @[@"印记", @"符印", @"雕文", @"精华"];
    [self.runeView.choseButton setTitle:array[button.tag - 1314] forState:UIControlStateNormal];
    
    NSArray *colorArr = @[[UIColor redColor], [UIColor orangeColor], [UIColor blueColor], [UIColor purpleColor]];
    self.runeView.choseButton.backgroundColor = colorArr[button.tag - 1314];
    
    UIView *view = [self.view viewWithTag:1512];
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
