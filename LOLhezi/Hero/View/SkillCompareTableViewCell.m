//
//  SkillCompareTableViewCell.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/18.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "SkillCompareTableViewCell.h"
#import "Skill.h"

@interface SkillCompareTableViewCell ()

@property (nonatomic, strong) UILabel *skillName;
@property (nonatomic, strong) UILabel *descrip;
@property (nonatomic, strong) UILabel *cost;
@property (nonatomic, strong) UILabel *cooldown;
@property (nonatomic, strong) UILabel *range;
@property (nonatomic, strong) UILabel *effect;

@property (nonatomic, strong) UILabel *descripLabel;
@property (nonatomic, strong) UILabel *costLabel;
@property (nonatomic, strong) UILabel *cooldownLabel;
@property (nonatomic, strong) UILabel *rangeLabel;
@property (nonatomic, strong) UILabel *effectLabel;



@end

@implementation SkillCompareTableViewCell

- (void)layoutSubviews {
    self.skillName.frame = CGRectMake(10, [UIScreen mainScreen].bounds.size.width / 6 + 10, [UIScreen mainScreen].bounds.size.width - 20, 30);
    [self.skillName sizeToFit];
    
    self.descripLabel.frame = CGRectMake(10, _skillName.frame.size.height + _skillName.frame.origin.y + 10, 50, 30);
    
    self.descrip.frame = CGRectMake(60, _skillName.frame.size.height + _skillName.frame.origin.y + 15, [UIScreen mainScreen].bounds.size.width - 70, 30);
    [self.descrip sizeToFit];
    
    self.costLabel.frame = CGRectMake(10, _descrip.frame.size.height + _descrip.frame.origin.y + 10, 50, 30);
    
    self.cost.frame = CGRectMake(60, _descrip.frame.size.height + _descrip.frame.origin.y + 15, [UIScreen mainScreen].bounds.size.width - 70, 30);
    [self.cost sizeToFit];
    
    self.cooldownLabel.frame = CGRectMake(10, _cost.frame.size.height + _cost.frame.origin.y + 10, 50, 30);
    
    self.cooldown.frame = CGRectMake(60, _cost.frame.size.height + _cost.frame.origin.y + 15, [UIScreen mainScreen].bounds.size.width - 70, 30);
    [self.cooldown sizeToFit];
    
    self.rangeLabel.frame = CGRectMake(10, _cooldown.frame.size.height + _cooldown.frame.origin.y + 10, 50, 30);
    
    self.range.frame =  CGRectMake(60, _cooldown.frame.size.height + _cooldown.frame.origin.y + 15, [UIScreen mainScreen].bounds.size.width - 70, 30);
    [self.range sizeToFit];
    
    self.effectLabel.frame = CGRectMake(10, _range.frame.size.height + _range.frame.origin.y + 10, 50, 30);
    
    self.effect.frame = CGRectMake(60, _range.frame.size.height + _range.frame.origin.y + 15, [UIScreen mainScreen].bounds.size.width - 70, 30);
    [self.effect sizeToFit];
    
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.mySkill = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.mySkill.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 3, 10, [UIScreen mainScreen].bounds.size.width / 6, [UIScreen mainScreen].bounds.size.width / 6);
        [self.contentView addSubview:_mySkill];
        
        self.myImage = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 3, 10, [UIScreen mainScreen].bounds.size.width / 6, [UIScreen mainScreen].bounds.size.width / 6)];
        _myImage.backgroundColor = [UIColor blackColor];
        _myImage.alpha = 0;
        _myImage.userInteractionEnabled = NO;
        [self.contentView addSubview:_myImage];
        
        self.enemySkill = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.enemySkill.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 3 * 2, 10, [UIScreen mainScreen].bounds.size.width / 6, [UIScreen mainScreen].bounds.size.width / 6);
        _enemySkill.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_enemySkill];
        
        self.enemyImage = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 3 * 2, 10, [UIScreen mainScreen].bounds.size.width / 6, [UIScreen mainScreen].bounds.size.width / 6)];
        _enemyImage.backgroundColor = [UIColor blackColor];
        _enemyImage.alpha = 0.8;
        _enemyImage.userInteractionEnabled = NO;
        [self.contentView addSubview:_enemyImage];
        
        
        self.skillID = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, [UIScreen mainScreen].bounds.size.width / 6, 30)];
        self.skillID.textColor = [UIColor orangeColor];
        [self.contentView addSubview:self.skillID];
        
        self.descripLabel = [[UILabel alloc] init];
        _descripLabel.text = @"描述:";
        _descripLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_descripLabel];
        
        
        self.costLabel = [[UILabel alloc] init];
        _costLabel.text = @"消耗:";
        _costLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_costLabel];
        
        self.cooldownLabel = [[UILabel alloc] init];
        _cooldownLabel.text = @"冷却:";
        _cooldownLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_cooldownLabel];
        
        self.rangeLabel = [[UILabel alloc] init];
        _rangeLabel.text = @"范围:";
        _rangeLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_rangeLabel];
        
        self.effectLabel = [[UILabel alloc] init];
        _effectLabel.text = @"效果";
        _effectLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_effectLabel];
        
        self.skillName = [[UILabel alloc] init];
        self.skillName.textColor = [UIColor cyanColor];
        self.skillName.numberOfLines = 0;
        
        self.descrip = [[UILabel alloc] init];
        self.descrip.textColor = [UIColor cyanColor];
        self.descrip.numberOfLines = 0;
        
        self.cost = [[UILabel alloc] init];
        self.cost.textColor = [UIColor cyanColor];
        self.cost.numberOfLines = 0;
        
        self.cooldown = [[UILabel alloc] init];
        self.cooldown.textColor = [UIColor cyanColor];
        self.cooldown.numberOfLines = 0;
        
        self.range = [[UILabel alloc] init];
        self.range.textColor = [UIColor cyanColor];
        self.range.numberOfLines = 0;
        
        self.effect = [[UILabel alloc] init];
        self.effect.textColor = [UIColor cyanColor];
        self.effect.numberOfLines = 0;
        
        [self.contentView addSubview:_skillName];
        [self.contentView addSubview:_descrip];
        [self.contentView addSubview:_cost];
        [self.contentView addSubview:_cooldown];
        [self.contentView addSubview:_range];
        [self.contentView addSubview:_effect];
        
        
    }
    return self;
}

- (void)setSkill:(Skill *)skill {
    _skill = skill;
    
    
    if ([skill.name isEqualToString:@""]) {
        _skillName.text = @"无";
    } else {
    _skillName.text = skill.name;
    }
    
    if ([skill.description1 isEqualToString:@""]) {
        _descrip.text = @"无";
    } else {
        _descrip.text = skill.description1;
    }
    
    if ([skill.cost isEqualToString:@""]) {
        _cost.text = @"无";
    } else {
        _cost.text = skill.cost;
    }
    
    if ([skill.cooldown isEqualToString:@""]) {
        _cooldown.text = @"无";
    } else {
        _cooldown.text = skill.cooldown;
    }
    
    if ([skill.range isEqualToString:@""]) {
        _range.text = @"无";
    } else {
        _range.text = skill.range;
    }
    
    if ([skill.effect isEqualToString:@""]) {
        _effect.text = @"无";
    } else {
        _effect.text = skill.effect;
    }

}

- (void)setStr:(NSString *)str {
    _str = str;
    if ([str isEqualToString:@"1"]) {
        self.myImage.alpha = 0;
        self.enemyImage.alpha = 0.8;
    }else{
        self.myImage.alpha = 0.8;
        self.enemyImage.alpha = 0;
        
    }
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
