//
//  RuneTableViewCell.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "RuneTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface RuneTableViewCell ()
@property (nonatomic, strong) UIImageView *runeImage;
@property (nonatomic, strong) UILabel *nameL;
@property (nonatomic, strong) UILabel *leve1L;
@property (nonatomic, strong) UILabel *leve2L;
@property (nonatomic, strong) UILabel *leve3L;
@end

@implementation RuneTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.runeImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, [UIScreen mainScreen].bounds.size.width / 5, [UIScreen mainScreen].bounds.size.width / 4.5)];
        [self.contentView addSubview:_runeImage];
        
        self.nameL = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 5 + 10, 5, [UIScreen mainScreen].bounds.size.width / 5 * 4 - 20, [UIScreen mainScreen].bounds.size.width / 15)];
        self.nameL.textColor = [UIColor whiteColor];
        self.nameL.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:_nameL];
        
        self.leve1L = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 5 + 10, [UIScreen mainScreen].bounds.size.width / 15 + 5, [UIScreen mainScreen].bounds.size.width / 5 * 4 - 20, [UIScreen mainScreen].bounds.size.width / 20)];
        self.leve1L.textColor = [UIColor cyanColor];
        self.leve1L.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_leve1L];
        
        self.leve2L = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 5 + 10, [UIScreen mainScreen].bounds.size.width / 60 * 7 + 5, [UIScreen mainScreen].bounds.size.width / 5 * 4 - 20, [UIScreen mainScreen].bounds.size.width / 20)];
        self.leve2L.textColor = [UIColor cyanColor];
        self.leve2L.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_leve2L];
        
        self.leve3L = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 5 + 10, [UIScreen mainScreen].bounds.size.width / 6 + 5, [UIScreen mainScreen].bounds.size.width / 5 * 4 - 20, [UIScreen mainScreen].bounds.size.width / 20)];
        self.leve3L.textColor = [UIColor cyanColor];
        self.leve3L.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_leve3L];
        
        
    }
    return self;
}

- (void)setRuneM:(Rune *)runeM {
    _runeM = runeM;
    
    [self.runeImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kRuneImage, runeM.Img]]];
    self.nameL.text = runeM.Name;
    self.leve1L.text = [NSString stringWithFormat:@"一级:%@ %@", runeM.Prop, runeM.lev1];
    self.leve2L.text = [NSString stringWithFormat:@"二级:%@ %@", runeM.Prop, runeM.lev2];
    self.leve3L.text = [NSString stringWithFormat:@"三级:%@ %@", runeM.Prop, runeM.lev3];
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
