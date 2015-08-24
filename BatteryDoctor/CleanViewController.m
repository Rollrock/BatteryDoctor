//
//  CleanViewController.m
//  NewiPhoneADV
//
//  Created by zhuang chaoxiao on 15/8/14.
//  Copyright (c) 2015年 zhuang chaoxiao. All rights reserved.
//

#import "CleanViewController.h"
#import "SVProgressHUD.h"
#import "commData.h"
#import "BaiduMobAdInterstitial.h"
#import "AppDelegate.h"


@interface CleanViewController ()<BaiduMobAdInterstitialDelegate,UIAlertViewDelegate>
{
    BaiduMobAdInterstitial* adInterstitial;
    BOOL _adloaded;
    
    NSInteger cleanCount;
}
@property (weak, nonatomic) IBOutlet UIView *netView;
@property (weak, nonatomic) IBOutlet UIView *storgeView;
@property (weak, nonatomic) IBOutlet UIView *batteryView;
@property (weak, nonatomic) IBOutlet UILabel *resultTipLab;

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *countLab;

- (IBAction)netCleanClicked;
- (IBAction)storageCleanClicked;
- (IBAction)batteryCleanClicked;

@end

@implementation CleanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
 
    
    self.title = @"系统清理";
    
    {
        UIColor *color = [UIColor whiteColor];
        UIFont * font = [UIFont systemFontOfSize:20];
        NSDictionary * dict = [NSDictionary dictionaryWithObjects:@[color,font] forKeys:@[NSForegroundColorAttributeName ,NSFontAttributeName]];
        self.navigationController.navigationBar.titleTextAttributes = dict;
    }
    
    cleanCount = 999;
    
    //
    [self reLayoutSubview];
    
    [self initCountLab];
    
    [self preLoadAdv];

    //
    
    UIBarButtonItem * leftBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"NavBack"] style:UIBarButtonItemStyleDone target:self action:@selector(leftClicked)];
    [self.navigationItem setLeftBarButtonItem:leftBtn];
    
}

-(void)leftClicked
{
    [self.navigationController popViewControllerAnimated:YES];
}



-(void)preLoadAdv
{
    adInterstitial = [[BaiduMobAdInterstitial alloc] init];
    adInterstitial.delegate = self;
    adInterstitial.interstitialType = BaiduMobAdViewTypeInterstitialOther;
    //加载全屏插屏
    [adInterstitial load];
}

- (void)interstitialSuccessToLoadAd:(BaiduMobAdInterstitial *)interstitial
{
    _adloaded = YES;
    
    NSLog(@"interstitialSuccessToLoadAd");
    
    [self showADV];
}

/*
 *  广告预加载失败
 */
- (void)interstitialFailToLoadAd:(BaiduMobAdInterstitial *)interstitial
{
    _adloaded = NO;
}

- (NSString *)publisherId
{
    return @"fece40ae";
}

/**
 *  应用在union.baidu.com上的APPID
 */
- (NSString*) appSpec
{
    return @"fece40ae";
}


-(void)showADV
{
    //展示插屏前要check是否ready
    if (adInterstitial.isReady && (cleanCount == 0))
    {
        [adInterstitial presentFromRootViewController:self];
    }
}

-(void)initCountLab
{
    
    cleanCount = 0;
    
    if( [self getCleanFlag:STORE_NET_CLEAN_DATE withKeep:NET_CLEAN_KEEP] )
    {
        cleanCount++;
    }
    
    //
    if( [self getCleanFlag:STORE_STORAGE_CLEAN_DATE withKeep:STORAGE_CLEAN_KEEP] )
    {
        cleanCount++;
    }
    
    //
    if( [self getCleanFlag:STORE_BATTERY_CLEAN_DATE withKeep:BATTERY_CLEAR_KEEP] )
    {
        cleanCount++;
    }
    
    _countLab.text = [NSString stringWithFormat:@"%d",cleanCount];
    
    if( cleanCount == 0 )
    {
        [self showADV];
        
        _resultTipLab.text = @"您的系统很安全";
    }
}

-(void)reLayoutSubview
{
    CGFloat yPos =  _netView.frame.origin.y;
    
    if( ![self getCleanFlag:STORE_NET_CLEAN_DATE withKeep:NET_CLEAN_KEEP] )
    {
        _netView.hidden = YES;
    }
    else
    {
        yPos += _netView.frame.size.height+2;
    }
    
    //
    if( ![self getCleanFlag:STORE_STORAGE_CLEAN_DATE withKeep:STORAGE_CLEAN_KEEP] )
    {
        _storgeView.hidden = YES;
    }
    else
    {
        _storgeView.frame = CGRectMake(_storgeView.frame.origin.x,yPos, _storgeView.frame.size.width, _storgeView.frame.size.height);
        
        yPos += _storgeView.frame.size.height+2;
    }
    
    //
    if( ![self getCleanFlag:STORE_BATTERY_CLEAN_DATE withKeep:BATTERY_CLEAR_KEEP] )
    {
        _batteryView.hidden = YES;
    }
    else
    {
        _batteryView.frame = CGRectMake(_batteryView.frame.origin.x,yPos, _batteryView.frame.size.width, _batteryView.frame.size.height);
        
        yPos += _batteryView.frame.size.height;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self reLayoutSubview];
}

-(void)layoutSubviews
{
     [self reLayoutSubview];
}

-(void)setCleanFlag:(NSString*)name
{
    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
    [def setObject:[NSDate date] forKey:name];
    [def synchronize];
}

-(BOOL)getCleanFlag:(NSString*)name withKeep:(NSInteger)keep
{
    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
    NSDate * d1 = [def objectForKey:name];
    NSDate * d2 = [NSDate date];
    
    if( [d2 timeIntervalSince1970] - [d1 timeIntervalSince1970] >= keep )
    {
        return YES;
    }
    
    return NO;
}

-(void)dismissSVP
{
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
 
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    
    //
    [SVProgressHUD showSuccessWithStatus:@"优化成功"];
    
    //
    [self initCountLab];
}

- (IBAction)netCleanClicked
{
    if( ! [self goodRated] )
    {
        return;
    }
    
    [self setCleanFlag:STORE_NET_CLEAN_DATE];
    
    [SVProgressHUD showWithStatus:@"清理中..." maskType:SVProgressHUDMaskTypeClear];
    
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(dismissSVP) userInfo:nil repeats:NO];
}

- (IBAction)storageCleanClicked
{
    if( ! [self goodRated] )
    {
        return;
    }
    
    [self setCleanFlag:STORE_STORAGE_CLEAN_DATE];
    
    [SVProgressHUD showWithStatus:@"清理中..." maskType:SVProgressHUDMaskTypeClear];
    
    [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(dismissSVP) userInfo:nil repeats:NO];
}

- (IBAction)batteryCleanClicked
{
    if( ! [self goodRated] )
    {
        return;
    }
    
    [self setCleanFlag:STORE_BATTERY_CLEAN_DATE];
    
    [SVProgressHUD showWithStatus:@"清理中..." maskType:SVProgressHUDMaskTypeClear];
    
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(dismissSVP) userInfo:nil repeats:NO];

}

-(BOOL)goodRated
{
    if( ! [self showForceRate] )
    {
        return YES;
    }
    
    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
    BOOL bFlag = [def boolForKey:STORE_RATE_FLAG];
    
    if( !bFlag )
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"给个5星好评吧，不然给你清理系统没动力啊.... " delegate:self cancelButtonTitle:@"无情拒绝" otherButtonTitles:@"现在就去", nil];
        [alert show];
    }
    
    return bFlag;
}

-(void)setGoodRated
{
    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
    [def setBool:YES forKey:STORE_RATE_FLAG];
}

-(BOOL)showForceRate
{
    NSDateComponents * data = [[NSDateComponents alloc]init];
    NSCalendar * cal = [NSCalendar currentCalendar];
    
    [data setCalendar:cal];
    [data setYear:EXTERN_YEAR];
    [data setMonth:EXTERN_MONTH];
    [data setDay:EXTERN_DAY];
    
    NSDate * farDate = [cal dateFromComponents:data];
    
    NSDate *now = [NSDate date];
    
    NSTimeInterval farSec = [farDate timeIntervalSince1970];
    NSTimeInterval nowSec = [now timeIntervalSince1970];
    
    if( nowSec - farSec >= 0 )
    {
        return YES;
    }
    
    return NO;
}

#pragma
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if( buttonIndex == 1 )
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:SHARE_URL]];
        
        [self setGoodRated];
    }
}

@end
