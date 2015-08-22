//
//  FirstViewController.m
//  BatteryDoctor
//
//  Created by zhuang chaoxiao on 15/8/22.
//  Copyright (c) 2015年 zhuang chaoxiao. All rights reserved.
//

#import "FirstViewController.h"
#import "VWWWaterView.h"
#import "SignViewController.h"
#import "BaiduMobAdView.h"

@import GoogleMobileAds;

@interface FirstViewController ()<WaterViewDelegate,BaiduMobAdViewDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UIView *signView;

@property (weak, nonatomic) IBOutlet VWWWaterView *batteryView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _batteryView.waterDelegate  = self;

    //
    self.title = @"电池体检";
    
    {
        UIColor *color = [UIColor whiteColor];
        UIFont * font = [UIFont systemFontOfSize:20];
        NSDictionary * dict = [NSDictionary dictionaryWithObjects:@[color,font] forKeys:@[NSForegroundColorAttributeName ,NSFontAttributeName]];
        self.navigationController.navigationBar.titleTextAttributes = dict;
    }
    
    [self layoutAdv];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSString *)publisherId
{
    return @"fece40ae";
}

- (NSString*) appSpec
{
    return @"fece40ae";
}

-(void)layoutAdv
{
    /*
    BaiduMobAdView * _baiduView = [[BaiduMobAdView alloc]init];
    _baiduView.AdType = BaiduMobAdViewTypeBanner;
    _baiduView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-60-50, kBaiduAdViewBanner468x60.width, kBaiduAdViewBanner468x60.height);
    _baiduView.delegate = self;
    [self.view addSubview:_baiduView];
    [_baiduView start];
     */
    
    CGPoint pt ;
    
    pt = CGPointMake(0, [UIScreen mainScreen].bounds.size.height-60-50);
    GADBannerView * _bannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeFullBanner origin:pt];
    
    _bannerView.adUnitID = @"ca-app-pub-3058205099381432/7929977146";//调用你的id
    _bannerView.rootViewController = self;
    [_bannerView loadRequest:[GADRequest request]];
    
    [self.view addSubview:_bannerView];
    
}



#pragma arguments
-(CGFloat)getPercent
{
    return 0.75;
}

//
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * t = [touches anyObject];
    CGPoint pt;
    
    pt = [t locationInView:_signView];
    
    if( CGRectContainsPoint(_signView.bounds, pt) )
    {
        SignViewController * vc = [[SignViewController alloc]initWithNibName:@"SignViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
        
        return;
    }
    
    /*
    pt = [t locationInView:_netSpeedTestLab];
    if( CGRectContainsPoint(_netSpeedTestLab.bounds,pt))
    {
        NetSpeedViewController * vc = [[NetSpeedViewController alloc]initWithNibName:@"NetSpeedViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
        
        return;
    }
    
    pt = [t locationInView:_netSpyLab];
    if( CGRectContainsPoint(_netSpyLab.bounds,pt))
    {
        NetSpyViewController * vc = [[NetSpyViewController alloc]initWithNibName:@"NetSpyViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
        
        return;
    }
     */
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
