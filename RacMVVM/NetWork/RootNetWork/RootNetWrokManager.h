//
//  RootNetWrokManager.h
//  AutorotationDemo
//
//  Created by 刘凡 on 2017/7/10.
//  Copyright © 2017年 Krystal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RootNetWrokManager : NSObject



//请求的url
+(NSString *)urlWithRoot;

//请求参数
+(NSDictionary *)paramWithRoot;

@end
