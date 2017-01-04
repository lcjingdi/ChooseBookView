//
//  EKWSelectMenu.h
//  EKWStudent
//
//  Created by jingdi on 2017/1/4.
//  Copyright © 2017年 ekwing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKWSelectIndexPath : NSObject
@property (nonatomic, assign) NSInteger column;
@property (nonatomic, assign) NSInteger row;

+ (instancetype)indexPathWithColumn:(NSInteger)column row:(NSInteger)row;
@end

@class EKWSelectMenu;

@protocol EKWSelectMenuDelegate <NSObject>
@optional
- (void)menu:(EKWSelectMenu *)menu didSelectRowAtIndexPath:(NSIndexPath *)indexPath OtherIndexPath:(NSArray<NSIndexPath *> *)otherIndexPath;
@end

@protocol EKWSelectMenuDataSource <NSObject>

@required
/** 有多少列 */
- (NSInteger)numberOfColumnInMenu:(EKWSelectMenu *)menu;
/** 某一列有多少行 */
- (NSInteger)menu:(EKWSelectMenu *)menu numberOfRowsInColumn:(NSInteger)column;
/** 某一行的所有标题标题 如果不全默认显示null*/
- (NSArray<NSString *> *)menu:(EKWSelectMenu *)menu titleForRowAtIndexPath:(EKWSelectIndexPath *)indexPath;
/** 某一列的标题 */
- (NSString *)menu:(EKWSelectMenu *)menu titleForColumn:(NSInteger)coumn;

@end


NS_CLASS_AVAILABLE_IOS(7_0) @interface EKWSelectMenu : UIView

@property (nonatomic, weak) id <EKWSelectMenuDelegate> delegate;
@property (nonatomic, weak) id <EKWSelectMenuDataSource> dataSource;

- (instancetype)initWithOrigin:(CGPoint)origin height:(CGFloat)height;

@end
