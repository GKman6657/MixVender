//
//  ViewController.m
//  MyPlus
//
//  Created by jf on 16/12/15.
//  Copyright © 2016年 jf. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import "SureCustomViewController.h"
#import "MultiGroupViewController.h"
#import "ThemeManagement.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * tableview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-70) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:tableView];
    _tableview = tableView;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ID"];
    
    [self creatSwitchUI];
    
    /**
     去掉cell 左侧15像素的 空白
     */
    if ([self.tableview respondsToSelector:@selector(setSeparatorInset:)]) {
        // 如果tableView响应了setSeparatorInset: 这个方法,我们就将tableView分割线的内边距设为0.
        [self.tableview setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableview respondsToSelector:@selector(setLayoutMargins:)]) {
        // 如果tableView响应了setLayoutMargins: 这个方法,我们就将tableView分割线的间距距设为0.
        [self.tableview setLayoutMargins:UIEdgeInsetsZero];
    }
   
}

- (void)creatSwitchUI {
  
    UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectMake(54.0f, 64.0f, 100.0f, 28.0f)];
    switchView.on = YES;//设置初始为ON的一边
    [switchView addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:switchView];
}
- (void)switchAction:(UISwitch *)sender {
    
    if (sender.on == YES) {
        // 夜间模式开启
        [ThemeManagement shareManagement].isDarkTheme = YES;
    }else{
        // 夜间模式关闭
        [ThemeManagement shareManagement].isDarkTheme = NO;
    }
    // 发送通知 改变主题模式
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ChangeTheme" object:nil];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID" forIndexPath:indexPath];
    
    NSArray *textArr = @[@"UITableViewPlaceholder",
                         @"CustomPlaceholder",
                         @"MultiGroupTableView"];
    cell.textLabel.text = textArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[[TableViewController alloc]init ] animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:[[SureCustomViewController alloc]init ] animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:[[MultiGroupViewController alloc]init ] animated:YES];
            break;
            
        default:
            break;
    }
}
/**
 去掉cell 左侧15像素的 空白
 */
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // 这两句的含义跟上面两句代码相同,就不做解释了
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
