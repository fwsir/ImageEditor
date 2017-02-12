//
//  ToolBarMenuItem.m
//  ImageEditor
//
//  Created by BOOM on 17/2/12.
//  Copyright © 2017年 BOOM. All rights reserved.
//

#import "ToolBarMenuItem.h"

@interface ToolBarMenuItem ()

@property (nonatomic, assign) ToolBarMenuType type;

@end

@implementation ToolBarMenuItem

+ (instancetype)createToolBarMenuItemWithType:(ToolBarMenuType)type
                                     delegate:(id<ToolBarMenuItemProtocol>)delegate
{
    ToolBarMenuItem *item = [ToolBarMenuItem new];
    
    item.type = type;
    item.delegate = delegate;
    
    return item;
}



- (void)setType:(ToolBarMenuType)type
{
    _type = type;
    [self _updateMenuItem];
}

- (IBAction)singleTapAction:(UITapGestureRecognizer *)sender
{
    if ([self.delegate respondsToSelector:@selector(ToolBarMenuItemTaped:)])
    {
        [self.delegate ToolBarMenuItemTaped:self];
    }
}



#pragma mark - PrivateMethods

- (void)_updateMenuItem
{
    switch (self.type)
    {
        case toolbarm:
            <#statements#>
            break;
            
        default:
            break;
    }
}

@end
