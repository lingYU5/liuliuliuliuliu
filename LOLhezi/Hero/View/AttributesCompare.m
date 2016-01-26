//
//  AttributesCompare.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "AttributesCompare.h"

@interface AttributesCompare ()
@property (nonatomic, strong) NSMutableArray *arrayHero;
@property (nonatomic, strong) UILabel *dengji;
@property (nonatomic, strong) UILabel *gong;
@property (nonatomic, strong) UILabel *fang;
@property (nonatomic, strong) UILabel *fa;
@property (nonatomic, strong) UILabel *nan;
@property (nonatomic, strong) UILabel *range;
@property (nonatomic, strong) UILabel *moveSpeed;
@property (nonatomic, strong) UILabel *attackBase;
@property (nonatomic, strong) UILabel *armorBase;
@property (nonatomic, strong) UILabel *manaBase;
@property (nonatomic, strong) UILabel *healthBase;
@property (nonatomic, strong) UILabel *criticalChanceBase;
@property (nonatomic, strong) UILabel *manaRegenBase;
@property (nonatomic, strong) UILabel *healthRegenBase;


@property (nonatomic, strong) NSMutableArray *arrayHero2;
@property (nonatomic, strong) UILabel *dengji2;
@property (nonatomic, strong) UILabel *gong2;
@property (nonatomic, strong) UILabel *fang2;
@property (nonatomic, strong) UILabel *fa2;
@property (nonatomic, strong) UILabel *nan2;
@property (nonatomic, strong) UILabel *range2;
@property (nonatomic, strong) UILabel *moveSpeed2;
@property (nonatomic, strong) UILabel *attackBase2;
@property (nonatomic, strong) UILabel *armorBase2;
@property (nonatomic, strong) UILabel *manaBase2;
@property (nonatomic, strong) UILabel *healthBase2;
@property (nonatomic, strong) UILabel *criticalChanceBase2;
@property (nonatomic, strong) UILabel *manaRegenBase2;
@property (nonatomic, strong) UILabel *healthRegenBase2;
@end

@implementation AttributesCompare



- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.slider = [[UISlider alloc] initWithFrame:CGRectMake(30, 10, [UIScreen mainScreen].bounds.size.width - 60, 30)];
        self.slider.backgroundColor = [UIColor clearColor];
        self.slider.minimumValue = 0;
        self.slider.maximumValue = 17;
        [self.slider addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:self.slider];
        
        NSArray *array = @[@"等级", @"攻", @"防", @"法", @"难", @"攻击距离", @"移动速度", @"基础攻击", @"基础防御", @"基础魔法值", @"基础生命值", @"暴击几率", @"魔法回复", @"生命回复"];
        for (int i = 0; i < 14; i++) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 50 + i * 30, [UIScreen mainScreen].bounds.size.width / 4, 20)];
            label.text = array[i];
            label.textColor = [UIColor whiteColor];
//            label.backgroundColor = [UIColor redColor];
            [self addSubview:label];
        }
        
        self.contentSize = CGSizeMake(0, 70 + 14 * 30);
        
        
        _dengji = [[UILabel alloc] init];
        _gong = [[UILabel alloc] init];
        _fang = [[UILabel alloc] init];
        _fa = [[UILabel alloc] init];
        _nan = [[UILabel alloc] init];
        _range = [[UILabel alloc] init];
        _moveSpeed = [[UILabel alloc] init];
        _attackBase = [[UILabel alloc] init];
        _armorBase = [[UILabel alloc] init];
        _manaBase = [[UILabel alloc] init];
        _healthBase = [[UILabel alloc] init];
        _criticalChanceBase = [[UILabel alloc] init];
        _manaRegenBase = [[UILabel alloc] init];
        _healthRegenBase = [[UILabel alloc] init];
        NSArray *arr = @[_dengji, _gong, _fang, _fa, _nan, _range, _moveSpeed, _attackBase, _armorBase, _manaBase, _healthBase, _criticalChanceBase, _manaRegenBase, _healthRegenBase];
        for (int i = 0; i < 14; i++) {
            UILabel *myLabel = arr[i];
            myLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 10 * 3.2, 50 + i * 30, [UIScreen mainScreen].bounds.size.width / 3.5, 20);
//            myLabel.backgroundColor = [UIColor redColor];
            myLabel.textColor = [UIColor whiteColor];
            myLabel.font = [UIFont systemFontOfSize:14];
            [self addSubview:myLabel];
        }
        
        _dengji2 = [[UILabel alloc] init];
        _gong2 = [[UILabel alloc] init];
        _fang2 = [[UILabel alloc] init];
        _fa2 = [[UILabel alloc] init];
        _nan2 = [[UILabel alloc] init];
        _range2 = [[UILabel alloc] init];
        _moveSpeed2 = [[UILabel alloc] init];
        _attackBase2 = [[UILabel alloc] init];
        _armorBase2 = [[UILabel alloc] init];
        _manaBase2 = [[UILabel alloc] init];
        _healthBase2 = [[UILabel alloc] init];
        _criticalChanceBase2 = [[UILabel alloc] init];
        _manaRegenBase2 = [[UILabel alloc] init];
        _healthRegenBase2 = [[UILabel alloc] init];
        
        NSArray *arr2 = @[_dengji2, _gong2, _fang2, _fa2, _nan2, _range2, _moveSpeed2, _attackBase2, _armorBase2, _manaBase2, _healthBase2, _criticalChanceBase2, _manaRegenBase2, _healthRegenBase2];
        for (int i = 0; i < 14; i++) {
            
            UILabel *enemyLabel = arr2[i];
            enemyLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 10 * 6.5, 50 + i * 30, [UIScreen mainScreen].bounds.size.width / 3.5, 20);
            enemyLabel.textColor = [UIColor whiteColor];
            enemyLabel.font = [UIFont systemFontOfSize:14];
            [self addSubview:enemyLabel];
        }
        
        
    }
    return self;
}

- (void)setHeroDetail:(HeroDetail *)heroDetail {
    _heroDetail = heroDetail;
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"1", heroDetail.ratingAttack, heroDetail.ratingDefense, heroDetail.ratingMagic, heroDetail.ratingDifficulty, heroDetail.range, heroDetail.moveSpeed, heroDetail.attackBase, heroDetail.armorBase, heroDetail.manaBase, heroDetail.healthBase, heroDetail.criticalChanceBase, heroDetail.manaRegenBase, heroDetail.healthRegenBase, nil];
    NSArray *arr = @[_dengji, _gong, _fang, _fa, _nan, _range, _moveSpeed, _attackBase, _armorBase, _manaBase, _healthBase, _criticalChanceBase, _manaRegenBase, _healthRegenBase];
    NSArray *array1 = @[heroDetail.attackLevel, heroDetail.armorLevel, heroDetail.manaLevel, heroDetail.healthLevel, heroDetail.criticalChanceLevel, heroDetail.manaRegenLevel, heroDetail.healthRegenLevel];
    for (int i = 0; i < 14; i++) {
        UILabel *label = arr[i];
        if (i < 7) {
            label.text = array[i];
        } else {
            label.text = [NSString stringWithFormat:@"%@(+%@)", array[i], array1[i - 7]];
        }
        
    }
}

- (void)setHeroDetail2:(HeroDetail *)heroDetail2 {
    _heroDetail2 = heroDetail2;
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"1", heroDetail2.ratingAttack, heroDetail2.ratingDefense, heroDetail2.ratingMagic, heroDetail2.ratingDifficulty, heroDetail2.range, heroDetail2.moveSpeed, heroDetail2.attackBase, heroDetail2.armorBase, heroDetail2.manaBase, heroDetail2.healthBase, heroDetail2.criticalChanceBase, heroDetail2.manaRegenBase, heroDetail2.healthRegenBase, nil];
    NSArray *arr = @[_dengji2, _gong2, _fang2, _fa2, _nan2, _range2, _moveSpeed2, _attackBase2, _armorBase2, _manaBase2, _healthBase2, _criticalChanceBase2, _manaRegenBase2, _healthRegenBase2];
    NSArray *array1 = @[heroDetail2.attackLevel, heroDetail2.armorLevel, heroDetail2.manaLevel, heroDetail2.healthLevel, heroDetail2.criticalChanceLevel, heroDetail2.manaRegenLevel, heroDetail2.healthRegenLevel];
    for (int i = 0; i < 14; i++) {
        UILabel *label = arr[i];
        if (i < 7) {
            label.text = array[i];
        } else {
            label.text = [NSString stringWithFormat:@"%@(+%@)", array[i], array1[i - 7]];
        }
        
    }
}

- (void)changeValue:(UISlider *)slider {
    NSMutableArray *array = [NSMutableArray arrayWithObjects:_heroDetail.attackBase, _heroDetail.armorBase, _heroDetail.manaBase, _heroDetail.healthBase, _heroDetail.criticalChanceBase, _heroDetail.manaRegenBase, _heroDetail.healthRegenBase, nil];
    NSArray *array1 = @[_heroDetail.attackLevel, _heroDetail.armorLevel, _heroDetail.manaLevel, _heroDetail.healthLevel, _heroDetail.criticalChanceLevel, _heroDetail.manaRegenLevel, _heroDetail.healthRegenLevel];
    NSArray *arr = @[_attackBase, _armorBase, _manaBase, _healthBase, _criticalChanceBase, _manaRegenBase, _healthRegenBase];
    for (int i = 0; i < 7; i++) {
        UILabel *label = arr[i];
        label.text = [NSString stringWithFormat:@"%.2f(+%@)", slider.value * [array1[i] floatValue] + [array[i] floatValue], array1[i]];
        _dengji.text = [NSString stringWithFormat:@"%d", (int)slider.value + 1];
    }
    
    if (_heroDetail2 != nil) {
        
    
    NSMutableArray *array3 = [NSMutableArray arrayWithObjects:_heroDetail2.attackBase, _heroDetail2.armorBase, _heroDetail2.manaBase, _heroDetail2.healthBase, _heroDetail2.criticalChanceBase, _heroDetail2.manaRegenBase, _heroDetail2.healthRegenBase, nil];
    NSArray *array4 = @[_heroDetail2.attackLevel, _heroDetail2.armorLevel, _heroDetail2.manaLevel, _heroDetail2.healthLevel, _heroDetail2.criticalChanceLevel, _heroDetail2.manaRegenLevel, _heroDetail2.healthRegenLevel];
    NSArray *arr3 = @[_attackBase2, _armorBase2, _manaBase2, _healthBase2, _criticalChanceBase2, _manaRegenBase2, _healthRegenBase2];
    for (int i = 0; i < 7; i++) {
        UILabel *label = arr3[i];
        label.text = [NSString stringWithFormat:@"%.2f(+%@)", slider.value * [array4[i] floatValue] + [array3[i] floatValue], array4[i]];
        _dengji2.text = [NSString stringWithFormat:@"%d", (int)slider.value + 1];
    }
    
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
