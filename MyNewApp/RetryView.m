//
//  RetryView.m
//  MyNewApp
//
//  Created by Suma on 2016/12/8.
//  Copyright © 2016年 Suma. All rights reserved.
//

#import "RetryView.h"
#import "KetangUtility.h"
#import "UIButton+Ketang.h"

@implementation RetryView

+(RetryView *)retryViewWinthText:(NSString *)text buttonText:(NSString *)buttonText target:(id)target action:(SEL)action{
    
    //空白页的提示页的实例化和初始化
    RetryView *retryView = [[RetryView alloc] initWithFrame:CGRectMake(0, 64, [KetangUtility screenHeigth], [KetangUtility screenHeigth]-64)];
    UILabel *retryLabel = [[UILabel alloc] initWithFrame:CGRectMake(([KetangUtility screenWidth]-100)/2, (retryView.frame.size.height-100)/2-40, 100, 100)];
    retryLabel.text = text;
    retryLabel.textColor = [UIColor grayColor];
    retryLabel.textAlignment = NSTextAlignmentCenter;
    retryLabel.font = [UIFont systemFontOfSize:17];
    [retryView addSubview:retryLabel];
    
    //按钮
    UIButton *retryButton = [UIButton contentButtonWithTitle:buttonText target:target action:action];
    
    
    CGFloat retryButtonX = ([KetangUtility screenWidth] - retryButton.frame.size.width)/2;
    CGFloat retryButtonY = (retryView.frame.size.height - retryButton.frame.size.height)/2 + 10;
    
    
    [retryButton setFrame:CGRectMake(retryButtonX, retryButtonY , retryButton.frame.size.width, retryButton.frame.size.height)];
    
    [retryView addSubview:retryButton];
    
    return retryView;
    
    
    
    
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
