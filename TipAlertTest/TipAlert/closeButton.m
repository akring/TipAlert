//
//  closeButton.m
//  TipAlertTest
//
//  Created by akring on 15/9/16.
//  Copyright © 2015年 akring. All rights reserved.
//

#import "closeButton.h"

@implementation closeButton

- (void)drawRect:(CGRect)rect {
    
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0.819 green: 0.819 blue: 0.819 alpha: 1];
    UIColor* color2 = [UIColor colorWithRed: 0.648 green: 0.648 blue: 0.648 alpha: 1];
    
    //// Group
    {
        //// Oval Drawing
        UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 26, 26)];
        [color setFill];
        [ovalPath fill];
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = UIBezierPath.bezierPath;
        [bezierPath moveToPoint: CGPointMake(7.86, 6.37)];
        [bezierPath addCurveToPoint: CGPointMake(13.19, 11.7) controlPoint1: CGPointMake(7.86, 6.37) controlPoint2: CGPointMake(10.45, 8.96)];
        [bezierPath addCurveToPoint: CGPointMake(18.53, 6.37) controlPoint1: CGPointMake(15.94, 8.96) controlPoint2: CGPointMake(18.53, 6.37)];
        [bezierPath addLineToPoint: CGPointMake(19.63, 7.47)];
        [bezierPath addCurveToPoint: CGPointMake(14.3, 12.81) controlPoint1: CGPointMake(19.63, 7.47) controlPoint2: CGPointMake(17.04, 10.06)];
        [bezierPath addCurveToPoint: CGPointMake(19.63, 18.14) controlPoint1: CGPointMake(17.04, 15.55) controlPoint2: CGPointMake(19.63, 18.14)];
        [bezierPath addLineToPoint: CGPointMake(18.53, 19.24)];
        [bezierPath addCurveToPoint: CGPointMake(13.19, 13.91) controlPoint1: CGPointMake(18.53, 19.24) controlPoint2: CGPointMake(15.94, 16.66)];
        [bezierPath addCurveToPoint: CGPointMake(7.86, 19.24) controlPoint1: CGPointMake(10.45, 16.66) controlPoint2: CGPointMake(7.86, 19.24)];
        [bezierPath addLineToPoint: CGPointMake(6.76, 18.14)];
        [bezierPath addCurveToPoint: CGPointMake(12.09, 12.81) controlPoint1: CGPointMake(6.76, 18.14) controlPoint2: CGPointMake(9.34, 15.55)];
        [bezierPath addCurveToPoint: CGPointMake(6.76, 7.47) controlPoint1: CGPointMake(9.34, 10.06) controlPoint2: CGPointMake(6.76, 7.47)];
        [bezierPath addLineToPoint: CGPointMake(7.86, 6.37)];
        [bezierPath closePath];
        [color2 setFill];
        [bezierPath fill];
    }
}


@end
