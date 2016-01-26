//
//  SkillCollectionView.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "SkillCollectionView.h"
#import "SkillCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "SummonerSkill.h"

@interface SkillCollectionView () <UICollectionViewDataSource>

@end

@implementation SkillCollectionView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 30;
        layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width / 5, [UIScreen mainScreen].bounds.size.width / 5 + 50);
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height / 5 * 4) collectionViewLayout:layout];
        self.collectionView.dataSource = self;
        self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        
        [self.collectionView registerClass:[SkillCollectionViewCell class] forCellWithReuseIdentifier:@"skill"];
        [self addSubview:_collectionView];
        
        
        
    }
    return self;
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.skillArr.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SkillCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"skill" forIndexPath:indexPath];

    SummonerSkill *skill = self.skillArr[indexPath.row];
    [cell.skillImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kSkillImage, skill.Id]]];
    cell.skillName.text = skill.name;
    
    return cell;
}

- (void)setSkillArr:(NSMutableArray *)skillArr {
    _skillArr = skillArr;
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
