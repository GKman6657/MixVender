//
//  ThemeManagement.h
//  MyPlus
//
//  Created by jf on 16/12/15.
//  Copyright © 2016年 jf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThemeManagement : NSObject
/** 是否是夜间模式 */
@property (nonatomic,assign) BOOL isDarkTheme;

+ (instancetype)shareManagement;
@end
