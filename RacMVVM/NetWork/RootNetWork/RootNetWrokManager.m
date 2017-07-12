//
//  RootNetWrokManager.m
//  AutorotationDemo
//
//  Created by 刘凡 on 2017/7/10.
//  Copyright © 2017年 Krystal. All rights reserved.
//

#import "RootNetWrokManager.h"

@implementation RootNetWrokManager

+(NSString *)urlWithRoot
{
    return @"http://api.dantangapp.com/v2/items";
    
    
}


+(NSDictionary *)paramWithRoot{
    
    NSDictionary *param = @{@"gender":@1,
                            @"generation":@1,
                            @"limit":@20,
                            @"offset":@0};
    

    
    return param;
}


@end
