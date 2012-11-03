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



@implementation XIBSpriteImageView

- (CGRect)rectAtPosition:(CGPoint)position {
    CGSize size = self.frame.size;
    return (CGRect){
        position.x * size.width,
        position.y * size.height,
        size
    };
}

- (CGRect)imageRectAtPosition:(CGPoint)position {
    CGSize size = _spriteSize;
    return (CGRect){
        position.x * size.width,
        position.y * size.height,
        size
    };
}

- (CGSize)totalPosition {
    CGSize size = self.image.size;
    
    return (CGSize){
        ceilf(size.width / _spriteSize.width),
        ceilf(size.height / _spriteSize.height)
              };
}

- (CGPoint)spriteForTouchLocation:(CGPoint)touchLocation {

    CGSize totalPosition = [self totalPosition];
    CGFloat width = self.frame.size.width / totalPosition.width;
    
    CGFloat height = self.frame.size.height / totalPosition.height;

    CGPoint point = CGPointMake(
                                floorf(touchLocation.x / width),
                                floorf(touchLocation.y / height)
                                );
    
    return point;
}

- (UIImage *)imageFromPosition:(CGPoint)position {
    UIGraphicsBeginImageContextWithOptions(_spriteSize, YES, 0);
    CGRect rect = [self imageRectAtPosition:position];
    UIRectClip((CGRect){CGPointZero, rect.size});
    
    [self.image drawAtPoint:(CGPoint){
        -rect.origin.x,
        -rect.origin.y}];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();

    return image;
}

@end

