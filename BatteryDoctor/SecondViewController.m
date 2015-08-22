//
//  SecondViewController.m
//  BatteryDoctor
//
//  Created by zhuang chaoxiao on 15/8/22.
//  Copyright (c) 2015年 zhuang chaoxiao. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewWidhtConst;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

    const CGFloat perW = [UIScreen mainScreen].bounds.size.width;
 
    for( int i = 1; i < 20;++ i )
    {
        UIImage * img =[UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
        CGFloat imgW = img.size.width/2.4;
        CGFloat imgH = img.size.height/2.4;
        
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake((i-1)*perW+(perW-imgW)/2.0, 10, imgW, imgH)];
        imgView.image = img;
        [_contentView addSubview:imgView];
    }
    
    _contentViewWidhtConst.constant = 19*[UIScreen mainScreen].bounds.size.width;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
