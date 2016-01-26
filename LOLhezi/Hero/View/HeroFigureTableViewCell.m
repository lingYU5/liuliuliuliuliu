//
//  HeroFigureTableViewCell.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/15.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "HeroFigureTableViewCell.h"

@implementation HeroFigureTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.slider = [[UISlider alloc] initWithFrame:CGRectMake(15, 15, [UIScreen mainScreen].bounds.size.width - 30, 30)];
        
        self.slider.minimumValue = 0;
        self.slider.maximumValue = 17;
        
        
        [self.contentView addSubview:self.slider];
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
