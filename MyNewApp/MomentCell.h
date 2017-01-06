//
//  MomentCell.h
//  MyNewApp
//
//  Created by Suma on 2016/11/29.
//  Copyright © 2016年 Suma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MomentCell : UITableViewCell

+(MomentCell *)prepareCellForTableView:(UITableView *)tableView;

-(void)setContentWithDictionary:(NSDictionary *)dictionary;

+(CGFloat)cellHeightFormTexr:(NSString *)text;

 
@end
