//
//  CMPasswordView.m
//  CMPasswordView
//
//  Created by WangWei on 17/3/22.
//  Copyright © 2017年 58cm. All rights reserved.
//

#import "CMPasswordView.h"
#import "CMCircleLayer.h"
#import "CMGestureConst.h"

@interface CMPasswordView()

- (void) setLayerFrames;

@end

@implementation CMPasswordView

- (void) dealloc
{
    self.circleLayers = nil;
    self.trackingIds = nil;
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.circleLayers = [NSMutableArray arrayWithCapacity:9];
        self.trackingIds = [NSMutableArray arrayWithCapacity:9];
        CMCircleLayer* circleLayer;
        for (int i = 0; i < 3; i++)
        {
            for (int j = 0; j < 3; j++)
            {
                circleLayer = [CMCircleLayer layer];
                circleLayer.passwordView = self;
                [self.circleLayers addObject:circleLayer];
                [self.layer addSublayer:circleLayer];
            }
        }
        
        
        [self setLayerFrames];
    }
    return self;
}

- (void) setLayerFrames
{
    float intealVer=(self.frame.size.width-3*(kCircleRadius*2))/4.0;
    float imtealhert=(self.frame.size.height-3*(kCircleRadius*2))/4.0;
    CMCircleLayer* circleLayer;
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            CGFloat x = intealVer+j*(kCircleRadius*2+intealVer);
            CGFloat y = imtealhert+i*(kCircleRadius*2+imtealhert);
            circleLayer = [self.circleLayers objectAtIndex:i*3+j];
            circleLayer.frame = CGRectMake(x, y, kCircleRadius*2, kCircleRadius*2);
            [circleLayer setNeedsDisplay];
            
        }
    }
    

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    self.isTracking = NO;
    
    UITouch* touch = [touches anyObject];
    
    self.previousTouchPoint = [touch locationInView:self];
    
    CMCircleLayer* circleLayer;
    for (int i = 0; i < 9; i++)
    {
        circleLayer = [self.circleLayers objectAtIndex:i];
        if (CGRectContainsPoint(circleLayer.frame, _previousTouchPoint))

        {
            circleLayer.highlighted = YES;
            [circleLayer setNeedsDisplay];
            self.isTracking = YES;
            [self.trackingIds addObject:[NSNumber numberWithInt:i]];
            break;
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    
    if (self.isTracking)
    {
        UITouch* touch = [touches anyObject];
        
        self.previousTouchPoint = [touch locationInView:self];
        
        CMCircleLayer* circleLayer;
        for (int i = 0; i < 9; i++)
        {
            circleLayer = [self.circleLayers objectAtIndex:i];
              if (CGRectContainsPoint(circleLayer.frame, _previousTouchPoint))
            {
                if (![self hasVistedCircle:i])
                {
                    circleLayer.highlighted = YES;
                    [circleLayer setNeedsDisplay];
                    [self.trackingIds addObject:[NSNumber numberWithInt:i]];
                    break;
                }
            }
        }
            [self setNeedsDisplay];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    NSString* password = [self getPassword:self.trackingIds];
    //密码输入完毕回调
   if (password.length > 0)
    {
        [self.delegate passwordView:self withPassword:password];
    }
    
    [self resetTrackingState];
    
}

//- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [super touchesEnded:touches withEvent:event];
//    
//    [self resetTrackingState];
//}

- (void)drawRect:(CGRect)rect {
    if(!self.isTracking)
    {
        return;
    }
    NSArray* circleIds = self.trackingIds;
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    path.lineWidth=2.0f;
    path.lineCapStyle=kCGLineCapRound;
    [[UIColor redColor] set];
    
    for (int i=0;i<[circleIds count]; i++) {
        CGPoint point = [self getPointWithId: [[circleIds objectAtIndex:i] intValue]];
        if (i==0) {
            [path moveToPoint:point];
        }else {
            [path addLineToPoint:point];
        }
        
    }
    
    [path addLineToPoint:self.previousTouchPoint];
    
    
    
    [path stroke];
    

    
    
}
- (CGPoint)getPointWithId:(int)circleId
{
    float intealVer=(self.frame.size.width-3*(kCircleRadius*2))/4.0;
    float imtealhert=(self.frame.size.height-3*(kCircleRadius*2))/4.0;
    
    CGFloat x = intealVer+kCircleRadius+circleId%3*(kCircleRadius*2+intealVer);
    CGFloat y = imtealhert+kCircleRadius+circleId/3*(kCircleRadius*2+imtealhert);
    
    CGPoint point = CGPointMake(x, y);
    return point;
}

- (BOOL)hasVistedCircle:(int)circleId
{
    BOOL hasVisit = NO;
    for (NSNumber* number in self.trackingIds)
    {
        if ([number intValue] == circleId)
        {
            hasVisit = YES;
            break;
        }
    }
    return hasVisit;
}

- (void)resetTrackingState
{
    self.isTracking = NO;
    
    CMCircleLayer* circleLayer;
    for (int i = 0; i < 9; i++)
    {
        circleLayer = [self.circleLayers objectAtIndex:i];
        if (circleLayer.highlighted == YES)
        {
            circleLayer.highlighted = NO;
            [circleLayer setNeedsDisplay];
        }
    }
    [self.trackingIds removeAllObjects];
    [self setNeedsDisplay];

}

//- (BOOL)containPoint:(CGPoint)point inCircle:(CGRect)rect
//{
//    CGPoint center = CGPointMake(rect.origin.x+rect.size.width/2, rect.origin.y+rect.size.height/2);
//    BOOL isContain = ((center.x-point.x)*(center.x-point.x)+(center.y-point.y)*(center.y-point.y)-kCircleRadius*kCircleRadius)<0;
//    return isContain;
//}

- (NSString*)getPassword:(NSArray*)array
{
    NSMutableString* password = [[NSMutableString alloc] initWithCapacity:9];
    for (int i = 0; i < [array count]; i++)
    {
        NSNumber* number = [array objectAtIndex:i];
        [password appendFormat:@"%d",[number intValue]];
    }
    return password;
}


@end
