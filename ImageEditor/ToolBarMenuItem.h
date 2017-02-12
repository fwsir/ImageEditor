//
//  ToolBarMenuItem.h
//  ImageEditor
//
//  Created by BOOM on 17/2/12.
//  Copyright © 2017年 BOOM. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ToolBarMenuType)
{
    ToolBarMenuTypeFilter = 0,
    ToolBarMenuTypeAdjustment,
    ToolBarMenuTypeEffect,
    ToolBarMenuTypeBlurAndFocus,
    ToolBarMenuTypeRotate,
    ToolBarMenuTypeDraw,
    ToolBarMenuTypeSplash,
    ToolBarMenuTypeCrop,
    ToolBarMenuTypeResize,
    ToolBarMenuTypeToneCurve,
    ToolBarMenuTypeSticker,
    ToolBarMenuTypeEmotions,
    ToolBarMenuTypeText
};

@class ToolBarMenuItem;
@protocol ToolBarMenuItemProtocol <NSObject>

- (void)ToolBarMenuItemTaped:(ToolBarMenuItem *)menuItem;

@end

@interface ToolBarMenuItem : UIView

@property (nonatomic, weak) id<ToolBarMenuItemProtocol> delegate;

+ (instancetype)createToolBarMenuItemWithType:(ToolBarMenuType)type
                                     delegate:(id<ToolBarMenuItemProtocol>)delegate;

@end
