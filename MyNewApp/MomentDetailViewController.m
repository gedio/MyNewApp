//
//  MomentDetailViewController.m
//  MyNewApp
//
//  Created by Suma on 2016/11/24.
//  Copyright © 2016年 Suma. All rights reserved.
//

#import "MomentDetailViewController.h"

@interface MomentDetailViewController ()

@end

@implementation MomentDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //正文文字
    UILabel *contentText = [[UILabel alloc] initWithFrame:CGRectMake(20, 84, [UIScreen mainScreen].bounds.size.width-50, 20)];
    contentText.text = @"我艹我又重复了一边";
    contentText.textColor = [UIColor blackColor];
    contentText.font = [UIFont systemFontOfSize:15];
    contentText.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:contentText];

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
