//
//  MyHTableViewCell.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "MyHTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface MyHTableViewCell ()

@property (nonatomic, strong) UIImageView *heroImage;
@property (nonatomic, strong) UILabel *heroNameL;
@property (nonatomic, strong) UILabel *cnNameL;
@property (nonatomic, strong) UILabel *presentTimesL;

@end

@implementation MyHTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.heroImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, [UIScreen mainScreen].bounds.size.width / 5, [UIScreen mainScreen].bounds.size.width / 5)];
//        self.heroImage.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_heroImage];
        
        self.heroNameL = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 5 + 30, 20, [UIScreen mainScreen].bounds.size.width / 3, 30)];
        self.heroNameL.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_heroNameL];
        
        self.cnNameL = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 3 * 2, 20, [UIScreen mainScreen].bounds.size.width / 5, 30)];
        self.cnNameL.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_cnNameL];
        
        self.presentTimesL = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 5 + 30, [UIScreen mainScreen].bounds.size.width / 10 + 15, [UIScreen mainScreen].bounds.size.width / 2, 30)];
        self.presentTimesL.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_presentTimesL];
        
        
    }
    return self;
}

- (void)setHeroM:(Hero *)heroM {
    
    [self.heroImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kHeroHeadPortrait, heroM.enName]]];
    self.heroNameL.text = heroM.title;
    self.cnNameL.text = heroM.cnName;
    self.presentTimesL.text = [NSString stringWithFormat:@"出场次数:%@", heroM.presentTimes];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
