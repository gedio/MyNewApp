//
//  BlankView.m
//  MyNewApp
//
//  Created by Suma on 2016/12/8.
//  Copyright © 2016年 Suma. All rights reserved.
//

#import "BlankView.h"
#import "KetangUtility.h"
#import "UIButton+Ketang.h"

@implementation BlankView

+(BlankView *)blankViewWinthText:(NSString *)text buttonText:(NSString *)buttonText target:(id)target action:(SEL)action{
    
    //空白页的提示页的实例化和初始化
    BlankView *blankView = [[BlankView alloc] initWithFrame:CGRectMake(0, 64, [KetangUtility screenHeigth], [KetangUtility screenHeigth]-64)];
    UILabel *blankLabel = [[UILabel alloc]initWithFrame:CGRectMake(([KetangUtility screenWidth]-100)/2, (blankView.frame.size.height-100)/2-35, 100, 100)];
    blankLabel.text = text;
    blankLabel.textColor = [UIColor grayColor];
    blankLabel.textAlignment = NSTextAlignmentCenter;
    blankLabel.font = [UIFont systemFontOfSize:17];
    [blankView addSubview:blankLabel];
    
    //按钮
    UIButton *writeButton = [UIButton contentButtonWithTitle:buttonText target:target action:action];
    
    CGFloat writeButtonX = ([KetangUtility screenWidth] - writeButton.frame.size.width)/2;
    CGFloat writeButtonY = (blankView.frame.size.height - writeButton.frame.size.height)/2 + 10;
                                                                                        
    
    [writeButton setFrame:CGRectMake(writeButtonX, writeButtonY , writeButton.frame.size.width, writeButton.frame.size.height)];
    
    [blankView addSubview:writeButton];

    return blankView;
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
