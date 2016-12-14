//
//  BaseViewController.h
//  MyNewApp
//
//  Created by Suma on 2016/11/24.
//  Copyright © 2016年 Suma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController<UIGestureRecognizerDelegate>


-(void)setSingleLineTitle:(NSString *)title;

-(void)showLoading;
-(void)hideLoading;
-(void)showModalLoading;
-(void)hideModalLoading;

-(void)showAlertWithTitle:(NSString *)title message:(NSString *)message buttonText:(NSString *)buttonText;

-(void)setBackButton;
-(void)setLeftNavigationButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;
-(void)setRightNavigationButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;

@end
