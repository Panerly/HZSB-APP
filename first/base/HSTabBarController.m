//
//  HSTabBarController.m
//  first
//
//  Created by HS on 16/5/20.
//  Copyright © 2016年 HS. All rights reserved.
//

#import "HSTabBarController.h"
#import "HomeViewController.h"
#import "SettingViewController.h"
#import "MeteringViewController.h"
#import "ServerViewController.h"
#import "HSNavigationController.h"
#import "MonitorViewController.h"


@interface HSTabBarController ()

@end

@implementation HSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    //添加自控制器
    HomeViewController *home = [[HomeViewController alloc] init];
    [self addOneChlildVc:home title:@"首页" imageName:@"home" selectedImageName:@"home_selected"];
    
    
    MeteringViewController *meter = [[MeteringViewController alloc] init];
    [self addOneChlildVc:meter title:@"抄表" imageName:@"metering" selectedImageName:@"metering_selected"];
    
    MonitorViewController *monitor = [[MonitorViewController alloc] init];
    [self addOneChlildVc:monitor title:@"监测" imageName:@"monitor" selectedImageName:@"monitor_selected"];
    
    ServerViewController *server = [[ServerViewController alloc] init];
    [self addOneChlildVc:server title:@"服务" imageName:@"server" selectedImageName:@"server_selected"];
    
    SettingViewController *setting = [[SettingViewController alloc] init];
    [self addOneChlildVc:setting title:@"设置" imageName:@"me" selectedImageName:@"me_selected"];
}

- (void)addOneChlildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
//        childVc.view.backgroundColor = [UIColor whiteColor];
    
    //自定义tabbarItem的颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor blackColor], NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateNormal];
    UIColor *titleHighlightedColor = [UIColor orangeColor];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       titleHighlightedColor, NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateSelected];
    
    // 设置标题
    // 相当于同时设置了tabBarItem.title和navigationItem.title
    childVc.title = title;
    
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    
    // 声明这张图片用原图(别渲染)
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = selectedImage;

    // 添加为tabbar控制器的子控制器
    HSNavigationController *nav = [[HSNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
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