//
//  ViewController.m
//  PBTimeSelectView
//
//  Created by Playboy on 2017/1/9.
//  Copyright © 2017年 ywkj. All rights reserved.
//

#import "ViewController.h"
#import "PBTimeSelectView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    PBTimeSelectView *timeSelectView = [[PBTimeSelectView alloc] init];
    timeSelectView.frame = CGRectMake(100, 100, 100, 200);
    timeSelectView.backgroundColor = [UIColor whiteColor];
    timeSelectView.startTime = @"09:00";
    timeSelectView.endTime = @"17:30";
    [timeSelectView setSelectTimeStringBlock:^(NSString *selectTime) {
        NSLog(@"%@",selectTime);
    }];
    
    [self.view addSubview:timeSelectView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
