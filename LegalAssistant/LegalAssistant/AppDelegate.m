//
//  AppDelegate.m
//  LegalAssistant
//
//  Created by lang on 2021/6/11.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "MsgCenterViewController.h"
#import "PersonalViewController.h"
#import "ChooseIdentityVC.h"
#import "ZXNavigationBarNavigationController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //首页
    HomeViewController *vc = [[HomeViewController alloc]init];
    UINavigationController *fNav = [[UINavigationController alloc]initWithRootViewController:vc];
//    ZXNavigationBarNavigationController *fNav = [[ZXNavigationBarNavigationController alloc] initWithRootViewController:vc];
    //消息中心
    MsgCenterViewController *vc1 = [[MsgCenterViewController alloc]init];
    ZXNavigationBarNavigationController *sNav = [[ZXNavigationBarNavigationController alloc] initWithRootViewController:vc1];
    //个人中心
    PersonalViewController *vc2 = [[PersonalViewController alloc]init];
    ZXNavigationBarNavigationController *frNav = [[ZXNavigationBarNavigationController alloc] initWithRootViewController:vc2];

    UITabBarController *tab = [[UITabBarController alloc]init];
    //去掉背景颜色
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [UITabBar appearance].translucent = NO;
//    //去掉黑线
//    [tab.tabBar setBackgroundImage:[UIImage new]];
//    [tab.tabBar setShadowImage:[UIImage new]];
    tab.viewControllers = @[fNav,sNav,frNav];
    
    self.window.rootViewController = tab;
    [self.window makeKeyAndVisible];
    
    return YES;
}



@end
