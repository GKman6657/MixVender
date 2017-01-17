//
//  StarView.h
//  MyPlus
//
//  Created by jf on 16/12/19.
//  Copyright © 2016年 jf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView


// 根据字体大小来确定星星的大小
@property (nonatomic, assign) CGFloat starSize;
// 总共的长度
@property (nonatomic, assign) NSInteger maxStar;
//需要显示的星星的长度
@property (nonatomic, assign) NSInteger showStar;
//未点亮时候的颜色
@property (nonatomic, retain) UIColor *emptyColor;
//点亮的星星的颜色
@property (nonatomic, retain) UIColor *fullColor;

@end
