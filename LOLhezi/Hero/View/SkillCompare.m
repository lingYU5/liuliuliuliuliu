//
//  SkillCompare.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "SkillCompare.h"
#import "SkillCompareTableViewCell.h"
#import "Skill.h"
#import "UIButton+WebCache.h"

@interface SkillCompare () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) Skill *skill;
@property (nonatomic, copy) NSMutableArray *strID;
@property (nonatomic, copy) NSMutableArray *skillID;

@property (nonatomic, strong) Skill *skill1;
@property (nonatomic, strong) Skill *skill2;

@property (nonatomic, copy) NSString *str;
@property (nonatomic, strong) NSMutableArray *skillArr;
@property (nonatomic, strong) NSMutableArray *leftArr;
@property (nonatomic, strong) NSMutableArray *rightArr;
@property (nonatomic, strong) NSMutableArray *strArr;

@end

@implementation SkillCompare


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.strArr = [NSMutableArray arrayWithObjects:@"1",@"1",@"1",@"1",@"1", nil];
    }
    return self;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SkillCompareTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"skill"];
    if (!cell) {
        cell = [[SkillCompareTableViewCell alloc] initWithStyle:(UITableViewCellStyleValue2) reuseIdentifier:@"skill"];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    

    
    self.skillID = [NSMutableArray arrayWithObjects:@"被动", @"Q", @"W", @"E", @"R", nil];
    self.strID = [NSMutableArray arrayWithObjects:@"B", @"Q", @"W", @"E", @"R", nil];
    [cell.mySkill sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kHeroSkill, self.heroDetail.name, _strID[indexPath.row]]] forState:UIControlStateNormal];
    [cell.mySkill addTarget:self action:@selector(changeSkill:) forControlEvents:UIControlEventTouchUpInside];

    
    [cell.enemySkill sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kHeroSkill, self.heroDetail2.name, _strID[indexPath.row]]] forState:UIControlStateNormal];
    [cell.enemySkill addTarget:self action:@selector(changeSkill:) forControlEvents:UIControlEventTouchUpInside];
    cell.mySkill.tag = 1 + (indexPath.row + 1) * 2000;
    cell.enemySkill.tag = 2 + (indexPath.row + 1) * 2000;
    
    
    
    cell.str = self.strArr[indexPath.row];
    cell.skill = self.skillArr[indexPath.row];
    cell.skillID.text = self.skillID[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    self.skill = self.skillArr[indexPath.row];
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
    CGRect rect = [self.skill.description1 boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 70, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    CGRect rect1 = [self.skill.effect boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 70, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    return rect.size.height + rect1.size.height + 5 * 10 + 4 * 30 + [UIScreen mainScreen].bounds.size.width / 6 + 10;
}

- (void)changeSkill:(UIButton *)button {
    
    NSInteger i = button.tag / 2000;
    NSInteger j = button.tag % 2000;
    if (j == 1) {
        [self.skillArr replaceObjectAtIndex:i - 1 withObject:self.leftArr[i - 1]];
        [self.strArr replaceObjectAtIndex:i-1 withObject:@"1"];
        [self reloadData];
    }else{
        if (self.rightArr.count != 0) {
            
            [self.skillArr replaceObjectAtIndex:i - 1 withObject:self.rightArr[i - 1]];
            [self.strArr replaceObjectAtIndex:i-1 withObject:@"2"];
            
            [self reloadData];
        }
        
    }
    
}

- (void)setHeroDetail:(HeroDetail *)heroDetail {
    _heroDetail = heroDetail;
    self.skillArr = [NSMutableArray arrayWithObjects:heroDetail.skill_B, heroDetail.skill_Q, heroDetail.skill_W, heroDetail.skill_E, heroDetail.skill_R, nil];
    self.leftArr = [NSMutableArray arrayWithObjects:heroDetail.skill_B, heroDetail.skill_Q, heroDetail.skill_W, heroDetail.skill_E, heroDetail.skill_R, nil];
    [self reloadData];
}
- (void)setHeroDetail2:(HeroDetail *)heroDetail2 {
    _heroDetail2 = heroDetail2;
    self.rightArr = [NSMutableArray arrayWithObjects:heroDetail2.skill_B, heroDetail2.skill_Q, heroDetail2.skill_W, heroDetail2.skill_E, heroDetail2.skill_R, nil];
    [self reloadData];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
