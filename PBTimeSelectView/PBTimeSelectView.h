//
//  PBTimeSelectView.h
//  PBTimeSelectView
//
//  Created by Playboy on 2017/1/9.
//  Copyright © 2017年 ywkj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PBTimeSelectView : UIView

/**
 选择时间后回调
 */
@property (nonatomic,copy) void (^selectTimeStringBlock)(NSString *selectTime);

/**
 开始时间 如09:00
 */
@property (nonatomic,strong) NSString   *startTime;

/**
 结束时间 如18:30
 */
@property (nonatomic,strong) NSString   *endTime;

@end
