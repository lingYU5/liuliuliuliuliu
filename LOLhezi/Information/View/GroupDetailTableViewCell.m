//
//  GroupDetailTableViewCell.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "GroupDetailTableViewCell.h"

@interface GroupDetailTableViewCell ()


@end


@implementation GroupDetailTableViewCell

- (void)layoutSubviews {
    self.desL.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 4 + 10, 10, [UIScreen mainScreen].bounds.size.width / 4 * 3 - 20, 30);
    self.desL.numberOfLines = 0;
    [self.desL sizeToFit];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.heroImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, [UIScreen mainScreen].bounds.size.width / 4, [UIScreen mainScreen].bounds.size.width / 4)];
//        _heroImage.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_heroImage];
        
        self.desL = [[UILabel alloc] init];
        self.desL.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_desL];
        
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
