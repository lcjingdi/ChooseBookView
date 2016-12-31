//
//  ViewController.m
//  教材选择Demo
//
//  Created by jingdi on 2016/12/30.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

#import "ViewController.h"
#import <FMDB/FMDatabase.h>
#import "APIManager.h"
#import "JDSelectorView.h"
#import "XXXFormetor.h"
#import "YYYFormetor.h"

@interface ViewController ()<APIManagerDelegate>
@property (nonatomic, strong) id<JDSelectProtocol> JJJReformer;
@property (nonatomic, strong) id<JDSelectProtocol> DDDReformer;
@property (nonatomic, strong) JDSelectorView *JJJView;
@property (nonatomic, strong) JDSelectorView *DDDView;

@property (nonatomic, strong) APIManager *apiManager1;
@property (nonatomic, strong) APIManager *apiManager2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    
    [self.view addSubview:self.JJJView];
    [self.view addSubview:self.DDDView];
    
    
    APIManager *a = [[APIManager alloc] init];
    self.apiManager1 = a;
    self.apiManager1.delegate = self;
    
    
    APIManager *b = [[APIManager alloc] init];
    self.apiManager2 = b;
    self.apiManager2.delegate = self;
    
    
    XXXFormetor *x = [[XXXFormetor alloc] init];
    self.JJJReformer = x;
    YYYFormetor *y = [[YYYFormetor alloc] init];
    self.DDDReformer = y;
    
    [self.apiManager1 requestAData];
    [self.apiManager2 requestBData];
}

- (void)apiManagerDidSuccess:(APIManager *)manager {
    if (manager == self.apiManager1) {
        NSDictionary *reformedJJJData = [manager fetchDataWithReformer:self.JJJReformer];
        NSLog(@"reformedJJJData->%@",reformedJJJData);
        [self.JJJView configWithData:reformedJJJData];
    } else if (manager == self.apiManager2) {
        NSDictionary *reformedDDDData = [manager fetchDataWithReformer:self.DDDReformer];
        NSLog(@"reformedDDDData->%@",reformedDDDData);
        [self.DDDView configWithData:reformedDDDData];
    }
    
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSString *fileName = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
//    FMDatabase *db = [FMDatabase databaseWithPath:fileName];
//    if ([db open]) {
//        BOOL result = [db executeUpdate:@""];
//        if (result) {
//            NSLog(@"成功创表");
//        } else {
//            NSLog(@"创表失败");
//        }
//    }
//}

#pragma mark - setter && getter
- (JDSelectorView *)JJJView {
    if (_JJJView == nil) {
        
        _JJJView = [[JDSelectorView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60)];
        _JJJView.backgroundColor = [UIColor redColor];
    }
    return _JJJView;
}
- (JDSelectorView *)DDDView {
    if (_DDDView == nil) {
        _DDDView = [[JDSelectorView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 120, self.view.bounds.size.width, 60)];
        _DDDView.backgroundColor = [UIColor blueColor];
    }
    return _DDDView;
}
@end
