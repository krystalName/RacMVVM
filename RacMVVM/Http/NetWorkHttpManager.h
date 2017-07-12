//
//  NetWorkHttpManager.h
//  AutorotationDemo
//
//  Created by 刘凡 on 2017/7/7.
//  Copyright © 2017年 Krystal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkHttpManager : NSObject


//POST 请求
+(void)POST:(NSString *)URLString
                parameters:(id)parameters
                progress:(void(^)(NSProgress *))uploadProgress
                success:(void(^)(NSURLSessionDataTask *task, id responseObject))success
                failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;


+(void)GET:(NSString *)URLString
        parameters:(id)parameters
        progress:(void(^)(NSProgress *))uploadProgress
        success:(void(^)(NSURLSessionDataTask *task, id responseObject))success
        failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
