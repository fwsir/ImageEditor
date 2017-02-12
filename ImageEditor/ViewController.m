//
//  ViewController.m
//  ImageEditor
//
//  Created by BOOM on 17/2/11.
//  Copyright © 2017年 BOOM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITabBarDelegate, UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - TabBar delegate

- (void)deselectedTabBarItem:(UITabBar *)tabBar
{
    tabBar.selectedItem = nil;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    [self performSelector:@selector(deselectedTabBarItem:) withObject:tabBar afterDelay:0.2];
    
    switch (item.tag)
    {
        case 0:
            [self _pushNewPage];
            break;
        case 1:
            [self _pushEditPage];
            break;
        case 2:
            [self _pushSavePage];
            break;
            
        default:
            break;
    }
}

- (void)resetImageViewScale
{
    CGFloat Rw = self.scrollView.bounds.size.width / self.imageView.image.size.width;
    CGFloat Rh = self.scrollView.bounds.size.height / self.imageView.image.size.height;
    
    Rw = MAX(Rw, 1.0/Rw);
    Rh = MAX(Rh, 1.0/Rh);
    
    self.scrollView.minimumZoomScale = 1.0;
    self.scrollView.maximumZoomScale = MAX(MAX(Rw, Rh), 1.0);
    
    [self.scrollView setZoomScale:1.0 animated:YES];
}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat centerX = scrollView.frame.size.width / 2;
    CGFloat centerY = scrollView.frame.size.height / 2;
    
    centerX = scrollView.contentSize.width > scrollView.frame.size.width ? scrollView.contentSize.width / 2 : centerX;
    centerY = scrollView.contentSize.height > scrollView.frame.size.height ? scrollView.contentSize.height / 2 : centerY;
    
    [self.imageView setCenter:CGPointMake(centerX, centerY)];
}

#pragma mark - ImagePickerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
}

#pragma mark - private Methods

- (void)_pushNewPage
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancle" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            UIImagePickerController *picker = [UIImagePickerController new];
            picker.allowsEditing = NO;
            picker.delegate = self;
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            
            [self presentViewController:picker animated:YES completion:nil];
        }
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Photo Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
        {
            UIImagePickerController *picker = [UIImagePickerController new];
            picker.allowsEditing = NO;
            picker.delegate = self;
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
            [self presentViewController:picker animated:YES completion:nil];
        }
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)_pushEditPage
{
    if (self.imageView.image)
    {
        
    }
    else
    {
        [self _pushNewPage];
    }
}

- (void)_pushSavePage
{
    if (self.imageView.image)
    {
        
    }
    else
    {
        [self _pushNewPage];
    }
}



- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

@end
