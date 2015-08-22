//
//  CommData.h
//  alarm
//
//  Created by zhuang chaoxiao on 15-6-15.
//  Copyright (c) 2015年 zhuang chaoxiao. All rights reserved.
//

#ifndef alarm_CommData_h
#define alarm_CommData_h



#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define TAB_WIDTH   SCREEN_WIDTH
#define TAB_HEIGHT  50
#define TAB_NUM   4

#define TAB_ICON_W 30
#define TAB_ICON_H 30



#define RGB(r,g,b) [UIColor colorWithRed:(r/255.0f) green:(g/255.0f)  blue:(b/255.0f) alpha:(1)]
#define COMMON_BG_COLOR  RGB(10,10,10)

#define COLOR_FROM_HEX(hexValue) ([UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0])


#define EXTERN_YEAR  2015
#define EXTERN_MONTH 9
#define EXTERN_DAY   5

#define DataCounterKeyWWANSent @"WWANSent"
#define DataCounterKeyWWANReceived   @"WWANReceived"
#define DataCounterKeyWiFiSent   @"WiFiSent"
#define DataCounterKeyWiFiReceived   @"WiFiReceived"


#define SHARE_TEXT @"XY苹果助手-性能优化网络提速，安装量最大的手机优化APP  https://itunes.apple.com/us/app/xy-shou-ji-zhu-shou-xing-neng/id1020595864?l=zh&ls=1&mt=8"
#define SHARE_URL  @"https://itunes.apple.com/us/app/xy-shou-ji-zhu-shou-xing-neng/id1020595864?l=zh&ls=1&mt=8"
#define SHARE_IMAGE  ([UIImage imageNamed:@"back"])

#define UM_SHARE_KEY  @"55b1a17ee0f55a2205000ade"

//////////////////////////////////////////////

#define ADV_BUYED  @"ADV_BUYED"

#define STORE_NET_INFO  @"STORE_NET_INFO"
#define STORE_SIGN_INFO  @"STORE_SIGN_INFO"
//
#define STORE_NET_CLEAN_DATE @"STORE_NET_CLEAN_DATE"
#define STORE_STORAGE_CLEAN_DATE  @"STORE_STORAGE_CLEAN_DATE"
#define STORE_BATTERY_CLEAN_DATE   @"STORE_BATTERY_CLEAN_DATE"

//
#define NET_CLEAN_KEEP       (3600*24*5)
#define STORAGE_CLEAN_KEEP   (3600*24*2)
#define BATTERY_CLEAR_KEEP   (3600*24*4)

#endif
