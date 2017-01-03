//
//  JDSelectorView.m
//  教材选择Demo
//
//  Created by jingdi on 2016/12/30.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

#import "JDSelectorMenu.h"

@interface JDSelectorMenu()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIButton *bgButton;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) NSInteger numOfMenu;
@property (nonatomic, assign) NSInteger currentSelectedMenudIndex;
@property (nonatomic, assign) BOOL show;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation JDSelectorMenu

- (instancetype)initWithOrigin:(CGPoint)origin height:(CGFloat)height {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    self = [self initWithFrame:CGRectMake(origin.x, origin.y, screenSize.width, height)];
    if (self) {
        _currentSelectedMenudIndex = -1;
        _show = NO;
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(origin.x, self.frame.origin.y + self.frame.size.height, 0, 0) style:UITableViewStyleGrouped];
        _tableView.rowHeight = 38;
        _tableView.separatorColor = [UIColor colorWithRed:220.f/255.0f green:220.f/255.0f blue:220.f/255.0f alpha:1.0];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        self.autoresizesSubviews = NO;
        _tableView.autoresizesSubviews = NO;
    }
    return self;
}
- (void)configWithData:(NSArray *)array {
    _dataArray = array;
    int j = [array count];
    for (int i = 0; i < j; i++) {
        
        CGFloat y = 0;
        CGFloat width = self.frame.size.width / (CGFloat)j;
        CGFloat x = width * i;
        CGFloat h = self.frame.size.height;
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(x, y, width, h)];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(taped:)];
        [view addGestureRecognizer:tap];
        view.tag = 1000+i;
        UILabel *label = [[UILabel alloc] initWithFrame:view.bounds];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = [array[i] objectForKey:@"title"];
        [view addSubview:label];
        view.backgroundColor = [self randomColor];
        [self addSubview:view];
    }
}

#pragma mark - animation
- (void)animateTableView:(UITableView *)tableView show:(BOOL)show complete:(void(^)())complete {
    CGFloat tableViewHeight = 0.0f;
    if (show) {
        _tableView.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y + self.frame.size.height, self.frame.size.width, 0);
        [self.superview addSubview:_tableView];
        tableViewHeight = ([_tableView numberOfRowsInSection:0] > 5) ? (5 * _tableView.rowHeight) : ([_tableView numberOfRowsInSection:0] * _tableView.rowHeight);
        [UIView animateWithDuration:0.25 animations:^{
            _tableView.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y + self.frame.size.height, self.frame.size.width, tableViewHeight);
        }];
    } else {
        [UIView animateWithDuration:0.25 animations:^{
            _tableView.frame = CGRectMake(self.frame.origin.x, self.frame.size.height, self.frame.size.width, 0);
        } completion:^(BOOL finished) {
            [_tableView removeFromSuperview];
        }];
    }
    complete();
}

#pragma mark - 代理
#pragma mark UITableViewDelegate

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
static NSString *identifier = @"selectorMenu";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:244.0f/255.0f green:244.0f/255.0f blue:244.0f/255.0f alpha:1.0];
    
    cell.textLabel.text = [self.dataArray[indexPath.section] objectForKey:@"subTitles"][indexPath.row];
    
    return cell;
}
#pragma mark - event
- (void)tapBgButton {
    self.bgButton.hidden = YES;
}
- (void)taped:(UIGestureRecognizer *)reg {
    
    CGPoint touchPoint = [reg locationInView:self];
    NSInteger tapIndex = touchPoint.x / (self.frame.size.width / _numOfMenu);
    
    [self.superview addSubview:self.bgButton];
    [self.bgButton.superview addSubview:self];
    NSLog(@"taped->%@",reg.view);
    self.bgButton.hidden = NO;
//    for (int i = 0; i < _numOfMenu; i++) {
//        if (i != tapIndex) {
//            
//        }
//    }
    
//    if (tapIndex == _currentSelectedMenudIndex) {
//        
//    }
//    
//    if (tapIndex == _currentSelectedMenudIndex && _show) {
//        
//    } else {
//        _currentSelectedMenudIndex = tapIndex;
//        [_tableView reloadData];
//        
//        if (_tableView) {
//            _tableView.frame = CGRectMake(_tableView.frame.origin.x, self.frame.origin.y + self.frame.size.height, self.frame.size.width, 0);
//        }
//    }
    

    
    
}

- (UIColor *)randomColor {
    
    UIColor *color = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    return color;
}

#pragma mark - setter&getter

- (UIButton *)bgButton {
    if (_bgButton == nil) {
        _bgButton = [[UIButton alloc] initWithFrame:[UIScreen mainScreen].bounds];
//        _bgButton.hidden = YES;
//        _bgButton.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.4];
        _bgButton.backgroundColor = [UIColor redColor];
        [_bgButton addTarget:self action:@selector(tapBgButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bgButton;
}
- (NSArray *)dataArray {
    if (_dataArray == nil) {
        
        _dataArray = [NSArray array];
    }
    return _dataArray;
}
@end
