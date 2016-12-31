//
//  JDSelectorView.h
//  教材选择Demo
//
//  Created by jingdi on 2016/12/30.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JDSelectorViewDelegate <NSObject>

- (void)

@end

@interface JDSelectorView : UIView

- (void)configWithData:(NSDictionary *)dictionary;

@end
