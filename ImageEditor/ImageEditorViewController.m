//
//  ImageEditorViewController.m
//  ImageEditor
//
//  Created by BOOM on 17/2/12.
//  Copyright © 2017年 BOOM. All rights reserved.
//

#import "ImageEditorViewController.h"
#import <Masonry.h>

@interface ImageEditorViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) UINavigationBar *navigationBar;

@end

@implementation ImageEditorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 初始化
    [self initNavigationBar];
}

#pragma mark - CustomInitialize

- (void)initNavigationBar
{
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(_pushedFinishBtn:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    if (self.navigationController)
    {
        
    }
    else
    {
        UINavigationItem *item = [UINavigationItem new];
        item.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(_pushedCloseBtn:)];
        item.rightBarButtonItem = rightItem;
        
        if (!self.navigationBar)
        {
            self.navigationBar = [[UINavigationBar alloc] init];
        }
        [self.navigationBar pushNavigationItem:item animated:NO];
        self.navigationBar.delegate = self;
        self.navigationBar.topItem.title = self.title;
        
        [self.view addSubview:self.navigationBar];
        [self.navigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.top.equalTo(self.view).offset(22);
            make.height.equalTo(@44);
        }];
    }
}


- (UIImage *)image
{
    return self.imageView.image;
}

#pragma mark - privateMethod

- (void)_pushedCloseBtn:(id)sender
{
    
}

- (void)_pushedFinishBtn:(id)sender
{
    
}

@end
