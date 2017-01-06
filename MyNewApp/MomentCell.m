//
//  MomentCell.m
//  MyNewApp
//
//  Created by Suma on 2016/11/29.
//  Copyright © 2016年 Suma. All rights reserved.
//

#import "MomentCell.h"
#import "KetangUtility.h"

@interface MomentCell()
@property(strong,nonatomic) UILabel *dayLabel;
@property(strong,nonatomic) UILabel *dayOfWeekLabel;
@property(strong,nonatomic) UILabel *yearAndMonthLabel;
@property(strong,nonatomic) UILabel *contentLabel;

@end

@implementation MomentCell

+(CGFloat)contentHeight:(NSString *)text{
    
    CGSize size = CGSizeMake(240, 9999999);
    NSString *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15],NSFontAttributeName, nil];
    
    CGRect rect = [text boundingRectWithSize:size
                                     options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                  attributes:attributes
                                     context:nil];
    
    CGFloat height = rect.size.height;
    return height;
    
    
}

+(CGFloat)cellHeightFormTexr:(NSString *)text{
    
    CGFloat height = [MomentCell contentHeight:text];
    CGFloat plannedHeight = height + 140;
    
    if (plannedHeight > 200) {
        return plannedHeight;
        
    
    }
    return 200;
    
}

- (void)setContentWithDictionary:(NSDictionary *)dictionary{
  
    //字体内容
    self.dayLabel.text = [dictionary objectForKey:@"day"];
    self.dayOfWeekLabel.text = [dictionary objectForKey:@"dayOfWeek"];
    self.yearAndMonthLabel.text = [dictionary objectForKey:@"yearAndMonth"];
    self.contentLabel.text = [dictionary objectForKey:@"content"];
    
    CGFloat contentHeight = [MomentCell contentHeight:self.contentLabel.text];
    CGFloat cellHeight = [MomentCell cellHeightFormTexr:self.contentLabel.text];
    CGRect rect = CGRectMake(([UIScreen mainScreen].bounds.size.width-240)/2, (cellHeight-contentHeight)/2, 240, contentHeight);
    [self.contentLabel setFrame:rect];
    
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    

    
        self.dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 47, 46)];
        self.dayLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.3];
        self.dayLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:40];
        self.dayLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:self.dayLabel];
    
        self.dayOfWeekLabel = [[UILabel alloc] initWithFrame:CGRectMake(52, 30, 100, 15)];
        self.dayOfWeekLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.3];
        self.dayOfWeekLabel.font = [UIFont systemFontOfSize:12];
        self.dayOfWeekLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.dayOfWeekLabel];
    
        self.yearAndMonthLabel = [[UILabel alloc] initWithFrame:CGRectMake(52, 45, 100, 15)];
        self.yearAndMonthLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.3];
        self.yearAndMonthLabel.font = [UIFont systemFontOfSize:12];
        self.yearAndMonthLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.yearAndMonthLabel];
    
        self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
        self.contentLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
        self.contentLabel.font = [UIFont systemFontOfSize:15];
        self.contentLabel.textAlignment = NSTextAlignmentLeft;
        self.contentLabel.numberOfLines = 0;
        [self.contentView addSubview:self.contentLabel];
    
    
    return self;
}





+ (MomentCell *)prepareCellForTableView:(UITableView *)tableView;{
    
    MomentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"moment"];
    
    if (cell == nil){
        
        cell = [[MomentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"momnet"];
        
    }
    
    return cell;
}



@end
