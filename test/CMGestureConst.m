//
//  CMGestureConst.m
//  test
//
//  Created by WangWei on 17/3/22.
//  Copyright © 2017年 58cm. All rights reserved.
//

#import "CMGestureConst.h"

@implementation CMGestureConst
+ (void)saveGesture:(NSString *)gesture Key:(NSString *)key
{
    
    
    
    [[NSUserDefaults standardUserDefaults] setObject:gesture forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)getGestureWithKey:(NSString *)key
{
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}
+(void)removeGesture:(NSString*)key{
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
}
@end
