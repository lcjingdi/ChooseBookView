//
//  JDSelectProtocol.h
//  教材选择Demo
//
//  Created by jingdi on 2016/12/30.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIManager.h"

@protocol JDSelectProtocol <NSObject>

- (NSDictionary *)reformDataWithManager:(APIManager *)manager;

@end
