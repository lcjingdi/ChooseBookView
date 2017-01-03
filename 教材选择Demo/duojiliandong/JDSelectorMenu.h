//
//  JDSelectorView.h
//  教材选择Demo
//
//  Created by jingdi on 2016/12/30.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JDSelectorMenu;
#pragma mark - delegate
@protocol JDSelectorMenuDelegate <NSObject>
@optional
- (void)menu:(JDSelectorMenu *)menu didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface JDSelectorMenu : UIView

@property (nonatomic, weak) id <JDSelectorMenuDelegate> delegate;

- (void)configWithData:(NSArray *)array;

- (instancetype)initWithOrigin:(CGPoint)origin height:(CGFloat)height;

@end
