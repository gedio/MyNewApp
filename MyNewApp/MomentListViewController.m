//
//  MomentListViewController.m
//  MyNewApp
//
//  Created by Suma on 2016/11/24.
//  Copyright © 2016年 Suma. All rights reserved.
//

#import "MomentListViewController.h"
#import "MomentCell.h"
#import "MomentDetailViewController.h"
#import "PostMomentViewController.h"
#import "KetangPersistenManager.h"
#import "KetangUtility.h"
#import "BlankView.h"
#import "RetryView.h"
#import "UIImage+Ketang.h"


@interface MomentListViewController ()

@property(nonatomic,strong) NSArray *moment;
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) UIView *blankView;
@property(nonatomic,strong) UIView *retryView;
@property(nonatomic,strong) UIImageView *cover;
@property(nonatomic) BOOL tableShowed;


@end

@implementation MomentListViewController

-(void)showCover{
    
    //设定好封面图片
    self.cover = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [KetangUtility screenWidth], [KetangUtility screenHeigth])];
    self.cover.image = [UIImage imageNamed:@"cover.png"];
    self.cover.userInteractionEnabled = YES;
    self.cover.contentMode = UIViewContentModeScaleAspectFit;
    
    [[UIApplication sharedApplication].keyWindow addSubview:self.cover];
    
    //设定好封面图片上的按钮
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(([KetangUtility screenWidth]-200)/2, [KetangUtility screenHeigth]-84, 200, 44)];
    [button setTitle:@"进入" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    button.layer.borderWidth = 1;
    button.layer.borderColor = [UIColor whiteColor].CGColor;
    button.layer.cornerRadius = 3;
    button.layer.masksToBounds = YES;
    
    [button setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithWhite:1 alpha:0.3] andSize:button.frame.size] forState:UIControlStateHighlighted];
    [self.cover addSubview:button];
    
    [button addTarget:self action:@selector(hideCover) forControlEvents:UIControlEventTouchUpInside];
}

-(void)hideCover{
    
    //隐藏封面
    [self.cover removeFromSuperview];
    
    //载入笔记
    [self loadMoment];
}

-(void)viewWillAppear:(BOOL)animated{
    
    if (self.tableView !=nil) {
        //找到被选中的那一行
        NSIndexPath *selectingRow = [self.tableView indexPathForSelectedRow];
        
        if (selectingRow != nil) {
            [self.tableView deselectRowAtIndexPath:selectingRow animated:YES];
        }
        //取消这一行的选中状态
    }
}

-(void)handleView{
    
    [self hideLoading];
    

    
    //如果读取失败，则展示retryView
    if (self.moment ==nil){
        [self.tableView removeFromSuperview];
        [self.blankView removeFromSuperview];
        [self.retryView removeFromSuperview];
        [self.view addSubview:self.retryView];
        self.tableShowed = NO;
        return;
    }
    
    
    //如果读取成功，但是条目数为0，则展示blankView
    if ([self.moment count] ==0) {
        [self.tableView removeFromSuperview];
        [self.blankView removeFromSuperview];
        [self.retryView removeFromSuperview];
        [self.view addSubview:self.blankView];
        self.tableShowed = NO;
        return;
    }
    
    if (self.tableShowed) {
        [self.tableView beginUpdates];
        NSIndexPath *theROW = [NSIndexPath indexPathForRow:0 inSection:0];
        NSArray *insertRows = [NSArray arrayWithObject:theROW];
        [self.tableView insertRowsAtIndexPaths:insertRows withRowAnimation:UITableViewRowAnimationTop];
        [self.tableView endUpdates];
        return;
    }
    
    
    //如果读取成功，条目数不为0，则展示tableView
    [self.tableView removeFromSuperview];
    [self.blankView removeFromSuperview];
    [self.retryView removeFromSuperview];
    [self.view addSubview:self.tableView];
    self.tableShowed = YES;
    
}


-(void)loadMoment{
    
    [self showLoading];
    
    NSMutableArray *momentBeforeSorting = [KetangPersistenManager getMoment];
    
    self.moment = [momentBeforeSorting sortedArrayUsingComparator:^NSComparisonResult(NSDictionary *a,NSDictionary *b){
        
        NSNumber *aTimestamp = [a objectForKey:@"timestamp"];
        NSNumber *bTimestamp = [b objectForKey:@"timestamp"];
        
        if (aTimestamp > bTimestamp){//如果A更新，A排在B之前
            return (NSComparisonResult)NSOrderedAscending;
            
        }else if(aTimestamp < bTimestamp){//如果B更新，B排在A之前
            return  (NSComparisonResult)NSOrderedDescending;
            
        }else{//如果一样，则顺序不改变
            return  (NSComparisonResult)NSOrderedSame;
        }
        
        
        
        
    }];
    
    [self performSelector:@selector(handleView) withObject:nil afterDelay:0.5];
    
}

-(void)post{
    
    PostMomentViewController *post = [[PostMomentViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:post];
    
    
    [self.navigationController presentViewController:nav animated:YES completion:nil];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self showCover];
    
    self.tableShowed = NO;
    
    
    
    //表格的实例化和初始化
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [KetangUtility screenHeigth], [KetangUtility screenHeigth]-64)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    //空白页的提示页的实例化和初始化
    self.blankView = [BlankView blankViewWinthText:@"空空如也" buttonText:@"亲，写一句吧" target:self action:@selector(post)];
    
    //重试提示页的实例化和初始化
    self.retryView = [RetryView retryViewWinthText:@"额，出错了" buttonText:@"重试" target:self action:@selector(loadMoment)];
    

    
    //按钮
    [self setRightNavigationButtonWithTitle:@"写笔记" target:self action:@selector(post)];
    

    [self setSingleLineTitle:@"笔记"];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self selector:@selector(loadMoment) name:@"newMomentSaved" object:nil];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//签署协议
-(NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (self.moment ==nil){
        
        return 0;
        
    }
    
    return [self.moment count];
}

-(UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    MomentCell *cell = [MomentCell prepareCellForTableView:tableView];
    
    NSInteger row = indexPath.row;
    
    NSDictionary *dictionary = self.moment[row];
    
    NSNumber *timestamp = [dictionary objectForKey:@"timestamp"];
    
    NSMutableDictionary *dateDictionary = [KetangUtility dateThen:timestamp];
    NSString *year = [dateDictionary objectForKey:@"year"];
    NSString *month = [dateDictionary objectForKey:@"month"];
    NSString *yearAndMonth = [NSString stringWithFormat:@"%@年%@月",year,month];
    [dateDictionary setObject:yearAndMonth forKey:@"yearAndMonth"];
    
    [dateDictionary addEntriesFromDictionary:dictionary];
    
    
    [cell setContentWithDictionary:dateDictionary];
    
    return cell;
}


//浮点
-(CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    NSInteger row = indexPath.row;
    NSDictionary *dictionary = self.moment[row];
    NSString *content = [dictionary objectForKey:@"content"];
    
    CGFloat height = [MomentCell cellHeightFormTexr:content];
    
    
    
    return height;
    
}
//点击跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSInteger row = indexPath.row;
    NSDictionary *dictionary = self.moment[row];
    
    NSNumber *timestamp = [dictionary objectForKey:@"timestamp"];
    
    NSMutableDictionary *dateDictionary = [KetangUtility dateThen:timestamp];
    NSString *year = [dateDictionary objectForKey:@"year"];
    NSString *month = [dateDictionary objectForKey:@"month"];
    NSString *day = [dateDictionary objectForKey:@"day"];
    NSString *yearAndMonthAndDay = [NSString stringWithFormat:@"%@年%@月%@日",year,month,day];
    [dateDictionary setObject:yearAndMonthAndDay forKey:@"yearAndMonthAndDay"];
    
    [dateDictionary addEntriesFromDictionary:dictionary];

    MomentDetailViewController *detail = [[MomentDetailViewController alloc] initWithDictionary:dateDictionary];
    
    [self.navigationController pushViewController:detail animated:YES];
    
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
