//
//  YYYFormetor.m
//  教材选择Demo
//
//  Created by jingdi on 2016/12/30.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

#import "YYYFormetor.h"

@implementation YYYFormetor
- (NSDictionary *)reformDataWithManager:(APIManager *)manager {
    NSLog(@"YYYFormetor ->%@", manager.rawData);
    return manager.rawData;
}
@end
