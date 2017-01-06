//
//  UIButton+Ketang.h
//  MyNewApp
//
//  Created by Suma on 2016/12/9.
//  Copyright © 2016年 Suma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Ketang)

+(UIButton *) contentButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;

+(UIButton *) navigationButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;

+(UIButton *) navigationBackButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;


@end
