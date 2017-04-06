//
//  CMPasswordView.h
//  CMPasswordView
//
//  Created by WangWei on 17/3/22.
//  Copyright © 2017年 58cm. All rights reserved.
//

#import <UIKit/UIKit.h>



@class CMPasswordView;

@protocol CMPasswordDelegate <NSObject>

/** 密码输入完毕回调 */
- (void)passwordView:(CMPasswordView*)passwordView withPassword:(NSString*)password;

@end

@interface CMPasswordView : UIView

/** 代理 */
@property (nonatomic,assign) id<CMPasswordDelegate> delegate;

@property (nonatomic,assign) CGPoint previousTouchPoint;

@property (nonatomic,assign) BOOL isTracking;

@property (nonatomic,retain) NSMutableArray* circleLayers;
@property (nonatomic,retain) NSMutableArray* trackingIds;

@end
