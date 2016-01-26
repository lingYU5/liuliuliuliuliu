//
//  HeroRelationTableViewCell.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/15.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroRelationTableViewCell.h"


@implementation HeroRelationTableViewCell

- (void)layoutSubviews {
    self.des.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 5 + 30, 15, [UIScreen mainScreen].bounds.size.width / 5 * 4 - 40, 30);
    self.des.numberOfLines = 0;
    [self.des sizeToFit];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.partnerImage = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.partnerImage.frame = CGRectMake(15, 15, [UIScreen mainScreen].bounds.size.width / 5, [UIScreen mainScreen].bounds.size.width / 5);
        self.partnerImage.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.partnerImage];
        
        self.des = [[UILabel alloc] init];
        self.des.textColor = [UIColor cyanColor];
        [self.contentView addSubview:self.des];
        
    }
    return self;
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
