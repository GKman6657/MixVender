//
//  YYStarView.h
//  MyPlus
//
//  Created by jf on 16/12/19.
//  Copyright © 2016年 jf. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YYStarView;
@protocol YYStarViewDelegate <NSObject>

@optional
// 星星百分比（得分值）发生变化的代理
- (void)starView:(YYStarView *)starView scorePercentDidChange:(CGFloat)newScorePercent;

@end

@interface YYStarView : UIView

@property (nonatomic, assign) CGFloat scorePercent;//得分值，范围为0~1，默认1
@property (nonatomic, assign) BOOL hasAnimation;//是否允许动画，默认为NO
@property (nonatomic, assign) BOOL allowIncompleteStar;//评分时是否允许不是整星，默认为NO


@property (nonatomic,weak)id<YYStarViewDelegate>delegate;

//申明
- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars;
@end
