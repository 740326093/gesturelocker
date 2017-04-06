//
//  ViewController.m
//  test
//
//  Created by WangWei on 17/3/22.
//  Copyright © 2017年 58cm. All rights reserved.
//

#import "ViewController.h"
#import "CMPasswordView.h"
#import "CMLittlePassWordView.h"

#import "CMSetGestureViewController.h"
#import "CMVerifyViewController.h"
@interface ViewController ()<CMScrollSliderDelegate>
{
    int realoff;
}
@property(nonatomic,strong) CMScrollSlider *productSlider;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 100, self.view.frame.size.width, 100);
    [btn setTitle:@"设置手势密码" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(setBtnTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *yan = [UIButton buttonWithType:UIButtonTypeCustom];
    yan.frame = CGRectMake(0,250, self.view.frame.size.width, 100);
    [yan setTitle:@"验证手势密码" forState:UIControlStateNormal];
    [yan setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [yan addTarget:self action:@selector(yanBtnTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:yan];

    
    
    
    
    
   _productSlider=[[CMScrollSlider alloc]initWithFrame:CGRectMake(20,360,200,100) MinValue:0 MaxValue:60 Step:1];

   //[productSlider.collectionView setContentOffset:CGPointMake(self.countNum*5, 0) animated:NO];
    _productSlider.delegate=self;
    [self.view addSubview:_productSlider];
    
    realoff=0;
    
    
    
    
    
    
}
-(void)CMScrollSlider:(CMScrollSlider *)slider ValueChange:(int)value{
    
    
    
}
-(void)CMScrollSliderMove:(CMScrollSlider *)slider ValueChange:(int)value{
    NSLog(@"+++%d",value);
   
    if (value<=9) {
        realoff=10;
           }
   else if (value==11) {
        realoff=20;
     
   
    }
   else if (value==19){
      realoff=10;
   }
   else if (value==30) {
       realoff=20;
   }
   else if (value==21) {
       realoff=30;
      
   }
   else if (value==29) {
       realoff=20;
       
   }
   else if (value==31){
     realoff=40;
       
   }
   else if (value==39){
       realoff=30;
       
   }
   else if (value==41){
       realoff=50;
       
   }
   else if (value==49){
       realoff=40;
       
   }
   else if (value==51){
       realoff=60;
       
   }
   else if (value==59){
       realoff=50;
       
   }
    [_productSlider.collectionView setContentOffset:CGPointMake(realoff*6, 0) animated:NO];
//    
//   else if (value>20&&value<=30) {
//        value=30;
//    }
//   else if (value>30&&value<=40) {
//       value=40;
//   }
//   else if (value>40&&value<=50) {
//       value=50;
//   }
//   else if (value>50&&value<=60) {
//       value=60;
//   }

           
    
    
    //_productSlider.valueTF.text=[NSString stringWithFormat:@"%d",10];
  // [_productSlider.collectionView setContentOffset:CGPointMake(realoff*6, 0) animated:YES];
  
}

-(void)setBtnTap
{
//    CMSetGestureViewController *oo = [[CMSetGestureViewController alloc] init];
//    [self presentViewController:oo animated:YES completion:nil];
}
-(void)yanBtnTap{
    
//    CMVerifyViewController *oo = [[CMVerifyViewController alloc] init];
//    [self presentViewController:oo animated:YES completion:nil];
//    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
