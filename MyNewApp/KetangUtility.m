//
//  KetangUtility.m
//  MyNewApp
//
//  Created by Suma on 2016/12/2.
//  Copyright © 2016年 Suma. All rights reserved.
//

#import "KetangUtility.h"
#import <UIKit/UIKit.h>

@implementation KetangUtility

+(CGFloat)screenWidth{
    return [UIScreen mainScreen].bounds.size.width;
    
}

+(CGFloat)screenHeigth{
    return [UIScreen mainScreen].bounds.size.height;
    
}

+(NSNumber *)timestamp{
    
    NSDate *now = [NSDate date];
    NSTimeInterval timestampValue = [now timeIntervalSince1970];
    NSNumber *timestamp = [NSNumber numberWithLong:timestampValue];
    
    return timestamp;
    
    
    
}


+(NSMutableDictionary *)dateThen:(NSNumber *)timestamp{
    
    NSTimeInterval seconds = [timestamp doubleValue];
    NSDate *dateThen = [NSDate dateWithTimeIntervalSince1970:seconds];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    
    NSInteger interval = [zone secondsFromGMTForDate: dateThen];
    
    NSDate *localeDate = [dateThen  dateByAddingTimeInterval: interval];
    
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];//设置成中国阳历
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday;
    comps = [calendar components:unitFlags fromDate:localeDate];
    long weekNumber = [comps weekday]; //获取星期对应的长整形字符串
    long day=[comps day];//获取日期对应的长整形字符串
    long year=[comps year];//获取年对应的长整形字符串
    long month=[comps month];//获取月对应的长整形字符串
    
    NSString *weekDay;
    switch (weekNumber) {
        case 1:
            weekDay=@"星期日";
            break;
        case 2:
            weekDay=@"星期一";
            break;
        case 3:
            weekDay=@"星期二";
            break;
        case 4:
            weekDay=@"星期三";
            break;
        case 5:
            weekDay=@"星期四";
            break;
        case 6:
            weekDay=@"星期五";
            break;
        case 7:
            weekDay=@"星期六";
            break;
            
        default:
            break;
    }
    
    //        long hour=[comps hour];//获取小时对应的长整形字符串
    //        long minute=[comps minute];//获取月对应的长整形字符串
    //        long second=[comps second];//获取秒对应的长整形字符串
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                       [NSString stringWithFormat:@"%ld", day] ,@"day",
                                       [NSString stringWithFormat:@"%@", weekDay],@"dayOfWeek",
                                       [NSString stringWithFormat:@"%ld", year],@"year",
                                       [NSString stringWithFormat:@"%ld", month],@"month",
                                       nil];
    
    return dictionary;
    
}

@end
