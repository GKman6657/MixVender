//
//  ThemeManagement.m
//  MyPlus
//
//  Created by jf on 16/12/15.
//  Copyright © 2016年 jf. All rights reserved.
//

#import "ThemeManagement.h"
// 单例
static ThemeManagement *themeManagement;

@implementation ThemeManagement

+ (instancetype)shareManagement{
    if (themeManagement == nil) {
        themeManagement = [[ThemeManagement alloc]init];
        
        // 默认不是夜间模式
        themeManagement.isDarkTheme = NO;
    }
    return themeManagement;
}

@end
