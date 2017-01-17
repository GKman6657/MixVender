//
//  StarViewController.m
//  MyPlus
//
//  Created by jf on 16/12/19.
//  Copyright © 2016年 jf. All rights reserved.
//

#import "StarViewController.h"
#import "StarView.h"
#import "YYStarView.h"
@interface StarViewController ()

@end

@implementation StarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    
    [self showOnlyStar];
    [self showStarWithAnimation];
}
- (void)showOnlyStar {
    
    StarView *starView =  [[StarView alloc] initWithFrame:CGRectMake(90, 90, 200, 40)];
    [self.view addSubview:starView];
    // 别忘了这一步哦（关键的一步），3*20 意思是我想显示3颗星。20是没个星星的宽度（因为 上面设置了self.maxStar = 100），我的最大星星个数是5，所以每个星星的宽度是20
    starView.showStar = 3*20;
}

- (void)showStarWithAnimation {
    YYStarView * yyStsrVC = [[YYStarView alloc]initWithFrame:CGRectMake(10, 150, 300, 40) numberOfStars:5];
    yyStsrVC.scorePercent = 0.3;
    yyStsrVC.allowIncompleteStar = YES;
    yyStsrVC.hasAnimation = YES;
    [self.view addSubview:yyStsrVC];
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
