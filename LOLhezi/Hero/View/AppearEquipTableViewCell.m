//
//  AppearEquipTableViewCell.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/15.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "AppearEquipTableViewCell.h"
#import "UIButton+WebCache.h"

@implementation AppearEquipTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, [UIScreen mainScreen].bounds.size.width - 30, 30)];
        self.titleLabel.textColor = [UIColor cyanColor];
        [self.contentView addSubview:_titleLabel];
        
        
        self.serverLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 45, [UIScreen mainScreen].bounds.size.width / 4, 20)];
//        self.serverLabel.backgroundColor = [UIColor redColor];
        self.serverLabel.textColor = [UIColor greenColor];
        [self.contentView addSubview:_serverLabel];
        
        self.authorLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 3, 45, [UIScreen mainScreen].bounds.size.width / 2, 20)];
//        self.authorLabel.backgroundColor = [UIColor redColor];
        self.authorLabel.textColor = [UIColor orangeColor];
        [self.contentView addSubview:_authorLabel];
        
        
        self.equipButton1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.equipButton2 = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.equipButton3 = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.equipButton4 = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.equipButton5 = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.equipButton6 = [UIButton buttonWithType:(UIButtonTypeCustom)];
        NSArray *array = @[_equipButton1, _equipButton2, _equipButton3, _equipButton4, _equipButton5, _equipButton6];
        for (int i = 0; i < 6; i++) {
            UIButton *button = array[i];
            button.frame = CGRectMake(15 + i * [UIScreen mainScreen].bounds.size.width / 6.5, 65, [UIScreen mainScreen].bounds.size.width / 7.5, [UIScreen mainScreen].bounds.size.width / 7.5);
            [self.contentView addSubview:button];
//            button.backgroundColor = [UIColor redColor];
        }
        
        
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setAppearEquip:(AppearEquip *)appearEquip {
    _appearEquip = appearEquip;
    NSArray *array = [NSArray array];
    array = [appearEquip.end_cz componentsSeparatedByString:@","];
    
    NSArray *array2 = @[_equipButton1, _equipButton2, _equipButton3, _equipButton4, _equipButton5, _equipButton6];
    for (int i = 0; i < array.count; i++) {
        UIButton *button = array2[i];
        [button sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kEquip, array[i]]] forState:(UIControlStateNormal)];

    }
    _titleLabel.text = appearEquip.title;
    _serverLabel.text = appearEquip.server;
    _authorLabel.text = appearEquip.author;
}






- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
