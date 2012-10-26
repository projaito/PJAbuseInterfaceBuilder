//
//  XIBImageView.m
//  PJAbuseInterfaceBuilderDemo
//
//  Created by james on 26/10/12.
//  Copyright (c) 2012 projaito. All rights reserved.
//

#import "XIBImageView.h"

@implementation XIBImageView

- (UIEdgeInsets)capInsets {

    UIEdgeInsets capInsets = _capInsets;

    if (UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsetsZero, capInsets)) {
        capInsets = UIEdgeInsetsFromString(self.capInsetsString);
    }

    if (UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsetsZero, capInsets)) {

        CGRect frame = self.capInsetsView.frame;
        capInsets = UIEdgeInsetsMake(
                                    frame.origin.y,
                                    frame.origin.x,
                                    self.frame.size.height - frame.origin.y - frame.size.height,
                                    self.frame.size.width - frame.origin.x - frame.size.width);
        
    }

    return capInsets;
}

- (UIImage *)image {
    UIImage *image = [super image];
    return [image resizableImageWithCapInsets:self.capInsets];
}

@end
