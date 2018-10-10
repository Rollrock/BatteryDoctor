//
//  JiBenViewController.m
//  BatteryDoctor
//
//  Created by zhuang chaoxiao on 2018/10/8.
//  Copyright © 2018年 zhuang chaoxiao. All rights reserved.
//

#import "JiBenViewController.h"
#import "CommData.h"
#import "DianChiTableViewCell.h"

@interface JiBenViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSMutableDictionary * dict;

@end

@implementation JiBenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"基本信息";
    
    [self initViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UITableView
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"DianChiTableViewCell";
    
    DianChiTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if( !cell )
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil] lastObject];
    }
    
    [cell refreshCell:[self.dict allKeys][indexPath.row] value:[self.dict allValues][indexPath.row]];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dict allKeys].count;
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

    NSLog(@"%@",[SystemSharedServices systemsUptime]);
    NSLog(@"%f",[SystemSharedServices screenBrightness]);
    NSLog(@"%d",[SystemSharedServices numberProcessors]);//进程数
    NSLog(@"%d",[SystemSharedServices numberActiveProcessors]);//活动进程数
    NSLog(@"%d",[SystemSharedServices processorSpeed]);
    NSLog(@"%d",[SystemSharedServices processorBusSpeed]);
    NSLog(@"%@",[SystemSharedServices carrierName]);//运营商
    NSLog(@"%@",[SystemSharedServices carrierCountry]);//运营商
    NSLog(@"%f",[SystemSharedServices batteryLevel]);//电池等级
    NSLog(@"%@",[SystemSharedServices currentIPAddress]);//ip地址
    NSLog(@"%@",[SystemSharedServices currentMACAddress]);//mac 地址
    NSLog(@"%@",[SystemSharedServices wiFiIPAddress]);//wifi地址
    NSLog(@"%@",[SystemSharedServices wiFiMACAddress]); //wifi mac 地址
    NSLog(@"%d",[SystemSharedServices connectedToWiFi]);//是否连接wifi
    
    
}


#pragma setter & getter
-(NSMutableDictionary*)dict
{
    if( !_dict )
    {
        _dict = [NSMutableDictionary new];
        
        [_dict setObject:[SystemSharedServices deviceName] forKey:@"手机名称"];
        [_dict setObject:[SystemSharedServices deviceModel] forKey:@"手机型号"];
        [_dict setObject:[SystemSharedServices systemName] forKey:@"系统版本"];
        [_dict setObject:[NSString stringWithFormat:@"%d",[SystemSharedServices screenWidth]] forKey:@"屏幕宽度"];
        [_dict setObject:[NSString stringWithFormat:@"%d",[SystemSharedServices screenHeight]] forKey:@"屏幕高度"];
        [_dict setObject:[SystemSharedServices carrierName] forKey:@"运营商"];
        [_dict setObject:[NSString stringWithFormat:@"%.2f",[SystemSharedServices batteryLevel]] forKey:@"电池电量"];
        [_dict setObject:[SystemSharedServices currentIPAddress] forKey:@"IP地址"];
        [_dict setObject:[SystemSharedServices currentMACAddress] forKey:@"MAC地址"];
        [_dict setObject:[SystemSharedServices wiFiIPAddress] forKey:@"WIFI地址"];
        [_dict setObject:[SystemSharedServices wiFiMACAddress] forKey:@"WIFIMAC地址"];
        [_dict setObject:[SystemSharedServices connectedToWiFi]?@"已连接":@"未连接" forKey:@"连接WIFI"];
        
        [_dict setObject:[NSString stringWithFormat:@"%d",[SystemSharedServices numberProcessors]] forKey:@"所有进程数"];
        [_dict setObject:[NSString stringWithFormat:@"%d",[SystemSharedServices numberActiveProcessors]] forKey:@"活跃进程数"];
        
    }
    
    return _dict;
}

@end
