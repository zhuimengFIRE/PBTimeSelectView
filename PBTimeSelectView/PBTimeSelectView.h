//
//  PBTimeSelectView.h
//  PBTimeSelectView
//
//  Created by Playboy on 2017/1/9.
//  Copyright © 2017年 ywkj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PBTimeSelectView : UIView

@property (nonatomic,copy) void (^selectTimeStringBlock)(NSString *selectTime);
@property (nonatomic,strong) NSString   *startTime;
@property (nonatomic,strong) NSString   *endTime;

@end
