//
//  ImageToolBase.h
//  ImageEditor
//
//  Created by BOOM on 17/2/12.
//  Copyright © 2017年 BOOM. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ImageEditorViewController.h"

FOUNDATION_EXPORT const CGFloat ImageToolAnimationDuration;
FOUNDATION_EXPORT const CGFloat ImageToolFadeoutDuration;

typedef void (^ComplectionBlock)(UIImage *image, NSError *error, NSDictionary *userInfo);

@class ToolInfo;
@interface ImageToolBase : NSObject


- (instancetype)initWithEditor:(ImageEditorViewController *)editor
                      toolInfo:(ToolInfo *)toolInfo;

- (void)setup;

- (void)cleanup;

- (void)execute:(ComplectionBlock)completionBlock;

- (UIImage*)imageForKey:(NSString*)key defaultImageName:(NSString*)defaultImageName;

@end
