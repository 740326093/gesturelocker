//
//  UILabel+LabelShark.m
//  test
//
//  Created by WangWei on 17/3/22.
//  Copyright © 2017年 58cm. All rights reserved.
//

#import "UILabel+LabelShark.h"
#import "CMGestureConst.h"
@implementation UILabel (LabelShark)

-(void)labelShark{
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    CGFloat s = 5;
    
    anim.values = @[@(-s),@(0),@(s),@(0),@(-s),@(0),@(s),@(0)];
    
    //时长
    anim.duration = 0.3f;
    
    //重复
    anim.repeatCount = 2;
    
    //移除
    anim.removedOnCompletion = YES;
    [self.layer addAnimation:anim forKey:nil];
}
-(void)showWarnLabelAndShark:(NSString*)labelString{
    
    self.text=labelString;
    self.textColor=kWarnTextColor;
    [self labelShark];
}

-(void)showWarnLabel:(NSString*)labelString{
    
    self.text=labelString;
    self.textColor=kWarnTextColor;
}
-(void)normalLabel:(NSString*)labelString{
    
    self.text=labelString;
    self.textColor=kNormalTextColor;
}
-(void)successLabel:(NSString*)labelString{
    
    self.text=labelString;
    self.textColor=kSuccessTextColor;
}
@end
