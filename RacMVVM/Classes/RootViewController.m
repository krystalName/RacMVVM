//
//  RootViewController.m
//  AutorotationDemo
//
//  Created by 刘凡 on 2017/7/7.
//  Copyright © 2017年 Krystal. All rights reserved.
//

#import "RootViewController.h"
#import "RootViewModel.h"
#import "RootViewCell.h"


@interface RootViewController ()


@property(nonatomic, strong)RootViewModel *RootVM;



@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //执行请求数据
    @weakify(self);
    [[self.RootVM.LoadRootDataCommand execute:nil] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        //刷新表格
        [self.tableView reloadData];
    } error:^(NSError * _Nullable error) {
        NSLog(@"%@",error);
    }];
    
    //绑定试图模型,对控件的设置
    [self.RootVM bindViewModel:self.tableView];
    
    
    
    
    
}




//懒加载
-(RootViewModel *)RootVM{
    if (!_RootVM) {
        _RootVM = [[RootViewModel alloc]init];
    }
    return _RootVM;
}


@end
