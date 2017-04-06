//
//  CMVerifyViewController.m
//  test
//
//  Created by WangWei on 17/3/22.
//  Copyright © 2017年 58cm. All rights reserved.
// 验证手势密码

#import "CMVerifyViewController.h"
#import "CMPasswordView.h"
#import "UILabel+LabelShark.h"
#import "CMGestureConst.h"
@interface CMVerifyViewController ()<CMPasswordDelegate>

@property(nonatomic,strong)UILabel *warnLabel;
@property(nonatomic,strong)CMPasswordView *PasswordView;



@end

@implementation CMVerifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.PasswordView];
    [self.view addSubview:self.warnLabel];
    [self.warnLabel normalLabel:@"请输入原手势密码!"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark lazy


-(UILabel*)warnLabel{
    if (!_warnLabel) {
        
        _warnLabel=[[UILabel alloc]init];
        _warnLabel.textAlignment=NSTextAlignmentCenter;
        _warnLabel.font=[UIFont systemFontOfSize:14.0];
        _warnLabel.frame=CGRectMake(0, CGRectGetMinY(self.PasswordView.frame), self.view.frame.size.width,17);
    }
    return _warnLabel;
}

-(CMPasswordView*)PasswordView{
    if (!_PasswordView) {
        
        _PasswordView = [[CMPasswordView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/4.0, self.view.frame.size.width, kPasswordViewSideLength)];
        _PasswordView.backgroundColor = [UIColor clearColor];
        _PasswordView.delegate = self;
        
        
        
    }
    return _PasswordView;
}

- (void)passwordView:(CMPasswordView*)passwordView withPassword:(NSString*)password{
     NSString *str=[[NSUserDefaults standardUserDefaults]objectForKey:@"finalPassword"];
    NSLog(@"+++%@++%@",password,str);
    
    if (password.length<4) {
        
        [self.warnLabel showWarnLabelAndShark:@"最少连接4个点,请重新连接!"];
        
    }else{
        
        if ([str isEqualToString:password]) {
             [self.warnLabel successLabel:@"验证成功!"];
            
            
        }else{
           [self.warnLabel showWarnLabelAndShark:@"密码错误!"];
        }
        
        
        
           }
    
    
    
}
@end
