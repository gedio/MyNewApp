//
//  MomentListViewController.m
//  MyNewApp
//
//  Created by Suma on 2016/11/24.
//  Copyright © 2016年 Suma. All rights reserved.
//

#import "MomentListViewController.h"

@interface MomentListViewController ()

@end

@implementation MomentListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //自定义表单以及不要自定义距离高度
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setSingleLineTitle:@"笔记"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//签署协议
-(NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"moment"];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"moment"];
        
        
        UILabel *dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 16, 47, 46)];
        dayLabel.text = @"7";
        dayLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.3];
        dayLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:40];
        dayLabel.textAlignment = NSTextAlignmentRight;
        [cell.contentView addSubview:dayLabel];
        
        UILabel *dayOfWeekLabel = [[UILabel alloc] initWithFrame:CGRectMake(52, 23, 100, 15)];
        dayOfWeekLabel.text = @"星期五";
        dayOfWeekLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.3];
        dayOfWeekLabel.font = [UIFont systemFontOfSize:12];
        dayOfWeekLabel.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:dayOfWeekLabel];
        
        UILabel *yearAndMonthLabel = [[UILabel alloc] initWithFrame:CGRectMake(52, 38, 200, 15)];
        yearAndMonthLabel.text = @"2016年11月";
        yearAndMonthLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.3];
        yearAndMonthLabel.font = [UIFont systemFontOfSize:12];
        yearAndMonthLabel.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:yearAndMonthLabel];
        
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-240)/2, 79, 240, 42)];
        contentLabel.text = @"我好开心啊，我会编程了啊";
        contentLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
        contentLabel.font = [UIFont systemFontOfSize:15];
        contentLabel.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:contentLabel];

        
        
    }
    return cell;
}


//浮点
-(CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    return 200.0;
    
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
