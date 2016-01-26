//
//  AllHeroView.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "AllHeroView.h"
#import "HeroCollectionViewCell.h"
#import "FreeHeroView.h"
#import "Hero.h"

@interface AllHeroView () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collect;
@end

@implementation AllHeroView

- (void)setAllArr:(NSMutableArray *)allArr {
    _allArr = [[NSMutableArray alloc] initWithArray:allArr];
    [self.collect reloadData];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.text = [[UITextField alloc] initWithFrame:CGRectMake(kWIDTH / 4, 10, kWIDTH / 2, 30)];
        self.text.placeholder = @"请输入英雄";
        self.text.borderStyle = UITextBorderStyleRoundedRect;
        self.text.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.text];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH / 9, 10, kWIDTH / 8, 30)];
        label.text = @"搜索:";
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:15];
        [self addSubview:label];
        
        self.button = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.button.frame = CGRectMake(kWIDTH / 5 * 4, 10, kWIDTH / 8, 30);
        [self.button setTitle:@"搜索" forState:UIControlStateNormal];
        self.button.tintColor = [UIColor orangeColor];
        
        [self addSubview:self.button];
        

        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(kWIDTH / 2 - 10, 100);
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 10;
        self.collect = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 50, kWIDTH, kHEIGHT - 50) collectionViewLayout:layout];
        self.collect.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        self.collect.delegate = self;
        self.collect.dataSource = self;
        self.collect.showsVerticalScrollIndicator = NO;
        [self.collect registerClass:[HeroCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [self addSubview:self.collect];
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    }
    return self;
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.allArr.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HeroCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
//    Hero *hero = self.allArr[indexPath.item];
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", hero.enName]] placeholderImage:nil];
//    cell.title.text = hero.title;
//    cell.cnName.text = hero.cnName;
//    cell.location.text = hero.location;
    
    cell.hero = self.allArr[indexPath.item];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"进入详情界面" object:self userInfo:@{@"index": [NSNumber numberWithInteger:indexPath.item]}];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
