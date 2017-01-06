//
//  UIImage+Ketang.m
//  MyNewApp
//
//  Created by Suma on 2016/12/9.
//  Copyright © 2016年 Suma. All rights reserved.
//

#import "UIImage+Ketang.h"

@implementation UIImage (Ketang)

+(UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    [color set];
    UIRectFill(CGRectMake(0, 0, size.width * [UIScreen mainScreen].scale, size.height * [UIScreen mainScreen].scale));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end
