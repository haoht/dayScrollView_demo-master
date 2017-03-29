//
//  dayView.m
//  dayScrollView_demo
//
//  Created by liman on 15/8/24.
//  Copyright (c) 2015年 liman. All rights reserved.
//

#import "DayView.h"

@implementation DayView
{
    NSInteger _days;
    
    UILabel *lastLabel;
    
    // label宽度
    NSInteger _labelWidth;
}

#pragma mark - public
- (instancetype)initWithFrame:(CGRect)frame days:(NSInteger)days labelWidth:(NSInteger)labelWidth
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor yellowColor];
        _days = days + 1;
        _labelWidth = labelWidth;
        
        // 初始化scrollView
        [self initScrollView];
        
        // 初始化多个label
        [self initMultiLabels];
        
        // 初始化底部滑动view
        [self initSwipView];
    }
    return self;
}

#pragma mark - private
// 初始化scrollView
- (void)initScrollView
{
    // 设置scrollView的属性
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.contentSize = CGSizeMake(_labelWidth * _days, _scrollView.heightx);
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollView];
    
    
    if (_labelWidth * _days < _scrollView.widthx)
    {
        _labelWidth = _scrollView.widthx / _days;
        _scrollView.contentSize = CGSizeMake(_labelWidth * _days, _scrollView.heightx);
    }
}

// 初始化多个label
- (void)initMultiLabels
{
    for (NSInteger i = 0; i < _days; i ++) {
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(_labelWidth * i, 0, _labelWidth, _scrollView.heightx)];
        label.backgroundColor = [UIColor yellowColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = [NSString stringWithFormat:@"第%ld天",(long)i];
        label.tag = i;
        label.userInteractionEnabled = YES;
        label.font = [UIFont systemFontOfSize:16];
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTapped:)]];
        [self.scrollView addSubview:label];
        
        
        if (label.tag == 0) {
            label.textColor = [UIColor redColor];
            label.text = @"全部";
            lastLabel = label;
        }
    }
}

// 初始化底部滑动view
- (void)initSwipView
{
    _swipView = [[UIView alloc] initWithFrame:CGRectMake(0, self.heightx - 4, _labelWidth, 4)];
    _swipView.backgroundColor = [UIColor redColor];
    [self addSubview:_swipView];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _swipView.leftx = lastLabel.leftx - scrollView.contentOffset.x;
}

#pragma mark - target action
- (void)labelTapped:(UITapGestureRecognizer *)tap
{
    lastLabel.textColor = [UIColor blackColor];
    
    // label
    UILabel *label = (UILabel *)tap.view;
    label.textColor = [UIColor redColor];
    lastLabel = label;
    
    // 底部滑动view
    [UIView animateWithDuration:0.4 animations:^{
        _swipView.leftx = lastLabel.leftx - _scrollView.contentOffset.x;
    }];
    
    // <<<<<<<<<<<<<<<<<<<<< 点击了右边缘时, scrollView自动向左滑动 <<<<<<<<<<<<<<<<<<<<<
    if (_swipView.rightx > self.widthx - _labelWidth)
    {
        [_scrollView scrollRectToVisible:CGRectMake(_labelWidth + _scrollView.contentOffset.x, 0, _scrollView.widthx, _scrollView.heightx) animated:YES];
    }
    
    // <<<<<<<<<<<<<<<<<<<<< 点击了左边缘时, scrollView自动向右滑动 <<<<<<<<<<<<<<<<<<<<<
    if (_swipView.leftx < _labelWidth)
    {
        [_scrollView scrollRectToVisible:CGRectMake(_scrollView.contentOffset.x - _labelWidth, 0, _scrollView.widthx, _scrollView.heightx) animated:YES];
    }
    
    
    
    
    if ([_delegate respondsToSelector:@selector(dayView:didSelectedIndex:)]) {
        [_delegate dayView:self didSelectedIndex:label.tag];
    }
}

@end
