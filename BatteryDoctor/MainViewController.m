//
//  MainViewController.m
//  alarm
//
//  Created by zhuang chaoxiao on 15-6-15.
//  Copyright (c) 2015年 zhuang chaoxiao. All rights reserved.
//

#import "MainViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"


@interface MainViewController ()<RockTabDelegate>
{
    RockTabView * tabView;
    
    UINavigationController * currNC;
    
    UINavigationController * naVC1;
    UINavigationController * naVC2;
    UINavigationController * naVC3;
    UINavigationController * naVC4;
    
    NSMutableArray * navArray;
    
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    tabView = [[RockTabView alloc]init];
    tabView.delegate = self;
    [self.view addSubview:tabView];
    
    navArray = [NSMutableArray new];
    
    [self layoutVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)layoutVC
{
    FirstViewController * fVC = [[FirstViewController alloc]initWithNibName:@"FirstViewController" bundle:nil];
    naVC1 = [[UINavigationController alloc]initWithRootViewController:fVC];
    
    SecondViewController * sVC = [[SecondViewController alloc]initWithNibName:@"SecondViewController" bundle:nil];
    naVC2 = [[UINavigationController alloc]initWithRootViewController:sVC];
    
    ThirdViewController * tVC = [[ThirdViewController alloc]initWithNibName:@"ThirdViewController" bundle:nil];
    naVC3 = [[UINavigationController alloc]initWithRootViewController:tVC];

    FourthViewController * foVC = [[FourthViewController alloc]initWithNibName:@"FourthViewController" bundle:nil];
    naVC4 = [[UINavigationController alloc]initWithRootViewController:foVC];
    
    [navArray addObject:naVC1];
    [navArray addObject:naVC2];
    [navArray addObject:naVC3];
    [navArray addObject:naVC4];
    
    [self.view insertSubview:naVC1.view belowSubview:tabView];

    currNC = naVC1;
}



#pragma ROCKTabDelgate
-(void)tabClicked:(int)index
{
    if( currNC == [navArray objectAtIndex:index] )
    {
        return;
    }
    
    
    [currNC.view removeFromSuperview];
    
    currNC = [navArray objectAtIndex:index];
    [self.view insertSubview:currNC.view belowSubview:tabView];
    
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
