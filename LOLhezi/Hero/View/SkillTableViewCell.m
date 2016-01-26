//
//  SkillTableViewCell.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/14.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "SkillTableViewCell.h"

@interface SkillTableViewCell ()
@property (nonatomic, strong) UILabel *costLabel;
@property (nonatomic, strong) UILabel *desLabel;
@property (nonatomic, strong) UILabel *cooldownLabel;
@property (nonatomic, strong) UILabel *rangeLabel;
@property (nonatomic, strong) UILabel *effectLabel;

@end

@implementation SkillTableViewCell

- (void)layoutSubviews {
    [super layoutSubviews];
    self.skillName.frame = CGRectMake(15, self.bounds.size.width  / 6, [UIScreen mainScreen].bounds.size.width - 30, 30);
    self.skillName.numberOfLines = 0;
    [self.skillName sizeToFit];

    
    self.descrip.frame = CGRectMake(15 + [UIScreen mainScreen].bounds.size.width / 8, _skillName.frame.origin.y + _skillName.frame.size.height + 10, [UIScreen mainScreen].bounds.size.width / 8 * 7 - 30, 30);
    self.descrip.numberOfLines = 0;
    [self.descrip sizeToFit];

    
    self.desLabel.frame = CGRectMake(15, _skillName.frame.origin.y + _skillName.frame.size.height + 10, [UIScreen mainScreen].bounds.size.width / 8, 30);
    self.desLabel.numberOfLines = 0;
    [self.desLabel sizeToFit];
    
    
    self.cost.frame = CGRectMake(15 + [UIScreen mainScreen].bounds.size.width / 8, self.descrip.frame.origin.y + self.descrip.frame.size.height + 10, [UIScreen mainScreen].bounds.size.width / 8 * 7 - 30, 30);

    self.cost.numberOfLines = 0;
    [self.cost sizeToFit];


    self.costLabel.frame = CGRectMake(15, self.descrip.frame.origin.y + self.descrip.frame.size.height + 10, [UIScreen mainScreen].bounds.size.width / 8, 30);
    self.costLabel.numberOfLines = 0;
    [self.costLabel sizeToFit];
    
    
    self.cooldown.frame = CGRectMake(15 + [UIScreen mainScreen].bounds.size.width / 8, _cost.frame.origin.y + _cost.frame.size.height + 10, [UIScreen mainScreen].bounds.size.width / 8 * 7 - 30, 30);

    self.cooldown.numberOfLines = 0;
    [self.cooldown sizeToFit];


    self.cooldownLabel.frame = CGRectMake(15, _cost.frame.origin.y + _cost.frame.size.height + 10, [UIScreen mainScreen].bounds.size.width / 8, 30);
    self.cooldownLabel.numberOfLines = 0;
    [self.cooldownLabel sizeToFit];
    
    
    self.range.frame = CGRectMake(15 + [UIScreen mainScreen].bounds.size.width / 8, _cooldown.frame.size.height + _cooldown.frame.origin.y + 10, [UIScreen mainScreen].bounds.size.width / 8 * 7 - 30, 30);
    self.range.numberOfLines = 0;
    [self.range sizeToFit];
    
    self.rangeLabel.frame = CGRectMake(15, _cooldown.frame.size.height + _cooldown.frame.origin.y + 10, [UIScreen mainScreen].bounds.size.width / 8, 30);
    self.rangeLabel.numberOfLines = 0;
    [self.rangeLabel sizeToFit];
    
    self.effect.frame = CGRectMake(15 + [UIScreen mainScreen].bounds.size.width / 8, _range.frame.origin.y + _range.frame.size.height + 10, [UIScreen mainScreen].bounds.size.width / 8 * 7 - 30, 30);
    self.effect.numberOfLines = 0;
    [self.effect sizeToFit];
    
    self.effectLabel.frame = CGRectMake(15, _range.frame.origin.y + _range.frame.size.height + 10, [UIScreen mainScreen].bounds.size.width / 8, 30);
    self.effectLabel.numberOfLines = 0;
    [self.effectLabel sizeToFit];
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.buttonB = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.buttonQ = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.buttonW = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.buttonE = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.buttonR = [UIButton buttonWithType:(UIButtonTypeCustom)];
        
        NSArray *buttonArr = @[_buttonB, _buttonQ, _buttonW, _buttonE, _buttonR];
        
        _imageB = [[UIView alloc] init];
        _imageQ = [[UIView alloc] init];
        _imageW = [[UIView alloc] init];
        _imageE = [[UIView alloc] init];
        _imageR = [[UIView alloc] init];
        NSArray *imageArr = @[_imageB, _imageQ, _imageW, _imageE, _imageR];
        for (int i = 0; i < 5; i++) {
            UIButton *button = buttonArr[i];
            button.frame = CGRectMake(15 + i * [UIScreen mainScreen].bounds.size.width / 5.5, 0, [UIScreen mainScreen].bounds.size.width / 6, [UIScreen mainScreen].bounds.size.width / 6);
            button.backgroundColor = [UIColor redColor];
            button.tag = 2000 + i;
            [self.contentView addSubview:button];
            
            UIView *image = imageArr[i];
            image.tag = 3000 + i;
            image.frame = button.frame;
            [self.contentView addSubview:image];
            image.backgroundColor = [UIColor blackColor];
            image.userInteractionEnabled = NO;
            if (i == 0) {
                image.alpha = 0;
            } else {
                image.alpha = 0.65;
            }
        }
        self.skillName = [[UILabel alloc] init];
        self.skillName.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.skillName];
        
        
        self.desLabel = [[UILabel alloc] init];
        self.desLabel.textColor = [UIColor cyanColor];
        self.desLabel.text = @"描述:";
        [self.contentView addSubview:self.desLabel];
        
        self.descrip = [[UILabel alloc] init];
        self.descrip.textColor = [UIColor orangeColor];
        [self.contentView addSubview:self.descrip];
        
        self.costLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, self.descrip.frame.origin.y + self.descrip.frame.size.height + 10, [UIScreen mainScreen].bounds.size.width / 8, self.bounds.size.width / 11)];
        self.costLabel.text = @"消耗:";
        self.costLabel.textColor = [UIColor cyanColor];
        [self.contentView addSubview:self.costLabel];
        
        self.cost = [[UILabel alloc] init];
        self.cost.textColor = [UIColor orangeColor];
        [self.contentView addSubview:self.cost];
        
        self.cooldownLabel = [[UILabel alloc] init];
        self.cooldownLabel.text = @"冷却:";
        self.cooldownLabel.textColor = [UIColor cyanColor];
        [self.contentView addSubview:self.cooldownLabel];
        
        self.cooldown = [[UILabel alloc] init];
        _cooldown.textColor = [UIColor orangeColor];
        [self.contentView addSubview:_cooldown];
        
        self.rangeLabel = [[UILabel alloc] init];
        self.rangeLabel.text = @"范围:";
        self.rangeLabel.textColor = [UIColor cyanColor];
        [self.contentView addSubview:self.rangeLabel];
        
        self.range = [[UILabel alloc] init];
        self.range.textColor = [UIColor orangeColor];
        [self.contentView addSubview:_range];
        
        self.effectLabel = [[UILabel alloc] init];
        self.effectLabel.text = @"效果:";
        self.effectLabel.textColor = [UIColor cyanColor];
        [self.contentView addSubview:self.effectLabel];
        
        self.effect = [[UILabel alloc] init];
        _effect.textColor = [UIColor orangeColor];
        [self.contentView addSubview:_effect];
        
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)setStr:(NSString *)str {
    _str = str;
    if ([str isEqualToString:@"B"]) {
        _imageB.alpha = 0;
        _imageQ.alpha = 0.65;
        _imageW.alpha = 0.65;
        _imageE.alpha = 0.65;
        _imageR.alpha = 0.65;
    } else if ([str isEqualToString:@"Q"]) {
        _imageB.alpha = 0.65;
        _imageQ.alpha = 0;
        _imageW.alpha = 0.65;
        _imageE.alpha = 0.65;
        _imageR.alpha = 0.65;
    } else if ([str isEqualToString:@"W"]) {
        _imageB.alpha = 0.65;
        _imageQ.alpha = 0.65;
        _imageW.alpha = 0;
        _imageE.alpha = 0.65;
        _imageR.alpha = 0.65;
    } else if ([str isEqualToString:@"E"]) {
        _imageB.alpha = 0.65;
        _imageQ.alpha = 0.65;
        _imageW.alpha = 0.65;
        _imageE.alpha = 0;
        _imageR.alpha = 0.65;
    } else if ([str isEqualToString:@"R"]) {
        _imageB.alpha = 0.65;
        _imageQ.alpha = 0.65;
        _imageW.alpha = 0.65;
        _imageE.alpha = 0.65;
        _imageR.alpha = 0;
    }
}

- (void)setSkill:(Skill *)skill {
    _skill = skill;
    if ([skill.name isEqualToString:@""]) {
        self.skillName.text = @"无";
    } else {
        self.skillName.text = skill.name;
    }
    if ([skill.description1 isEqualToString:@""]) {
        self.descrip.text = @"无";
    } else {
        self.descrip.text = skill.description1;
    }
    if ([skill.cost isEqualToString:@""]) {
        self.cost.text = @"无";
    } else {
        self.cost.text = skill.cost;
    }
    if ([skill.cooldown isEqualToString:@""]) {
        self.cooldown.text = @"无";
    } else {
    self.cooldown.text = skill.cooldown;
    }
    if ([skill.range isEqualToString:@""]) {
        self.range.text = @"无";
    } else {
        self.range.text = skill.range;
    }
    if ([skill.effect isEqualToString:@""]) {
        self.effect.text = @"无";
    } else {
        self.effect.text = skill.effect;
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
