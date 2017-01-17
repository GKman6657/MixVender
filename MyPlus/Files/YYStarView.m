//
//  YYStarView.m
//  MyPlus
//
//  Created by jf on 16/12/19.
//  Copyright © 2016年 jf. All rights reserved.
//

#import "YYStarView.h"
#define STAR_FRONT_NAME @"icon_tabbar_notification_active~iphone" //点亮星星图片
#define STAR_BACK_NAME @"icon_tabbar_notification~iphone" // 未点亮星星图片
#define DEFALUT_STAR_NUMBER 5 // 默认星星个数
#define ANIMATION_TIME_INTERVAL 0.2 // 动画延时
@interface YYStarView ()

// 前景视图
@property (nonatomic, strong) UIView *foregroundStarView;
// 背景视图
@property (nonatomic, strong) UIView *backgroundStarView;
// 星星个数
@property (nonatomic, assign) NSInteger numberOfStars;

@end

@implementation YYStarView

- (instancetype)initWithFrame:(CGRect)frame {
    // 初始化，这里我设置星星个数为5
    return [self initWithFrame:frame numberOfStars:DEFALUT_STAR_NUMBER];
}
- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars {
    if (self = [super initWithFrame:frame]) {
        _numberOfStars = numberOfStars;
        
       [self createDataAndUI];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        _numberOfStars = DEFALUT_STAR_NUMBER;
        [self createDataAndUI];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    __weak YYStarView *weakSelf = self;
    CGFloat animationTimeInterval = self.hasAnimation ? ANIMATION_TIME_INTERVAL : 0;
    
    [UIView animateWithDuration:animationTimeInterval animations:^{
        weakSelf.foregroundStarView.frame = CGRectMake(0, 0, weakSelf.bounds.size.width * weakSelf.scorePercent, weakSelf.bounds.size.height);
    }];
}

#pragma mark - Private Methods
- (void)createDataAndUI {
    
    _scorePercent = 1;//默认为1
    _hasAnimation = NO;//默认为NO
    _allowIncompleteStar = NO;//默认为NO
    
    self.foregroundStarView = [self createStarViewWithImage:STAR_FRONT_NAME];
    self.backgroundStarView = [self createStarViewWithImage:STAR_BACK_NAME];
    
    [self addSubview:self.backgroundStarView];
    [self addSubview:self.foregroundStarView];
    
    // 添加点按手势（也可以添加拖动手势）
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTapRateView:)];
    tapGesture.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapGesture];
}
//手势
- (UIView *)createStarViewWithImage:(NSString *)imageName {
    
    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    view.clipsToBounds = YES;
    view.backgroundColor = [UIColor clearColor];
    for (NSInteger i = 0; i < self.numberOfStars; i ++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(i * self.bounds.size.width / self.numberOfStars, 0, self.bounds.size.width / self.numberOfStars, self.bounds.size.height);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [view addSubview:imageView];
    }
    return view;
}
- (void)userTapRateView:(UITapGestureRecognizer *)gesture {
    CGPoint tapPoint = [gesture locationInView:self]; // 手指当前点
    CGFloat offset = tapPoint.x;
    // 当前偏移的X值 = 手指当前的位置*（星星视图总宽度/星星个数）
    CGFloat realStarScore = offset / (self.bounds.size.width / self.numberOfStars);
    // ceilf函数：返回浮点数整数部分（舍弃小数点部分，往个位数进1）如12.234 → ceilf(12.234)=13
    // 这句的意思是 是否显示整星
    CGFloat starScore = self.allowIncompleteStar ? realStarScore : ceilf(realStarScore);
    // 用手指移动的距离/星星的个数  == 点亮星星个数
    self.scorePercent = starScore / self.numberOfStars;
}

- (void)setScorePercent:(CGFloat)scorePercent {
    if (_scorePercent == scorePercent ) {
        return;
    }
    // 得分范围我设置的是0~1 这个可以你自己设定
    if (scorePercent < 0) {
        _scorePercent = 0;
    } else if (scorePercent > 1) {
        _scorePercent = 1;
    } else {
        _scorePercent = scorePercent;
    }
    
    // 代理方法，当星星百分比发生变化时候调用
    if ([self.delegate respondsToSelector:@selector(starView:scorePercentDidChange:)]) {
        [self.delegate starView:self scorePercentDidChange:scorePercent];
    }
    // 重新布局, 刷新视图
    [self setNeedsLayout];
    
}
@end
