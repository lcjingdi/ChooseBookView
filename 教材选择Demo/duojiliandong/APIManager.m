//
//  APIManager.m
//  教材选择Demo
//
//  Created by jingdi on 2016/12/30.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

#import "APIManager.h"
#import "JDSelectProtocol.h"

@interface APIManager()



@end

@implementation APIManager

- (void)requestAData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"XXXPlist" ofType:@"plist"];
    self.rawData = [NSDictionary dictionaryWithContentsOfFile:path];
    if (self.delegate && [self.delegate respondsToSelector:@selector(apiManagerDidSuccess:)]) {
        [self.delegate apiManagerDidSuccess:self];
    }
}
- (void)requestBData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"YYYPlist" ofType:@"plist"];
    self.rawData = [NSDictionary dictionaryWithContentsOfFile:path];
    if (self.delegate && [self.delegate respondsToSelector:@selector(apiManagerDidSuccess:)]) {
        [self.delegate apiManagerDidSuccess:self];
    }
}
- (NSDictionary *)fetchDataWithReformer:(id<JDSelectProtocol>)reformer {
    if (reformer == nil) {
        return @{@"count":@3};
    } else {
        return [reformer reformDataWithManager:self];
    }
}
@end
