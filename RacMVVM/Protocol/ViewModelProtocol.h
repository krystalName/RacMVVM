//
//  ViewModelProtocol.h
//  AutorotationDemo
//
//  Created by 刘凡 on 2017/7/10.
//  Copyright © 2017年 Krystal. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ViewModelProtocol <NSObject>

@optional
//绑定ViewModel
-(void)bindViewModel:(UIView *)bindView;

@end
