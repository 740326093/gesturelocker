//
//  UILabel+LabelShark.h
//  test
//
//  Created by WangWei on 17/3/22.
//  Copyright © 2017年 58cm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LabelShark)
/***
 
 警示信息附带摇动
 
 **/

-(void)showWarnLabelAndShark:(NSString*)labelString;
/***
 
 警示信息未带摇动
 
 **/
-(void)showWarnLabel:(NSString*)labelString;
/***
 
 普通信息
 
 **/
-(void)normalLabel:(NSString*)labelString;
/***
 
 成功信息
 
 **/
-(void)successLabel:(NSString*)labelString;
@end
