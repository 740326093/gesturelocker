//
//  GPLittlePassWordView.m
//  LittlePassWorld
//
//  Created by WangWei on 17/3/22.
//  Copyright © 2017年 58cm. All rights reserved.
//

#import "CMLittlePassWordView.h"
#import "CMGestureConst.h"
@implementation CMLittlePassWordView


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self)
    {
      
        CGFloat width = kCircleLittleRadius;
        CGFloat height = kCircleLittleRadius;
        CGFloat startX = (self.frame.size.width-3*kCircleLittleRadius)/4.0;
        CGFloat startY = (self.frame.size.height-3*kCircleLittleRadius)/4.0;
        for (NSInteger index = 0; index < 9; index ++) {
            UIImageView *tempImageView = [[UIImageView alloc] initWithFrame:CGRectMake(startX + (width + startX) * (index % 3), startY + (width + startY) * (index / 3), width, height)];
            tempImageView.image=[UIImage imageNamed:kLittleCircleUnSelectBackImage];
            [self setValue:tempImageView forKey:[NSString stringWithFormat:@"ImageView%ld",(long)index]];
            [self addSubview:tempImageView];
        }

    }
    return self;
    
}
-(void)setPassWord:(NSString *)PassWord{

    if (PassWord.length>0) {
    for (NSInteger location = 0; location < PassWord.length; location ++) {
        NSString *tempString = [PassWord substringWithRange:NSMakeRange(location, 1)];
        UIImageView *tempimageView = [self valueForKey:[NSString stringWithFormat:@"ImageView%@", tempString]];
        tempimageView.image=[UIImage imageNamed:kLittleCircleSelectBackImage];
    }
    }else{
        
        for (NSInteger location = 0; location < 9; location ++) {
            UIImageView *tempimageView = [self valueForKey:[NSString stringWithFormat:@"ImageView%ld", location]];
            tempimageView.image=[UIImage imageNamed:kLittleCircleUnSelectBackImage];
        }
        
    }
}

@end
