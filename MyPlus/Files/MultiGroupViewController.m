//
//  MultiGroupViewController.m
//  MyPlus
//
//  Created by jf on 16/12/15.
//  Copyright © 2016年 jf. All rights reserved.
//

#import "MultiGroupViewController.h"
#import "UITableView+Sure_Placeholder.h"
#import "StarViewController.h"

#import "GKStoreViewController.h"

@interface MultiGroupViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation MultiGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self craeteUI];
    // Do any additional setup after loading the view.
}

- (void)initData {
    _dataArr = [[NSMutableArray alloc]initWithObjects:@[@"1",@"2"],@[@"3",@"4"],@[@"5",@"6"], nil];
}

- (void)craeteUI {
    self.title = @"UITableViewPlaceholder";
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"TAB"];
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataArr[section] count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TAB"];
    cell.textLabel.text = _dataArr[indexPath.section][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
       
        StarViewController * starVC = [[StarViewController alloc]init];
        [self.navigationController pushViewController:starVC animated:YES];
    }
//    else if (indexPath.section == 1){
//        
////        GKgifViewController * gif = [[GKgifViewController alloc]init];
////        [self.navigationController pushViewController:gif animated:YES];
//
//    }
    else {
        GKStoreViewController * gkVC = [[GKStoreViewController alloc]init];
        [self.navigationController pushViewController:gkVC animated:YES];
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
