//
//  ImageToolBase.m
//  ImageEditor
//
//  Created by BOOM on 17/2/12.
//  Copyright © 2017年 BOOM. All rights reserved.
//

#import "ImageToolBase.h"

const CGFloat ImageToolAnimationDuration    = 0.3;
const CGFloat ImageToolFadeoutDuration      = 0.2;

@interface ImageToolBase ()

@property (nonatomic, weak) ImageEditorViewController *editor;

@end

@implementation ImageToolBase



+ (NSString *)defaultIconPath
{
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"CLImageEditor" ofType:@"bundle"];
    
    return [NSString stringWithFormat:@"%@/CL%@/Black/icon.png", bundlePath, NSStringFromClass([self class])];
}

+ (CGFloat)defaultDockedNumber
{
    // Image tools are sorted according to the dockedNumber in tool bar.
    // Override point for tool bar customization
    NSArray *tools = @[
                       @"CLFilterTool",
                       @"CLAdjustmentTool",
                       @"CLEffectTool",
                       @"CLBlurTool",
                       @"CLRotateTool",
                       @"CLClippingTool",
                       @"CLToneCurveTool",
                       ];
    return [tools indexOfObject:NSStringFromClass(self)];
}

+ (NSString *)defaultTitle
{
    return @"DefaultTitle";
}

+ (NSArray *)subTools
{
    return nil;
}

+ (BOOL)isAvailabel
{
    return NO;
}

#pragma mark - 子类重写使用

- (void)setup
{
    
}

- (void)cleanup
{
    
}

- (void)execute:(ComplectionBlock)completionBlock
{
    completionBlock(self.editor.image, nil, nil);
}

- (UIImage *)imageForKey:(NSString *)key defaultImageName:(NSString *)defaultImageName
{
    return nil;
}

@end
