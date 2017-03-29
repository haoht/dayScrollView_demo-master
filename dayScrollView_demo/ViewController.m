//
//  ViewController.m
//  dayScrollView_demo
//
//  Created by liman on 15/8/24.
//  Copyright (c) 2015年 liman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UILabel *captionLabel;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    DayView *dayView = [[DayView alloc] initWithFrame:CGRectMake(0, 100, self.view.widthx, 40) days:10 labelWidth:70];
    dayView.delegate = self;
    [self.view addSubview:dayView];
    
    
    
    [self initCaptionLabel];
}

#pragma mark - private
- (void)initCaptionLabel
{
    captionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, self.view.widthx, self.view.heightx - 200)];
    captionLabel.textAlignment = NSTextAlignmentCenter;
    captionLabel.font = [UIFont boldSystemFontOfSize:25];
    [self.view addSubview:captionLabel];
}

#pragma mark - DayViewDelegate
- (void)dayView:(DayView *)dayView didSelectedIndex:(NSInteger)index
{
    captionLabel.text = [NSString stringWithFormat:@"click index %ld", (long)index];
}

@end
