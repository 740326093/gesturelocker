//
//  CMGestureConst.h
//  test
//
//  Created by WangWei on 17/3/22.
//  Copyright © 2017年 58cm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMGestureConst : NSObject
/**
 * 手势界面长度
 */
#define kPasswordViewSideLength [UIScreen mainScreen].bounds.size.width*1.1
/**
 * 手势圆大小
 */
#define kCircleRadius 26.0
/**
 * 手势线宽
 */
#define kPathWidth 2.0

/**
 * 手势小圆大小
 */
#define kCircleLittleRadius 10.0
/**
 * 错误信息字体颜色
 */
#define kWarnTextColor [UIColor redColor]

/**
 * 普通信息字体颜色
 */
#define kNormalTextColor [UIColor blackColor]
/**
 * 成功信息字体颜色
 */
#define kSuccessTextColor [UIColor greenColor]

/**
 * 手势大圆未选中背景
 */
#define kBigCircleUnSelectBackImage @"image_CodeUnSet"
/**
 * 手势大圆选中背景
 */
#define kBigCircleSelectBackImage @"image_CodeSet"

/**
 * 手势小圆未选中背景
 */
#define kLittleCircleUnSelectBackImage @"image_CodeLitterUnSet"
/**
 *手势小圆选中背景
 */
#define kLittleCircleSelectBackImage @"image_CodeLitterSet"




/**
 *  偏好设置：存字符串（手势密码）
 *
 *  @param gesture 字符串对象
 *  @param key     存储key
 */
+ (void)saveGesture:(NSString *)gesture Key:(NSString *)key;


/**
 *  偏好设置：取字符串手势密码
 *
 *  @param key key
 *
 *  @return 字符串对象
 */
+ (NSString *)getGestureWithKey:(NSString *)key;
/**
 *
 * 清除手势
 *  @param key key
 */
+(void)removeGesture:(NSString*)key;

@end
