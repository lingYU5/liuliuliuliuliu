//
//  EquipLisetView.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/19.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "EquipLisetView.h"
#import "EquipListCollectionViewCell.h"
#import "EquipList.h"
#import "UIImageView+WebCache.h"


@interface EquipLisetView () <UICollectionViewDataSource>

@end

@implementation EquipLisetView



- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout *lay = [[UICollectionViewFlowLayout alloc] init];
        lay.minimumLineSpacing = 10;
        lay.minimumInteritemSpacing = 40;
        lay.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width / 5, [UIScreen mainScreen].bounds.size.width / 5 + 50);
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height / 5 * 4)collectionViewLayout:lay];
        self.collectionView.dataSource = self;
        self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        
        [self.collectionView registerClass:[EquipListCollectionViewCell class] forCellWithReuseIdentifier:@"llll"];
        [self addSubview:_collectionView];
        
        
        
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.equipListArr.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EquipListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"llll" forIndexPath:indexPath];
//    if (!cell) {
//        cell = [[EquipListCollectionViewCell alloc] init];
//    }
    
    EquipList *equipListM = self.equipListArr[indexPath.row];
    [cell.equipImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kEquip, equipListM.ID]]];
    cell.equipName.text = equipListM.text;
    
    return cell;
}





- (void)setEquipListArr:(NSMutableArray *)equipListArr {
    _equipListArr = equipListArr;
    [self.collectionView reloadData];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
