//
//  RootViewModel.m
//  AutorotationDemo
//
//  Created by 刘凡 on 2017/7/7.
//  Copyright © 2017年 Krystal. All rights reserved.
//

#import "RootViewModel.h"
#import "RootNetWrokManager.h"
#import "RootViewCell.h"
#import "RootModel.h"
#import "RootViewCellViewModel.h"

@interface RootViewModel ()<UITableViewDelegate,UITableViewDataSource>


//请求的数据
@property(nonatomic, strong)NSArray *recommandCellVMs;

@end

@implementation RootViewModel


-(RACCommand *)LoadRootDataCommand
{
    if (!_LoadRootDataCommand) {
      
        //请求数据
        _LoadRootDataCommand = [[RACCommand alloc]
                initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            //...
             return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                //发送请求
                 NSString *url = [RootNetWrokManager urlWithRoot];
                 NSDictionary *param = [RootNetWrokManager paramWithRoot];
                 
              [NetWorkHttpManager  GET:url parameters:param progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                  
                
                  //先一步一步拿出数据
                  NSArray *itmes = responseObject[@"data"][@"items"];
                
                  NSMutableArray *recommends = [NSMutableArray array];
                  
                  for (int i = 0; i<itmes.count; i++) {
                      
                      RootModel *model = [RootModel mj_objectWithKeyValues:itmes[i][@"data"]];
                     
                      [recommends addObject:model];
                  }

                  NSLog(@"recommends %@",recommends);
                  
                  
                  //模型转试图模型
                  //创建cell试图模型
                _recommandCellVMs =   [[recommends.rac_sequence map:^id(id value) {
                     
                      //创建cell的视图模型
                      RootViewCellViewModel *cellVM = [[RootViewCellViewModel alloc]init];
                      cellVM.itme = value;
                      return cellVM;
                }] array];
                
                  //发送消息
                  [subscriber sendNext:recommends];
                  
                  //立即执行
                  [subscriber sendCompleted];
                  
              } failure:^(NSURLSessionDataTask *task, NSError *error) {
                 
                  NSLog(@"错误的URL = %@",task.currentRequest);
                  //发送错误
                  [subscriber sendError:error];

              }];
                 
                 
                 return nil;
             }];
                    
        }];
    }
    
    return _LoadRootDataCommand;
}


//试图模型的绑定
-(void)bindViewModel:(UIView *)bindView{
    
    UITableView *tableView = (UITableView *)bindView;
    
    
    //注册
    [tableView registerNib:[UINib nibWithNibName:@"RootViewCell" bundle:nil] forCellReuseIdentifier:NSStringFromClass([RootViewCell class])];
    
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
}




#pragma mark - uitableView的数据源方法


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.recommandCellVMs.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RootViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RootViewCell class])];
    
    //视图模型
    RootViewCellViewModel *cellVM = self.recommandCellVMs[indexPath.row];
    
    //绑定视图
    [cellVM bindViewModel:cell];
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.f;
}

@end
