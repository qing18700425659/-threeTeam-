//
//  AppDelegate.m
//  JiaXingNews
//
//  Created by DC20160426 on 16/6/3.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import "HUDViewController.h"
//＝＝＝＝＝＝＝＝＝＝ShareSDK头文件＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
//以下是ShareSDK必须添加的依赖库：
//1、libicucore.dylib
//2、libz.dylib
//3、libstdc++.dylib
//4、JavaScriptCore.framework

//＝＝＝＝＝＝＝＝＝＝以下是各个平台SDK的头文件，根据需要继承的平台添加＝＝＝
//腾讯开放平台（对应QQ和QQ空间）SDK头文件
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
//以下是腾讯SDK的依赖库：
//libsqlite3.dylib

//微信SDK头文件
#import "WXApi.h"
//以下是微信SDK的依赖库：
//libsqlite3.dylib

//新浪微博SDK头文件
#import "WeiboSDK.h"
//新浪微博SDK需要在项目Build Settings中的Other Linker Flags添加"-ObjC"
//以下是新浪微博SDK的依赖库：
//ImageIO.framework
//libsqlite3.dylib
//AdSupport.framework

//人人SDK头文件
#import <RennSDK/RennSDK.h>

//Kakao SDK头文件
#import <KakaoOpenSDK/KakaoOpenSDK.h>

//支付宝SDK
#import "APOpenAPI.h"

//易信SDK头文件
#import "YXApi.h"

//Facebook Messenger SDK
#import <FBSDKMessengerShareKit/FBSDKMessengerSharer.h>


#import <RennSDK/RennSDK.h>

@interface AppDelegate ()
@property(nonatomic,strong)MBProgressHUD *hud;
@end

@implementation AppDelegate

//------网络监测------
- ( void )newWorkStart{
    
   
    NSURL *url = [NSURL URLWithString: @"http://www.baidu.com"];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithBaseURL:url];
    //网络状态判断
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {

        if (status == AFNetworkReachabilityStatusReachableViaWiFi|| status == AFNetworkReachabilityStatusReachableViaWWAN){
            NSLog(@"网络正常");
        }else{
            NSLog(@"网络异常");
        }
    }];
    //开始检测
    [manager.reachabilityManager startMonitoring];
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self newWorkStart];
    [ShareSDK registerApp:@"q975308620"
          activePlatforms:@[
                            @(SSDKPlatformTypeSinaWeibo),
                            @(SSDKPlatformTypeTencentWeibo),
                            @(SSDKPlatformTypeMail),
                            @(SSDKPlatformTypeSMS),
                            @(SSDKPlatformTypeCopy),
                            @(SSDKPlatformTypeFacebook),
                            @(SSDKPlatformTypeTwitter),
                            @(SSDKPlatformTypeWechat),
                            @(SSDKPlatformTypeQQ),
                            @(SSDKPlatformTypeDouBan),
                            @(SSDKPlatformTypeRenren),
                            @(SSDKPlatformTypeKaixin),
                            @(SSDKPlatformTypeGooglePlus),
                            @(SSDKPlatformTypePocket),
                            @(SSDKPlatformTypeInstagram),
                            @(SSDKPlatformTypeLinkedIn),
                            @(SSDKPlatformTypeTumblr),
                            @(SSDKPlatformTypeFlickr),
                            @(SSDKPlatformTypeWhatsApp),
                            @(SSDKPlatformTypeYouDaoNote),
                            @(SSDKPlatformTypeLine),
                            @(SSDKPlatformTypeYinXiang),
                            @(SSDKPlatformTypeEvernote),
                            @(SSDKPlatformTypeYinXiang),
                            @(SSDKPlatformTypeAliPaySocial),
                            @(SSDKPlatformTypePinterest),
                            @(SSDKPlatformTypeKakao),
                            @(SSDKPlatformSubTypeKakaoTalk),
                            @(SSDKPlatformSubTypeKakaoStory),
                            @(SSDKPlatformTypeDropbox),
                            @(SSDKPlatformTypeVKontakte),
                            @(SSDKPlatformTypeMingDao),
                            @(SSDKPlatformTypePrint),
                            @(SSDKPlatformTypeYiXin),
                            @(SSDKPlatformTypeInstapaper),
                            @(SSDKPlatformTypeFacebookMessenger)
                            ]
                 onImport:^(SSDKPlatformType platformType) {
                     
                     switch (platformType)
                     {
                         case SSDKPlatformTypeWechat:
                             [ShareSDKConnector connectWeChat:[WXApi class]];
                             [ShareSDKConnector connectWeChat:[WXApi class] delegate:self];
                             break;
                         case SSDKPlatformTypeQQ:
                             [ShareSDKConnector connectQQ:[QQApiInterface class]
                                        tencentOAuthClass:[TencentOAuth class]];
                             break;
                         case SSDKPlatformTypeSinaWeibo:
                             [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                             break;
                         case SSDKPlatformTypeRenren:
                             [ShareSDKConnector connectRenren:[RennClient class]];
                             break;
                         default:
                             break;
                     }
                 }
          onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
              
              switch (platformType)
              {
                  case SSDKPlatformTypeSinaWeibo:
                      //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                      [appInfo SSDKSetupSinaWeiboByAppKey:@"568898243"
                                                appSecret:@"38a4f8204cc784f81f9f0daaf31e02e3"
                                              redirectUri:@"http://www.sharesdk.cn"
                                                 authType:SSDKAuthTypeBoth];
                      break;
                  case SSDKPlatformTypeTencentWeibo:
                      //设置腾讯微博应用信息，其中authType设置为只用Web形式授权
                      [appInfo SSDKSetupTencentWeiboByAppKey:@"801307650"
                                                   appSecret:@"ae36f4ee3946e1cbb98d6965b0b2ff5c"
                                                 redirectUri:@"http://www.sharesdk.cn"];
                      break;
                  case SSDKPlatformTypeFacebook:
                      //设置Facebook应用信息，其中authType设置为只用SSO形式授权
                      [appInfo SSDKSetupFacebookByApiKey:@"107704292745179"
                                               appSecret:@"38053202e1a5fe26c80c753071f0b573"
                                                authType:SSDKAuthTypeBoth];
                      break;
                  case SSDKPlatformTypeTwitter:
                      [appInfo SSDKSetupTwitterByConsumerKey:@"LRBM0H75rWrU9gNHvlEAA2aOy"
                                              consumerSecret:@"gbeWsZvA9ELJSdoBzJ5oLKX0TU09UOwrzdGfo9Tg7DjyGuMe8G"
                                                 redirectUri:@"http://mob.com"];
                      break;
                  case SSDKPlatformTypeWechat:
                      [appInfo SSDKSetupWeChatByAppId:@"wx4868b35061f87885"
                                            appSecret:@"64020361b8ec4c99936c0e3999a9f249"];
                      break;
                  case SSDKPlatformTypeQQ:
                      [appInfo SSDKSetupQQByAppId:@"100371282"
                                           appKey:@"aed9b0303e3ed1e27bae87c33761161d"
                                         authType:SSDKAuthTypeBoth];
                      break;
                  case SSDKPlatformTypeDouBan:
                      [appInfo SSDKSetupDouBanByApiKey:@"02e2cbe5ca06de5908a863b15e149b0b"
                                                secret:@"9f1e7b4f71304f2f"
                                           redirectUri:@"http://www.sharesdk.cn"];
                      break;
                  case SSDKPlatformTypeRenren:
                      [appInfo SSDKSetupRenRenByAppId:@"226427"
                                               appKey:@"fc5b8aed373c4c27a05b712acba0f8c3"
                                            secretKey:@"f29df781abdd4f49beca5a2194676ca4"
                                             authType:SSDKAuthTypeBoth];
                      break;
                  case SSDKPlatformTypeKaixin:
                      [appInfo SSDKSetupKaiXinByApiKey:@"358443394194887cee81ff5890870c7c"
                                             secretKey:@"da32179d859c016169f66d90b6db2a23"
                                           redirectUri:@"http://www.sharesdk.cn/"];
                      break;
                  case SSDKPlatformTypeGooglePlus:
                      
                      [appInfo SSDKSetupGooglePlusByClientID:@"232554794995.apps.googleusercontent.com"
                                                clientSecret:@"PEdFgtrMw97aCvf0joQj7EMk"
                                                 redirectUri:@"http://localhost"];
                      break;
                  case SSDKPlatformTypePocket:
                      [appInfo SSDKSetupPocketByConsumerKey:@"11496-de7c8c5eb25b2c9fcdc2b627"
                                                redirectUri:@"pocketapp1234"
                                                   authType:SSDKAuthTypeBoth];
                      break;
                  case SSDKPlatformTypeInstagram:
                      [appInfo SSDKSetupInstagramByClientID:@"ff68e3216b4f4f989121aa1c2962d058"
                                               clientSecret:@"1b2e82f110264869b3505c3fe34e31a1"
                                                redirectUri:@"http://sharesdk.cn"];
                      break;
                  case SSDKPlatformTypeLinkedIn:
                      [appInfo SSDKSetupLinkedInByApiKey:@"ejo5ibkye3vo"
                                               secretKey:@"cC7B2jpxITqPLZ5M"
                                             redirectUrl:@"http://sharesdk.cn"];
                      break;
                  case SSDKPlatformTypeTumblr:
                      [appInfo SSDKSetupTumblrByConsumerKey:@"2QUXqO9fcgGdtGG1FcvML6ZunIQzAEL8xY6hIaxdJnDti2DYwM"
                                             consumerSecret:@"3Rt0sPFj7u2g39mEVB3IBpOzKnM3JnTtxX2bao2JKk4VV1gtNo"
                                                callbackUrl:@"http://sharesdk.cn"];
                      break;
                  case SSDKPlatformTypeFlickr:
                      [appInfo SSDKSetupFlickrByApiKey:@"33d833ee6b6fca49943363282dd313dd"
                                             apiSecret:@"3a2c5b42a8fbb8bb"];
                      break;
                  case SSDKPlatformTypeYouDaoNote:
                      [appInfo SSDKSetupYouDaoNoteByConsumerKey:@"dcde25dca105bcc36884ed4534dab940"
                                                 consumerSecret:@"d98217b4020e7f1874263795f44838fe"
                                                  oauthCallback:@"http://www.sharesdk.cn/"];
                      break;
                      
                      //印象笔记分为国内版和国际版，注意区分平台
                      //设置印象笔记（中国版）应用信息
                  case SSDKPlatformTypeYinXiang:
                      
                      //设置印象笔记（国际版）应用信息
                  case SSDKPlatformTypeEvernote:
                      [appInfo SSDKSetupEvernoteByConsumerKey:@"sharesdk-7807"
                                               consumerSecret:@"d05bf86993836004"
                                                      sandbox:YES];
                      break;
                  case SSDKPlatformTypeKakao:
                      [appInfo SSDKSetupKaKaoByAppKey:@"48d3f524e4a636b08d81b3ceb50f1003"
                                           restApiKey:@"ac360fa50b5002637590d24108e6cb10"
                                          redirectUri:@"http://www.mob.com/oauth"
                                             authType:SSDKAuthTypeBoth];
                      break;
                  case SSDKPlatformTypeAliPaySocial:
                      [appInfo SSDKSetupAliPaySocialByAppId:@"2015072400185895"];
                      break;
                  case SSDKPlatformTypePinterest:
                      [appInfo SSDKSetupPinterestByClientId:@"4797078908495202393"];
                      break;
                  case SSDKPlatformTypeDropbox:
                      [appInfo SSDKSetupDropboxByAppKey:@"i5vw2mex1zcgjcj"
                                              appSecret:@"3i9xifsgb4omr0s"
                                          oauthCallback:@"https://www.sharesdk.cn"];
                      break;
                  case SSDKPlatformTypeVKontakte:
                      [appInfo SSDKSetupVKontakteByApplicationId:@"5312801"
                                                       secretKey:@"ZHG2wGymmNUCRLG2r6CY"];
                      break;
                  case SSDKPlatformTypeMingDao:
                      [appInfo SSDKSetupMingDaoByAppKey:@"EEEE9578D1D431D3215D8C21BF5357E3"
                                              appSecret:@"5EDE59F37B3EFA8F65EEFB9976A4E933"
                                            redirectUri:@"http://sharesdk.cn"];
                      break;
                  case SSDKPlatformTypeYiXin:
                      [appInfo SSDKSetupYiXinByAppId:@"yx0d9a9f9088ea44d78680f3274da1765f"
                                           appSecret:@"1a5bd421ae089c3"
                                         redirectUri:@"https://open.yixin.im/resource/oauth2_callback.html"
                                            authType:SSDKAuthTypeBoth];
                      break;
                  case SSDKPlatformTypeInstapaper:
                      [appInfo SSDKSetupInstapaperByConsumerKey:@"4rDJORmcOcSAZL1YpqGHRI605xUvrLbOhkJ07yO0wWrYrc61FA"
                                                 consumerSecret:@"GNr1GespOQbrm8nvd7rlUsyRQsIo3boIbMguAl9gfpdL0aKZWe"];
                      break;
                  default:
                      break;
              }
          }];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "Green.JiaXingNews" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"JiaXingNews" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"JiaXingNews.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
