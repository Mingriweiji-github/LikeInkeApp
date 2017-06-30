//
//  YKNavigationController.m
//  LikeInkeApp
//
//  Created by M_Li on 2017/6/30.
//  Copyright © 2017年 M_Li. All rights reserved.
//

#import "YKNavigationController.h"

@interface YKNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>
@property (nonatomic,getter=isPushing) BOOL pushing;

@end

@implementation YKNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    self.interactivePopGestureRecognizer.delegate = self;
    [self.navigationBar setShadowImage:[UIImage new]];
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    
}
#pragma mark - Overrides

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    if (self.pushing == YES) {
        return;
    } else {
        self.pushing = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}


#pragma mark - UINavigationControllerDelegate
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    self.pushing = NO;
}

#pragma mark gesture
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPushItem:(UINavigationItem *)item {
    //防止卡死现象
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    if (self.childViewControllers.count > 1) {
        if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            self.interactivePopGestureRecognizer.enabled = YES;
        }
    }
    return YES;
}
- (void)navigationBar:(UINavigationBar *)navigationBar didPopItem:(UINavigationItem *)item {
    //只有一个控制器的时候禁止手势，防止卡死现象
    if (self.childViewControllers.count == 1) {
        if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            self.interactivePopGestureRecognizer.enabled = NO;
        }
    }
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
