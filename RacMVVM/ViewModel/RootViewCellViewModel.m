//
//  RootViewCellViewModel.m
//  AutorotationDemo
//
//  Created by 刘凡 on 2017/7/10.
//  Copyright © 2017年 Krystal. All rights reserved.
//

#import "RootViewCellViewModel.h"
#import "RootViewModel.h"
#import "RootViewCell.h"
#import "RootModel.h"

@implementation RootViewCellViewModel

-(void)bindViewModel:(UIView *)bindView{
    RootViewCell  *cell = (RootViewCell *)bindView;
    
    //图片
    [cell.GoodsImage sd_setImageWithURL:[NSURL URLWithString:_itme.image_urls[0]] placeholderImage:[UIImage imageNamed:@""]];
    
    //商品名字
    cell.NameLable.text = _itme.name;
    
    //价格
    cell.PriceLable.text = [NSString stringWithFormat:@"价格: %@",_itme.price];
    
}
@end
