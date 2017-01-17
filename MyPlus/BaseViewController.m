//
//  BaseViewController.m
//  MyPlus
//
//  Created by jf on 16/12/15.
//  Copyright © 2016年 jf. All rights reserved.
//

#import "BaseViewController.h"
#import "ThemeManagement.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 在这里只是简单的改变了一下背景颜色，实际项目中应准备两套颜色
    if ([ThemeManagement shareManagement].isDarkTheme) {
        
        self.view.backgroundColor = [UIColor yellowColor];
    }else{
        self.view.backgroundColor = [UIColor whiteColor];
    }
    
    // 添加接收改变主题的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeTheme) name:@"ChangeTheme" object:nil];
}

// 接收到改变主题的通知后改变主题
- (void)changeTheme{
    if ([ThemeManagement shareManagement].isDarkTheme) {
        self.view.backgroundColor = [UIColor yellowColor];
    }else{
        self.view.backgroundColor = [UIColor whiteColor];
    }
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
