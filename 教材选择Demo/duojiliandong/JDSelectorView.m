//
//  JDSelectorView.m
//  教材选择Demo
//
//  Created by jingdi on 2016/12/30.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

#import "JDSelectorView.h"

@implementation JDSelectorView

- (void)configWithData:(NSDictionary *)dictionary {
    int j = [[dictionary objectForKey:@"count"] intValue];
    for (int i = 0; i < j; i++) {
        
        CGFloat y = 0;
        CGFloat width = self.frame.size.width / (CGFloat)j;
        CGFloat x = width * i;
        CGFloat h = self.frame.size.height;
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(x, y, width, h)];
        view.backgroundColor = [self randomColor];
        [self addSubview:view];
    }
}

- (UIColor *)randomColor {
    
    UIColor *color = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    return color;
}
@end
