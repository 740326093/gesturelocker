//
//  CMCircleLayer.h
//  CMCircleView
//
//  Created by WangWei on 17/3/22.
//  Copyright © 2017年 58cm. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@class CMPasswordView;

@interface CMCircleLayer : CALayer

@property (nonatomic,assign) BOOL highlighted;
@property (nonatomic,assign) CMPasswordView* passwordView;

@end
