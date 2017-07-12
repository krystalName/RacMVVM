//
//  NetWorkHttpManager.m
//  AutorotationDemo
//
//  Created by 刘凡 on 2017/7/7.
//  Copyright © 2017年 Krystal. All rights reserved.
//

#import "NetWorkHttpManager.h"
#import <AFNetworking/AFNetworking.h>


@implementation NetWorkHttpManager


//封装一个网络请求的库
+(void)POST:(NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress *))uploadProgress success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError * error))failure{
    
    
    AFHTTPSessionManager * Manager = [AFHTTPSessionManager manager];
    
    Manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    AFHTTPResponseSerializer *requestSerializer = [AFHTTPResponseSerializer serializer];
    
    requestSerializer.acceptableContentTypes = [NSSet  setWithObjects:@"application/json",@"text/json"
                                                ,@"text/javascript",@"text/html", nil];
    
    Manager.responseSerializer = requestSerializer;
    
    
    [Manager POST:URLString parameters:parameters progress:nil success:success failure:failure];
    
    
}


+(void)GET:(NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress *))uploadProgress success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//申明返回的结果是json类型
    manager.responseSerializer.acceptableContentTypes = [NSSet  setWithObjects:@"application/json",@"text/json"
                                                         ,@"text/javascript",@"text/html", nil];//如果报接受类型不一致请替换一致text/html或别的
    manager.requestSerializer=[AFJSONRequestSerializer serializer];//申明请求的数据是json类型
    
    [manager GET:URLString parameters:parameters progress:nil success:success failure:failure];
    
}

@end
