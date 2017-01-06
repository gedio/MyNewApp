//
//  KetangUtility.h
//  MyNewApp
//
//  Created by Suma on 2016/12/2.
//  Copyright © 2016年 Suma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KetangUtility : NSObject

+(NSNumber *)timestamp;
+(NSMutableDictionary *)dateThen:(NSNumber *)timestamp;


+(CGFloat)screenWidth;
+(CGFloat)screenHeigth;


@end
