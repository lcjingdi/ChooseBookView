//
//  APIManager.m
//  教材选择Demo
//
//  Created by jingdi on 2016/12/30.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

#import "APIManager.h"
#import "JDSelectProtocol.h"
#import <FMDB.h>

@interface APIManager()

@property (nonatomic, strong) FMDatabase *db;

@end

@implementation APIManager

- (void)requestAData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"book" ofType:@"plist"];
    self.rawData = [NSDictionary dictionaryWithContentsOfFile:path];
    
    [self saveData];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(apiManagerDidSuccess:)]) {
        [self.delegate apiManagerDidSuccess:self];
    }
    
}
- (void)saveData {
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"xxoo.sqlite"];
    self.db = [FMDatabase databaseWithPath:path];
    [self.db open];
    
    [self.db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_book (id integer PRIMARY KEY, name text NOT NULL);"];
    for (int i = 0; i < 100; i++) {
        NSString *name = [NSString stringWithFormat:@"七年级-%d",i];
        [self.db executeUpdateWithFormat:@"INSERT INTO t_book (name) VALUES (%@);", name];
    }
   
    FMResultSet *set = [self.db executeQuery:@"SELECT * FROM t_book"];
    while (set.next) {
        NSString *name = [set stringForColumn:@"name"];
        NSLog(@"%@",name);
    }
}
- (void)requestBData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"YYYPlist" ofType:@"plist"];
    self.rawData = [NSDictionary dictionaryWithContentsOfFile:path];
    if (self.delegate && [self.delegate respondsToSelector:@selector(apiManagerDidSuccess:)]) {
        [self.delegate apiManagerDidSuccess:self];
    }
}
- (NSArray *)fetchDataWithReformer:(id<JDSelectProtocol>)reformer {
    if (reformer == nil) {
//        return @{@"count":@3};
        return nil;
    } else {
        return [reformer reformDataWithManager:self];
    }
}
@end
