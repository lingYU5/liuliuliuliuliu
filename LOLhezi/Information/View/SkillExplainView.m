//
//  SkillExplainView.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "SkillExplainView.h"

@interface SkillExplainView ()

@property (nonatomic, strong) UILabel *dengjiL;
@property (nonatomic, strong) UILabel *cooldownL;
@property (nonatomic, strong) UILabel *desL;

@end


@implementation SkillExplainView

- (void)layoutSubviews {
    self.desL.frame = CGRectMake(5, 90, [UIScreen mainScreen].bounds.size.width / 5 * 4, 30);
    self.desL.numberOfLines = 0;
    [self.desL sizeToFit];
    
    self.cancelButton.frame = CGRectMake(self.frame.size.width / 3.5, _desL.frame.origin.y + _desL.frame.size.height + 5, [UIScreen mainScreen].bounds.size.width / 3, 30);
    
    
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        self.dengjiL = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, [UIScreen mainScreen].bounds.size.width / 5 * 4 - 10, 30)];
        self.dengjiL.textColor = [UIColor whiteColor];
        [self addSubview:_dengjiL];
        
        self.cooldownL = [[UILabel alloc] initWithFrame:CGRectMake(5, 50, [UIScreen mainScreen].bounds.size.width / 5 * 4 - 10, 30)];
        self.cooldownL.textColor = [UIColor whiteColor];
        [self addSubview:_cooldownL];
        
        self.desL = [[UILabel alloc] init];
        self.desL.textColor = [UIColor whiteColor];
        [self addSubview:_desL];
        
        self.cancelButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
//        self.cancelButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 3, _desL.frame.origin.y + _desL.frame.size.height + 5, [UIScreen mainScreen].bounds.size.width / 3, 30);
        self.cancelButton.backgroundColor = [UIColor orangeColor];
        [self.cancelButton setTitle:@"取消" forState:(UIControlStateNormal)];
        [self addSubview:_cancelButton];
        
    }
    return self;
}

- (void)setSkill:(SummonerSkill *)skill {
    _skill = skill;
    self.dengjiL.text = [NSString stringWithFormat:@"等级:%@", skill.level];
    self.cooldownL.text = [NSString stringWithFormat:@"冷却:%@", skill.cooldown];
    self.desL.text = [NSString stringWithFormat:@"描述:%@", skill.des];
    
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
    CGRect rect = [skill.des boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width / 5 * 4, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    self.desL.frame = CGRectMake(5, 90, [UIScreen mainScreen].bounds.size.width / 5 * 4, rect.size.height);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
