//
//  CMCircleLayer.m
//  CMCircleView
//
//  Created by WangWei on 17/3/22.
//  Copyright © 2017年 58cm. All rights reserved.
//

#import "CMCircleLayer.h"
#import "CMPasswordView.h"
#import "CMGestureConst.h"
@implementation CMCircleLayer

- (void)drawInContext:(CGContextRef)ctx
{
    UIImage *img = [UIImage imageNamed:kBigCircleUnSelectBackImage];
    CGImageRef image  = CGImageRetain(img.CGImage);
    CGContextDrawImage(ctx, self.bounds, image);
    CGImageRelease(image);
    
    if (self.highlighted)
    {
        
        UIImage *img = [UIImage imageNamed:kBigCircleSelectBackImage];
        CGImageRef image  = CGImageRetain(img.CGImage);
        CGContextDrawImage(ctx, self.bounds, image);
        CGImageRelease(image);
    }
    self.masksToBounds=YES;
    self.cornerRadius=kCircleRadius;
    
    
}


@end
