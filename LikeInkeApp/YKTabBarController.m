//
//  YKTabBarController.m
//  LikeInkeApp
//
//  Created by M_Li on 2017/6/30.
//  Copyright © 2017年 M_Li. All rights reserved.
//

#import "YKTabBarController.h"
#import "YKNavigationController.h"
#import "MainViewController.h"
#import "YKLiveViewController.h"
#import "YKMeViewController.h"
@interface YKTabBarController ()<UITabBarControllerDelegate>

@end

@implementation YKTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    [self setupChilds];
    
    [UITabBar appearance].translucent = NO;
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
    
    self.selectedIndex = 0;
    
}
- (void)setupChilds{
    MainViewController *main = [[UIStoryboard storyboardWithName:@"home" bundle:nil] instantiateViewControllerWithIdentifier:@"MainViewController"];
    [self setupChildPage:main title:@"" image:@"tab_live_normal" hightlightImage:@"tab_live_hight"];
    YKNavigationController *mainNavi = [[YKNavigationController alloc] initWithRootViewController:main];
    [self addChildViewController:mainNavi];
    
    YKLiveViewController *live = [[UIStoryboard storyboardWithName:@"home" bundle:nil] instantiateViewControllerWithIdentifier:@"YKLiveViewController"];
    [self setupChildPage:live title:@"" image:@"tab_launch" hightlightImage:@"tab_launch"];
    YKNavigationController *liveNav = [[YKNavigationController alloc] initWithRootViewController:live];
    [self addChildViewController:liveNav];
    
    YKMeViewController *me = [[UIStoryboard storyboardWithName:@"home" bundle:nil] instantiateViewControllerWithIdentifier:@"YKMeViewController"];
    [self setupChildPage:me title:@"" image:@"tab_me_normal" hightlightImage:@"tab_me_hight"];
    YKNavigationController *meNav = [[YKNavigationController alloc] initWithRootViewController:me];
    [self  addChildViewController:meNav];

}
- (void)setupChildPage:(UIViewController *)page
                 title:(NSString *)title
                 image:(NSString *)image
       hightlightImage:(NSString *)hlImg {
    
    page.title = title;
    if (image && image.length > 0) {
        UIImage *normalImage = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        page.tabBarItem.image = normalImage;
    }
    if (hlImg && hlImg.length > 0) {
        UIImage *selectedImage = [[UIImage imageNamed:hlImg] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        page.tabBarItem.selectedImage = selectedImage;
    }
}
#pragma mark UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
