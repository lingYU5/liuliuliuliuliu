//
//  GroupTableViewCell.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "GroupTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface GroupTableViewCell ()
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UIImageView *hero1;
@property (nonatomic, strong) UIImageView *hero2;
@property (nonatomic, strong) UIImageView *hero3;
@property (nonatomic, strong) UIImageView *hero4;
@property (nonatomic, strong) UIImageView *hero5;
@property (nonatomic, strong) UILabel *des;

@end

@implementation GroupTableViewCell

- (void)layoutSubviews {
    self.des.frame = CGRectMake(10, [UIScreen mainScreen].bounds.size.width / 6 + 55, [UIScreen mainScreen].bounds.size.width - 20, 30);
    self.des.numberOfLines = 0;
    [self.des sizeToFit];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, [UIScreen mainScreen].bounds.size.width - 30, 30)];
        _title.textColor = [UIColor orangeColor];
        [self.contentView addSubview:_title];
        
        self.hero1 = [[UIImageView alloc] init];
        self.hero2 = [[UIImageView alloc] init];
        self.hero3 = [[UIImageView alloc] init];
        self.hero4 = [[UIImageView alloc] init];
        self.hero5 = [[UIImageView alloc] init];
        
        NSArray *arr = @[_hero1, _hero2, _hero3, _hero4, _hero5];
        for (int i = 0; i < 5; i++) {
            UIImageView *image = arr[i];
            image.frame = CGRectMake(15 + i * [UIScreen mainScreen].bounds.size.width / 5.5, 45, [UIScreen mainScreen].bounds.size.width / 6, [UIScreen mainScreen].bounds.size.width / 6);
//            image.backgroundColor = [UIColor redColor];
            [self.contentView addSubview:image];
        }
        
        self.des = [[UILabel alloc] init];
        self.des.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_des];
        
        
    }
    return self;
}

- (void)setGroupM:(Group *)groupM {
    _groupM = groupM;
    self.title.text = groupM.title;
    NSArray *arr = @[_hero1, _hero2, _hero3, _hero4, _hero5];
    
    if (groupM != nil) {
         NSArray *array = @[groupM.hero1, groupM.hero2, groupM.hero3, groupM.hero4, groupM.hero5];
    
    for (int i = 0; i < 5; i++) {
        [arr[i] sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kHeroHeadPortrait, array[i]]]];
    }

    }
       self.des.text = groupM.des;
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
