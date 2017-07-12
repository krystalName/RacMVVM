//
//  RootViewCellViewModel.h
//  AutorotationDemo
//
//  Created by 刘凡 on 2017/7/10.
//  Copyright © 2017年 Krystal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewModelProtocol.h"

@class RootModel;

//处理Cell的显示。和业务逻辑
@interface RootViewCellViewModel : NSObject<ViewModelProtocol>

@property(nonatomic, strong)RootModel *itme;


@end
