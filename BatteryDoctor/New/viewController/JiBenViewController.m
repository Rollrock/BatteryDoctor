//
//  JiBenViewController.m
//  BatteryDoctor
//
//  Created by zhuang chaoxiao on 2018/10/8.
//  Copyright © 2018年 zhuang chaoxiao. All rights reserved.
//

#import "JiBenViewController.h"
#import "CommData.h"

@interface JiBenViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation JiBenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"基本信息";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma private

-(void)initViews
{
    NSLog(@"%@",[SystemSharedServices deviceName]);
    NSLog(@"%@",[SystemSharedServices deviceModel]);
    NSLog(@"%@",[SystemSharedServices systemName]);
    NSLog(@"%@",[SystemSharedServices systemsVersion]);
    NSLog(@"%d",[SystemSharedServices screenWidth]);
    NSLog(@"%d",[SystemSharedServices screenHeight]);
    /*
    NSLog(@"%@",[SystemSharedServices systemsUptime]);
    NSLog(@"%@",[SystemSharedServices ]);
    NSLog(@"%@",[SystemSharedServices ]);
    NSLog(@"%@",[SystemSharedServices ]);
    NSLog(@"%@",[SystemSharedServices ]);
    NSLog(@"%@",[SystemSharedServices ]);
    */
    
}

@end
