//
//  PostMomentViewController.m
//  MyNewApp
//
//  Created by Suma on 2016/12/1.
//  Copyright © 2016年 Suma. All rights reserved.
//

#import "PostMomentViewController.h"
#import "KetangUtility.h"
#import "KetangPersistenManager.h"

@interface PostMomentViewController ()

@property (nonatomic,strong) UITextView *inputView;

@end

@implementation PostMomentViewController

- (void)cancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)saveMoment{
    
    //如果没写任何内容，不让存储，且不需要给用户提示
    if (self.inputView.text.length ==0){
        return;
        
    }
    
    //如果写的内容，文字超过2000字，就告诉用户，超过存储范围
    if (self.inputView.text.length > 2000) {
        //告知用户
        [self showAlertWithTitle:@"文字内容超过20000无法存储" message:nil buttonText:@"知道了"];
   
        //后面的代码不执行
        return;
    }
    
    [self showModalLoading];
    
    NSString *content = self.inputView.text;
    NSNumber *timestamp = [KetangUtility timestamp];
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:content,@"content",timestamp,@"timestamp",nil];
    
    BOOL saveSuccess = [KetangPersistenManager saveDictionary:dictionary];
    
    [self hideModalLoading];
    
    if (saveSuccess){
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        NSNotification *notification = [NSNotification notificationWithName:@"newMomentSaved" object:nil];
        [center postNotification:notification];
        
        //通知去刷新
        [self dismissViewControllerAnimated:YES completion:nil];
        return;
    }

     [self showAlertWithTitle:@"存储失败" message:nil buttonText:@"好"];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setSingleLineTitle:@"写笔记"];
    

    
    
    [self setLeftNavigationButtonWithTitle:@"取消" target:self action:@selector(cancel)];
    [self setRightNavigationButtonWithTitle:@"存储" target:self action:@selector(saveMoment)];
    
    self.inputView = [[UITextView alloc] initWithFrame:CGRectMake(0, 84, [UIScreen mainScreen].bounds.size.width,300)];
    [self.view addSubview:self.inputView];
    
    [self.inputView becomeFirstResponder];
    
    


    
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
