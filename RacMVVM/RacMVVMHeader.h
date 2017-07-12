//
//  RacMVVMHeader.h
//  RacMVVM
//
//  Created by 刘凡 on 2017/7/12.
//  Copyright © 2017年 Krystal. All rights reserved.
//

#ifndef RacMVVMHeader_h
#define RacMVVMHeader_h



#import <ReactiveObjC/ReactiveObjC.h>
#import <ReactiveObjC/RACReturnSignal.h>

#import <SDWebImage/UIImageView+WebCache.h>
#import "NetWorkHttpManager.h"
#import <MJExtension/MJExtension.h>


#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\n %s:%d   %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],__LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif




#endif /* RacMVVMHeader_h */
