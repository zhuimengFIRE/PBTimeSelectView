//
//  PBTimeSelectView.m
//  PBTimeSelectView
//
//  Created by Playboy on 2017/1/9.
//  Copyright © 2017年 ywkj. All rights reserved.
//

#import "PBTimeSelectView.h"

@interface PBTimeSelectView ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic,strong) NSMutableArray   *firstArray;
@property (nonatomic,strong) NSMutableArray   *secondArray;
@property (nonatomic,strong) NSString   *firstString;
@property (nonatomic,strong) NSString   *secondString;
@property (nonatomic,assign) NSInteger  startLeftNumber;
@property (nonatomic,assign) NSInteger  startRightNumber;
@property (nonatomic,assign) NSInteger  endLeftNumber;
@property (nonatomic,assign) NSInteger  endRightNumber;
@property (nonatomic,strong) UIPickerView   *pickerView;

@end


@implementation PBTimeSelectView

- (void)drawRect:(CGRect)rect {
    [self setup];
}

- (void)setup {
    [self setupData];
    [self setupView];
}

- (void)setupData {
    
    self.firstArray = [[NSMutableArray alloc] init];
    self.secondArray = [[NSMutableArray alloc] init];

    for (NSInteger i = 0; i < 60; i ++) {
        if (i < 10) {
            [self.firstArray addObject:[NSString stringWithFormat:@"0%ld",i]];
            [self.secondArray addObject:[NSString stringWithFormat:@"0%ld",i]];
        }else {
            if (i < 24) {
                [self.firstArray addObject:[NSString stringWithFormat:@"%ld",i]];
            }
            [self.secondArray addObject:[NSString stringWithFormat:@"%ld",i]];
        }
    }
    
    self.startLeftNumber = [[self.startTime componentsSeparatedByString:@":"][0] integerValue];
    self.startRightNumber = [[self.startTime componentsSeparatedByString:@":"][1] integerValue];
    self.endLeftNumber = [[self.endTime componentsSeparatedByString:@":"][0] integerValue];
    self.endRightNumber = [[self.endTime componentsSeparatedByString:@":"][1] integerValue];
    
}

- (void)setupView {
    self.frame = CGRectMake(100, 100, 200, 233);
    self.backgroundColor =[UIColor whiteColor];
    self.layer.cornerRadius = 5;
    self.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowRadius = 10;
    
    // 标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
    [titleLabel setText:@"选择时间"];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:titleLabel];
    
    // 分割线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 41, self.frame.size.width, 1)];
    lineView.backgroundColor = [UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1];
    [self addSubview:lineView];
    
    // 选择器
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 42, self.frame.size.width, 150)];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    [self addSubview:pickerView];
    self.pickerView = pickerView;
    
    // 分割线
    UIView *bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 192, self.frame.size.width, 1)];
    bottomLineView.backgroundColor = [UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1];
    [self addSubview:bottomLineView];
    
    // 确定
    UIButton *sureButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 193, self.frame.size.width, 40)];
    [sureButton setTitle:@"确定" forState:UIControlStateNormal];
    [sureButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [sureButton addTarget:self action:@selector(sureButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:sureButton];
    
    // 初始化选择
    [self pickerView:self.pickerView didSelectRow:self.startLeftNumber inComponent:0];
    [self pickerView:self.pickerView didSelectRow:self.startRightNumber inComponent:1];
    
    [self.pickerView selectRow:self.startLeftNumber inComponent:0 animated:YES];
    [self.pickerView selectRow:self.startRightNumber inComponent:1 animated:YES];
    
    
}

#pragma mark - <UIPickerViewDelegate,UIPickerViewDataSource>
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.firstArray.count;
    }
    return self.secondArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return self.firstArray[row];
    }
    return self.secondArray[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        NSInteger firstNum = [self.firstArray[row] integerValue];
        NSString *firstString;
        if (firstNum < self.startLeftNumber) {
            [pickerView selectRow:self.startLeftNumber inComponent:0 animated:YES];
            firstString = [NSString stringWithFormat:@"%ld",self.startLeftNumber];
        }else if (firstNum > self.endLeftNumber) {
            [pickerView selectRow:self.endLeftNumber inComponent:0 animated:YES];
            firstString = [NSString stringWithFormat:@"%ld",self.endLeftNumber];
        }else {
            firstString = self.firstArray[row];
        }
        self.firstString = firstString;
        
    }else if (component == 1) {
        
        NSInteger secondNum = [self.secondArray[row] integerValue];
        NSString *secondString;
        if (secondNum < self.startRightNumber) {
            [pickerView selectRow:self.startRightNumber inComponent:1 animated:YES];
            secondString = [NSString stringWithFormat:@"%ld",self.startRightNumber];
        }else if (secondNum > self.endRightNumber) {
            [pickerView selectRow:self.endRightNumber inComponent:1 animated:YES];
            secondString = [NSString stringWithFormat:@"%ld",self.endRightNumber];
        }else {
            secondString = self.secondArray[row];
        }
        self.secondString = secondString;
        
    }
}

#pragma mark - click
- (void)sureButtonClick {
    
    if (self.selectTimeStringBlock) {
        self.selectTimeStringBlock([NSString stringWithFormat:@"%@:%@",self.firstString,self.secondString]);
    }
}




@end
