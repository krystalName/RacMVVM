//
//  RootViewModel.h
//  AutorotationDemo
//
//  Created by 刘凡 on 2017/7/7.
//  Copyright © 2017年 Krystal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewModelProtocol.h"

@interface RootViewModel : NSObject<ViewModelProtocol>
{
    RACCommand *_LoadRootDataCommand;
}

@property(nonatomic, strong ,readonly)RACCommand *LoadRootDataCommand;




@end
