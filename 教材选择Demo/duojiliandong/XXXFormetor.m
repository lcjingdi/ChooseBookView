//
//  XXXFormetor.m
//  教材选择Demo
//
//  Created by jingdi on 2016/12/30.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

#import "XXXFormetor.h"

@implementation XXXFormetor
- (NSDictionary *)reformDataWithManager:(APIManager *)manager {
    NSLog(@"XXXFormetor ->%@", manager.rawData);
    NSDictionary *dict = [manager.rawData objectForKey:@"sss"];
    return dict;
}
@end
