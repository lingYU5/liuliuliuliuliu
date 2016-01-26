//
//  EquipDetailView.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "EquipDetailView.h"
#import "UIImageView+WebCache.h"

@interface EquipDetailView ()

@property (nonatomic, strong) UIImageView *equipImage;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *allPrice;
@property (nonatomic, strong) UILabel *sellPrice;
@property (nonatomic, strong) UILabel *price;
@property (nonatomic, strong) UILabel *des;

@end

@implementation EquipDetailView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.equipImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 30, [UIScreen mainScreen].bounds.size.width / 3, [UIScreen mainScreen].bounds.size.width / 3)];
//        self.equipImage.backgroundColor = [UIColor redColor];
        [self addSubview:_equipImage];
        
        self.name = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 3 + 40, 30, [UIScreen mainScreen].bounds.size.width / 3 * 2 - 60, [UIScreen mainScreen].bounds.size.width / 12)];
        self.name.textColor = [UIColor whiteColor];
        [self addSubview:_name];
        
        self.allPrice = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 3 + 40, 30 + [UIScreen mainScreen].bounds.size.width / 12, [UIScreen mainScreen].bounds.size.width / 3 * 2 - 60, [UIScreen mainScreen].bounds.size.width / 12)];
        self.allPrice.textColor = [UIColor whiteColor];
        [self addSubview:_allPrice];
        
        self.sellPrice = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 3 + 40, 30 + [UIScreen mainScreen].bounds.size.width / 12 * 2, [UIScreen mainScreen].bounds.size.width / 3 * 2 - 60, [UIScreen mainScreen].bounds.size.width / 12)];
        self.sellPrice.textColor = [UIColor whiteColor];
        [self addSubview:_sellPrice];
        
        self.price = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 3 + 40, 30 + [UIScreen mainScreen].bounds.size.width / 12 * 3, [UIScreen mainScreen].bounds.size.width / 3 * 2 - 60, [UIScreen mainScreen].bounds.size.width / 12)];
        self.price.textColor = [UIColor whiteColor];
        [self addSubview:_price];
        
        
        self.des = [[UILabel alloc] initWithFrame:CGRectMake(20, [UIScreen mainScreen].bounds.size.height / 3, [UIScreen mainScreen].bounds.size.width - 40, 30)];
        self.des.textColor = [UIColor whiteColor];
        self.des.numberOfLines = 0;
        self.des.font = [UIFont systemFontOfSize:15];
//        [self.des sizeToFit];
        [self addSubview:_des];
        
    }
    return self;
}

- (void)setEquipDetailM:(EquipDetail *)equipDetailM {
    _equipDetailM = equipDetailM;
    [_equipImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kEquip, equipDetailM.equipID]]];
    _name.text = [NSString stringWithFormat:@"名称:%@", equipDetailM.name];
    _allPrice.text = [NSString stringWithFormat:@"购买价格:%@", equipDetailM.allPrice];
    _sellPrice.text = [NSString stringWithFormat:@"出售价格:%@", equipDetailM.sellPrice];
    _price.text = [NSString stringWithFormat:@"合成价格:%@", equipDetailM.price];
    NSString *str = [NSString stringWithFormat:@"描述: %@", equipDetailM.description2];
    
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
    CGRect rect = [str boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 40, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    _des.frame = CGRectMake(20, [UIScreen mainScreen].bounds.size.height / 3, [UIScreen mainScreen].bounds.size.width - 40, rect.size.height);
    _des.text = str;
}


    




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
