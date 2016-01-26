//
//  UserLoginView.m
//  LOLhezi
//
//  Created by 吴凌洁 on 16/1/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "UserLoginView.h"
#import "Eara.h"

@interface UserLoginView () <UIPickerViewDataSource, UIPickerViewDelegate>


@property (nonatomic, strong) UITextField *areaT;
@property (nonatomic, strong) UIPickerView *pickerView;
@end

@implementation UserLoginView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel *useL = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 15, [UIScreen mainScreen].bounds.size.width / 3, 80, 30)];
        useL.text = @"召唤师:";
        useL.textColor = [UIColor orangeColor];
        [self addSubview:useL];
        
        UILabel *areaL = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 15, [UIScreen mainScreen].bounds.size.width / 3 + 50, 80, 30)];
        areaL.text = @"大区:";
        areaL.textColor = [UIColor orangeColor];
        [self addSubview:areaL];
        
        self.nameT = [[UITextField alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 15 + 80, [UIScreen mainScreen].bounds.size.width / 3, [UIScreen mainScreen].bounds.size.width / 15 * 13 - 80, 30)];
        self.nameT.placeholder = @"请输入召唤师姓名";
        self.nameT.borderStyle = UITextBorderStyleRoundedRect;
        self.nameT.backgroundColor = [UIColor whiteColor];
        [self addSubview:_nameT];
        
        self.areaT = [[UITextField alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 15 + 80, [UIScreen mainScreen].bounds.size.width / 3 + 50, [UIScreen mainScreen].bounds.size.width / 15 * 13 - 80, 30)];
        self.areaT.placeholder = @"请选择大区";
        self.areaT.borderStyle = UITextBorderStyleRoundedRect;
        self.areaT.backgroundColor = [UIColor whiteColor];
        [self addSubview:_areaT];
        
        self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height / 3 * 2, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 3)];
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        
        self.areaT.inputView = self.pickerView;
        
    }
    return self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.earaArr.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    Eara *earaM = self.earaArr[row];
    self.areaT.text = earaM.fn;
    self.str = earaM.sn;
    return earaM.fn;
}

- (void)setEaraArr:(NSMutableArray *)earaArr {
    _earaArr = earaArr;
    [self.pickerView reloadAllComponents];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
