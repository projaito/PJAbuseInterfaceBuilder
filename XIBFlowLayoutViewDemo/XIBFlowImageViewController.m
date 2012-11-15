//
//  XIBFlowImageViewController.m
//  PJAbuseInterfaceBuilderDemo
//
//  Created by james on 15/11/12.
//  Copyright (c) 2012 projaito. All rights reserved.
//

#import "XIBFlowImageViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface XIBFlowImageViewController ()

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imageViews;

@end

@implementation XIBFlowImageViewController


- (IBAction)buttonDidPress:(id)sender {
    UIGraphicsBeginImageContextWithOptions([sender frame].size, YES, 0);
    
    [[sender layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    [self.imageViews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIImageView *imageView = obj;
        imageView.image = image;
    }];
}

@end
