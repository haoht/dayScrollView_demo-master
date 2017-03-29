/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 3.0 Edition
 BSD License, Use at your own risk
 */

#import <UIKit/UIKit.h>

CGPoint CGRectGetCenter(CGRect rect);
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (ViewFrameGeometry)

@property CGPoint originx;
@property CGSize sizex;

@property (readonly) CGPoint topLeft;
@property (readonly) CGPoint topRight;
@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;

@property CGFloat heightx;
@property CGFloat widthx;

@property CGFloat topx;
@property CGFloat leftx;

@property CGFloat bottomx;
@property CGFloat rightx;

@property (nonatomic) CGFloat centerXx;
@property (nonatomic) CGFloat centerYx;

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;

- (void)removeAllSubviews;

@end