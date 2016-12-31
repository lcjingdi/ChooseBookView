//
//  APIManager.h
//  教材选择Demo
//
//  Created by jingdi on 2016/12/30.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol JDSelectProtocol;
@class APIManager;
@protocol APIManagerDelegate <NSObject>

- (void)apiManagerDidSuccess:(APIManager *)manager;

@end

@interface APIManager : NSObject

- (void)requestAData;
- (void)requestBData;
@property (nonatomic, strong) NSDictionary *rawData;
@property (nonatomic, weak) id<APIManagerDelegate> delegate;

- (NSDictionary *)fetchDataWithReformer:(id<JDSelectProtocol>)reformer;
@end
