//
//  BaseViewController.m
//  MyNewApp
//
//  Created by Suma on 2016/11/24.
//  Copyright © 2016年 Suma. All rights reserved.
//

#import "BaseViewController.h"
#import "KetangUtility.h"
#import "UIButton+Ketang.h"

@interface BaseViewController ()

@property(nonatomic,strong) UIActivityIndicatorView *loading;
@property(nonatomic,strong) UIView *modal;

@end

@implementation BaseViewController

-(void)navigationBack{
    
    if (self.navigationController != nil) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)setBackButton{
    
    UIButton *button = [UIButton navigationBackButtonWithTitle:@"返回" target:self action:@selector(navigationBack)];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UIBarButtonItem *offset = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    CGFloat buttonOffset;
    
    if ([KetangUtility screenWidth]>=414) {
        //iPhone 6+,iPhone 6S +
        buttonOffset = -12;
    }else{
        //其他设备
        buttonOffset = -8;
        
    }
    
    offset.width = buttonOffset;
    
    
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:offset,barButton, nil];

    
}



-(void)setLeftNavigationButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action{
    
    UIButton *button = [UIButton navigationButtonWithTitle:title target:target action:action];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UIBarButtonItem *offset = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    CGFloat buttonOffset;
    if ([KetangUtility screenWidth]>=414) {
        //iPhone 6+,iPhone 6S +
        buttonOffset = -12;
    }else{
        //其他设备
        buttonOffset = -8;
        
    }
    
    offset.width = buttonOffset;
    
    
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:offset,barButton, nil];
    
    
    
}



-(void)setRightNavigationButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action{
    
    UIButton *button = [UIButton navigationButtonWithTitle:title target:target action:action];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UIBarButtonItem *offset = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    CGFloat buttonOffset;
    if ([KetangUtility screenWidth]>=414) {
        //iPhone 6+,iPhone 6S +
        buttonOffset = -12;
    }else{
        //其他设备
        buttonOffset = -8;
        
    }
    
    offset.width = buttonOffset;
    
    
    self.navigationItem. rightBarButtonItems = [NSArray arrayWithObjects:offset,barButton, nil];
    
    
}




-(void)showAlertWithTitle:(NSString *)title message:(NSString *)message buttonText:(NSString *)buttonText{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:buttonText
                                                     style:UIAlertActionStyleDefault
                                                   handler:nil];
    
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)showModalLoading{
    
    //黑色遮罩
    if (self.modal == nil) {
        self.modal = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [KetangUtility screenWidth], [KetangUtility screenHeigth])];
        self.modal.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    }
    
    
    //圆角矩形
    UIView *black = [[UIView alloc] initWithFrame:CGRectMake(([KetangUtility screenWidth]-80)/2, ([KetangUtility screenHeigth]-80)/2, 80, 80)];
    black.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    black.layer.cornerRadius = 12;
    black.layer.masksToBounds = YES;
    [self.modal addSubview:black];
    
    
    //白色加载动画
    UIActivityIndicatorView *modalLoading = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(([KetangUtility screenWidth]-80)/2, ([KetangUtility screenHeigth]-80)/2, 80, 80)];
    modalLoading.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    [self.modal addSubview:modalLoading];
    [modalLoading startAnimating];
    
    
    //把阻塞加载呈现给用户
    UIWindow *window = [UIApplication sharedApplication].windows[0];
    [window addSubview:self.modal];
    
    
}
-(void)hideModalLoading{
    
    [self.modal removeFromSuperview];
    
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    
    //如果导航控制器上只有一个页面，就不需要手势识别
    if (self.navigationController.viewControllers.count == 1){
        return NO;
        
    }
    
    //其他情况都需要
    return YES;
}

-(void)showLoading{
    
    if (self.loading == nil){
        
        self.loading = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(([KetangUtility screenWidth])/2, ([KetangUtility screenHeigth])/2, 20, 20)];
        self.loading.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    }
    
    [self.loading startAnimating];
    
    [self.view addSubview:self.loading];
}

-(void)hideLoading{
    
    [self.loading startAnimating];
    [self.loading removeFromSuperview];
    
}

-(void)setSingleLineTitle:(NSString *)title{
    
    //自定义导航栏标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 44)];
    titleLabel.text = title;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:17];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = titleLabel;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 自定义背景颜色
    UIColor *gray = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    self.view.backgroundColor = gray;
    
    //自定义导航栏背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.2 green:0.72 blue:0.46 alpha:1];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationItem setHidesBackButton:YES];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
