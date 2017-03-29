//
//  dayView.h
//  dayScrollView_demo
//
//  Created by liman on 15/8/24.
//  Copyright (c) 2015年 liman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewExt.h"

@class DayView;
@protocol DayViewDelegate <NSObject>

- (void)dayView:(DayView *)dayView didSelectedIndex:(NSInteger)index;

@end

@interface DayView : UIView <UIScrollViewDelegate>

// scrollView
@property (strong, nonatomic) UIScrollView *scrollView;

// 底部滑动view
@property (strong, nonatomic) UIView *swipView;

- (instancetype)initWithFrame:(CGRect)frame days:(NSInteger)days labelWidth:(NSInteger)labelWidth;

@property (weak, nonatomic) id <DayViewDelegate> delegate;
@end
