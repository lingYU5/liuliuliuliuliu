//
//  FreeHeroView.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "FreeHeroView.h"
#import "HeroCollectionViewCell.h"

#import "Hero.h"

@interface FreeHeroView () <UICollectionViewDelegate, UICollectionViewDataSource>


@end

@implementation FreeHeroView

- (void)setFreeArr:(NSMutableArray *)freeArr {
    _freeArr = [NSMutableArray arrayWithArray:freeArr];
    [self.collect reloadData];
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(kWIDTH / 2 - 10, 100);
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 10;
        self.collect = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT) collectionViewLayout:layout];
        self.collect.backgroundColor = [UIColor clearColor];
        
        self.collect.dataSource = self;
        self.collect.showsVerticalScrollIndicator = NO;
        [self.collect registerClass:[HeroCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [self addSubview:self.collect];
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    }
    return self;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.freeArr.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HeroCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
//    Hero *hero = self.freeArr[indexPath.item];
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", hero.enName]] placeholde/
    
    cell.hero = self.freeArr[indexPath.item];
    
    return cell;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
