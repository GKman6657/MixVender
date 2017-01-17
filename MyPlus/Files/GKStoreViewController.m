//
//  GKStoreViewController.m
//  MyPlus
//
//  Created by jf on 16/12/20.
//  Copyright © 2016年 jf. All rights reserved.
//

#import "GKStoreViewController.h"
#import "GSFilterView.h"
#import "GSMacros.h"
#import "Masonry.h"
@interface GKStoreViewController ()<DKFilterViewDelegate,UIAlertViewDelegate>
@property (nonatomic,strong) GSFilterView *filterView;
@property (nonatomic,strong) DKFilterModel *clickModel;


@end

@implementation GKStoreViewController


-(void)viewDidAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
    [self.filterView.tableView reloadData];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //可以封装一下  变成公用的就好了
    self.title =@"商品规格选择封装";
    self.edgesForExtendedLayout = UIRectEdgeNone;//从导航栏下面开始计算起始点   全屏布局模式，默认值是UIRectEdgeAll
    self.extendedLayoutIncludesOpaqueBars = NO; //用来指定导航栏是透明的还是不透明
    //只有到以上两个属性都设置成可以延伸时，页面起始点才会从状态栏也就是屏幕最左上角开始
    
    self.modalPresentationCapturesStatusBarAppearance = NO;//当前控制器present一个其他控制器上的非全屏界面我们是否接管status bar的外观，默认是NO

    
    [self setDataSource];
    [self doActionEvent];
}
- (void)setDataSource {
    NSArray *filterData =  @[@"白色",@"黑色",@"灰白色",@"土豪金",@"星空灰",@"米白色",@"亮黑色",@"浅黑色"];
    DKFilterModel * model = [[DKFilterModel alloc]initElement:filterData ofType:DK_SELECTION_SINGLE];
    model.title = @"短的标题 点击";
    model.style = DKFilterViewStyle1;
    self.clickModel = model;
    
    filterData = @[@"白色",@"更白的白色",@"比前一个更白的白色",@"没那么白",@"浅白色",@"最后一个白色"];
    DKFilterModel *radioModel = [[DKFilterModel alloc] initElement:filterData ofType:DK_SELECTION_SINGLE];
    radioModel.title = @"自适应标题单选展示";
    radioModel.style = DKFilterViewDefault;
    
    filterData = @[@"多选",@"长一点的多选",@"多选不长的按钮",@"多选比较长",@"长",@"最长的多选?",@"非常长"];
    DKFilterModel *checkModel = [[DKFilterModel alloc] initElement:filterData ofType:DK_SELECTION_MULTIPLE];
    checkModel.title = @"多选的自适应标题的展示";
    checkModel.style = DKFilterViewDefault;
    
    self.filterView = [[GSFilterView alloc]initWithFrame:self.view.bounds];
    self.filterView.delegate =self;
    self.filterView.filterModels = @[model,radioModel,checkModel];
    [self.view addSubview:self.filterView];
    
    
}
- (void)doActionEvent {
    
    UIButton *filterButton = [[UIButton alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT -104, SCREEN_WIDTH, 44)];
    filterButton.backgroundColor = GS_SELECTBACKGROUND_COLOR;
    [filterButton setTitle:@"点击查看选中的内容" forState:UIControlStateNormal];
    [filterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [filterButton addTarget:self action:@selector(filter:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:filterButton];
}
- (void)filter:(id)sender {
    NSString * result = @"";
    for (DKFilterModel * model in self.filterView.filterModels) {
        if (model == self.clickModel) {
            continue;
        }
        result = [result stringByAppendingFormat:@"所属标题:%@\n",model.title];
        NSArray *array = [model getFilterResult];
        
        for (NSString * str  in array) {
            result = [result stringByAppendingFormat:@"^%@^",str];
        }
        result = [result stringByAppendingString:@"\n"];
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"选择的结果" message:result delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}
#pragma mark -- DKFilterViewDelegate
- (void)didClickAtModel:(DKFilterModel *)data {
    if (data == _clickModel) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"点击的内容" message:data.clickedButtonText delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
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
