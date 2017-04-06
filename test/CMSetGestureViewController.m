//
//  CMSetGestureViewController.m
//  test
//
//  Created by WangWei on 17/3/22.
//  Copyright © 2017年 58cm. All rights reserved.
//

#import "CMSetGestureViewController.h"
#import "CMPasswordView.h"
#import "CMLittlePassWordView.h"
#import "UILabel+LabelShark.h"
#import "CMGestureConst.h"
@interface CMSetGestureViewController ()<CMPasswordDelegate>

@property(nonatomic,strong)CMLittlePassWordView *littleViewPassWord;
@property(nonatomic,strong)UILabel *warnLabel;
@property(nonatomic,strong)CMPasswordView *PasswordView;
@property(nonatomic,strong)NSString *littlePassWord;
@property(nonatomic,assign)int gestureCount;
@property(nonatomic,strong)UIButton *resetPassWord;
@end

@implementation CMSetGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.littleViewPassWord];
    [self.view addSubview:self.warnLabel];
    [self.view addSubview:self.PasswordView];
    [self.view addSubview:self.resetPassWord];
    [self.warnLabel normalLabel:@"绘制解锁图案"];
    self.littlePassWord=@"";
    _gestureCount=0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 设置界面
-(CMLittlePassWordView*)littleViewPassWord{
    if (!_littleViewPassWord) {
        
        _littleViewPassWord = [[CMLittlePassWordView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-100)/2, 50, 100,100)];
        _littleViewPassWord.backgroundColor = [UIColor clearColor];
        
    }
    
    return _littleViewPassWord;
    
}
-(UILabel*)warnLabel{
    if (!_warnLabel) {
        
        _warnLabel=[[UILabel alloc]init];
        _warnLabel.textAlignment=NSTextAlignmentCenter;
        _warnLabel.font=[UIFont systemFontOfSize:14.0];
        _warnLabel.frame=CGRectMake(0, CGRectGetMaxY(self.littleViewPassWord.frame), self.view.frame.size.width,17);
    }
    return _warnLabel;
}
-(CMPasswordView*)PasswordView{
    if (!_PasswordView) {
        
        _PasswordView = [[CMPasswordView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.warnLabel.frame), self.view.frame.size.width, kPasswordViewSideLength)];
        _PasswordView.backgroundColor = [UIColor clearColor];
        _PasswordView.delegate = self;
   
        
        
    }
    return _PasswordView;
}
-(UIButton*)resetPassWord{
    if (!_resetPassWord) {
        _resetPassWord=[UIButton buttonWithType:UIButtonTypeSystem];
        [_resetPassWord setTitle:@"重新设置" forState:UIControlStateNormal];
        [_resetPassWord setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _resetPassWord.titleLabel.font=[UIFont systemFontOfSize:18.0];
        _resetPassWord.frame=CGRectMake(0, CGRectGetMaxY(self.PasswordView.frame), self.view.frame.size.width, 20);
        [_resetPassWord addTarget:self action:@selector(resetPassWordClick) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    
    return _resetPassWord;
}
- (void)passwordView:(CMPasswordView*)passwordView withPassword:(NSString*)password{
    
    
    
    if (password.length<4) {
        
        [self.warnLabel showWarnLabelAndShark:@"最少连接4个点,请重新连接!"];
      
    }else{
        
        _gestureCount ++;
        if (_gestureCount>1) {
         NSString *str= [CMGestureConst getGestureWithKey:@"firstPassword"];
            
            
            if ([str isEqualToString:password]) {
                [CMGestureConst saveGesture:password Key:@"finalPassword"];
                [self.warnLabel successLabel:@"设置密码成功"];
                [self dismissViewControllerAnimated:YES completion:nil];
            }else{
                [self.warnLabel showWarnLabelAndShark:@"两次手势密码不一样!"];
               
            }
        }else{
            self.littleViewPassWord.PassWord=password;
            [self.warnLabel showWarnLabel:@"再次绘制解锁图案"];
            [CMGestureConst saveGesture:password Key:@"firstPassword"];
           
        }
           }
    

    
}
-(void)resetPassWordClick{
 
    [CMGestureConst removeGesture:@"firstPassword"];
    _gestureCount=0;
    
    self.littleViewPassWord.PassWord=@"";
  
    [self.warnLabel normalLabel:@"绘制解锁图案"];
}

@end
