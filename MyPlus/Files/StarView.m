//
//  StarView.m
//  MyPlus
//
//  Created by jf on 16/12/19.
//  Copyright © 2016年 jf. All rights reserved.
//

#import "StarView.h"

@implementation StarView

// 重写initWithFrame：方法
- (instancetype)initWithFrame:(CGRect)frame {
    
    if ( self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        // 星星的尺寸
        self.starSize = 20.0f;
        // 未点亮星星的颜色（可根据自己喜好设定）
        self.emptyColor = [UIColor colorWithRed:167/255 green:167/255 blue:167/255 alpha:1]; //
        // 点亮星星的颜色
        self.fullColor = [UIColor colorWithRed:16/255 green:130/255 blue:225/255 alpha:1];
        // 默认长度
        self.maxStar = 100;
    }
    return self;
}
//重绘视图
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSString* stars = @"★★★★★";
    rect = self.bounds;
    UIFont *font = [UIFont boldSystemFontOfSize:_starSize];
    CGSize starSize = [stars sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Light" size:16.0]}];
    rect.size=starSize;
    [_emptyColor set];

    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys: font, NSFontAttributeName,
                                nil];
    [stars drawInRect:rect withAttributes:dictionary];
 
    CGRect clip = rect;
    // 裁剪的宽度 = 点亮星星宽度 = （显示的星星数/总共星星数）*总星星的宽度
    clip.size.width = clip.size.width * _showStar / _maxStar;
    CGContextClipToRect(context,clip);
    [_fullColor set];
    [stars drawInRect:rect withAttributes:@{NSFontAttributeName:font}];

}

@end
