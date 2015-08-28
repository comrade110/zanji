//
//  ZJNavigationViewController.m
//  zanji
//
//  Created by xiang-chen on 15/8/28.
//  Copyright (c) 2015年 chx. All rights reserved.
//

#import "ZJNavigationViewController.h"
#import "UIImage+Color.h"
#import "FXBlurView.h"

@interface ZJNavigationViewController ()

@end

@implementation ZJNavigationViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setBackgroundImage:[[UIImage imageFromContextWithColor:[UIColor colorWithWhite:0.f alpha:.0f]] blurredImageWithRadius:50.f iterations:100 tintColor:[UIColor blackColor]] forBarMetrics:UIBarMetricsDefault];
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
