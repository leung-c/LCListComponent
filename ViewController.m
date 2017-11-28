//
//  ViewController.m
//  LCListComponent
//
//  Created by liangchao on 17/11/24.
//  Copyright © 2017年 lch. All rights reserved.
//

#import "ViewController.h"
#import "LCListViewController+TableView.h"
#import "InfoViewModel.h"
#import "InputViewModel.h"
#import "LCSectionViewModel.h"
#import "InfoTableViewCell.h"
#import "InputTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.tableView];
    [self buildDataSource];
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

//组装数据源
- (void) buildDataSource{
    
    LCSectionViewModel* section1 = [LCSectionViewModel new];
    section1.reuseId = @"UITableViewHeaderFooterView";
    InfoViewModel *name = [InfoViewModel new];
    name.title = @"姓名：";
    name.detail = @"随便写写";
    UIFont *font14 = [UIFont systemFontOfSize:14];
    name.titleFont = font14;
    name.titleColor = [UIColor blackColor];
    name.detailFont = font14;
    name.detailColor = [UIColor redColor];
    name.viewSize  = CGSizeMake(0, 100);
    name.reuseId = @"InfoTableViewCell";
    
    InputViewModel *address = [InputViewModel new];
    address.title = @"地址";
    address.placeHolder = @"在此输入你的地址";
    address.titleFont = font14;
    address.titleColor = [UIColor greenColor];
    address.reuseId = @"InputTableViewCell";
    __weak typeof(self) w_s= self;
    __weak typeof(address) wAddr= address;
    [address setTextChangedCallback:^(NSString *text) {
        if(text.length>10){
            UIAlertController *alertvc = [UIAlertController alertControllerWithTitle:nil message:@"长度必须小于10" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"好的" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
               // do sth
            }];
            [alertvc addAction:action];
            [w_s showViewController:alertvc sender:w_s];
        }else{
            wAddr.text = text;
        }
    }];
    [section1.rows addObjectsFromArray:@[name,address]];
    section1.footerViewModel.viewSize = CGSizeMake(0,10);
    
    //如果是接口返回的列表数据也可以组装
    int dataCount = 10;
    LCSectionViewModel *section2 = [LCSectionViewModel new];
    for (int i = 0; i<dataCount; i++) {
        InfoViewModel *row = [InfoViewModel new];
        row.title = [NSString stringWithFormat:@"第%d行",i];
        row.detail = [NSString stringWithFormat:@"i = %d",i];
        row.titleFont = font14;
        row.titleColor = [UIColor blackColor];
        row.detailFont = font14;
        row.detailColor = [UIColor grayColor];
        row.viewSize  = CGSizeMake(0, 40);
        row.reuseId = @"InfoTableViewCell";
        [section2.rows addObject:row];
    }
    section2.footerViewModel.viewSize = CGSizeMake(0, 10);
    
    [self.dataSource addObjectsFromArray:@[section1,section2]];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
