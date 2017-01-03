//
//  XXXFormetor.m
//  教材选择Demo
//
//  Created by jingdi on 2016/12/30.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

#import "XXXFormetor.h"

@implementation XXXFormetor
- (NSArray *)reformDataWithManager:(APIManager *)manager {
    
    NSMutableArray *totalArray = [NSMutableArray arrayWithCapacity:5];
    
    NSLog(@"XXXFormetor ->%@", manager.rawData);
    NSDictionary *dict = [manager.rawData objectForKey:@"data"];
    
    NSMutableDictionary *d = [NSMutableDictionary dictionaryWithCapacity:20];
    NSMutableDictionary *d2 = [NSMutableDictionary dictionaryWithCapacity:20];
    for (int i = 0; i < 2; i++) {
        
        [d setObject:@"七年级" forKey:@"title"];
        [d2 setObject:@"景迪教版" forKey:@"title"];
        NSMutableArray *arrayM = [NSMutableArray array];
        NSMutableArray *arrayM2 = [NSMutableArray array];
        for (int i = 0; i < [[dict objectForKey:@"grades"] count]; i++) {
            NSArray *array = [dict objectForKey:@"grades"];
            [arrayM addObject:[array[i] objectForKey:@"grades_title"]];
        }
        for (int i = 0; i < [[dict objectForKey:@"vendors"] count]; i++) {
            NSArray *array = [dict objectForKey:@"vendors"];
            [arrayM2 addObject:[array[i] objectForKey:@"vendor_title"]];
        }
        [d setObject:[arrayM copy] forKey:@"subTitles"];
        [d2 setObject:[arrayM2 copy] forKey:@"subTitles"];
    }
    
    [totalArray addObject:d];
    [totalArray addObject:d2];
    
    return [totalArray copy];
}
@end
