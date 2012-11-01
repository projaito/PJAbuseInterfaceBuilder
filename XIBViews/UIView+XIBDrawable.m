//
//  UIView+XIBDrawable.m
//  PJAbuseInterfaceBuilderDemo
//
//  Created by james on 1/11/12.
//  Copyright (c) 2012 projaito. All rights reserved.
//

#import "UIView+XIBDrawable.h"
#import "XIBImageView.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (XIBDrawable)

- (void)drawContextInRect:(CGRect)rect {
    UIGraphicsBeginImageContextWithOptions(rect.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [image drawInRect:rect];
}

@end

@implementation UIImageView (XIBDrawable)

- (void)drawContextInRect:(CGRect)rect {
    [self.image drawInRect:rect];
}

@end

@implementation UILabel (XIBDrawable)

- (void)drawContextInRect:(CGRect)rect {
    [self drawTextInRect:rect];
}

@end


#pragma mark -

@implementation XIBBrush

- (void)awakeFromNib {
    self.image = self.sourceImageView.image;
}

- (void)drawContextInRect:(CGRect)rect {
    if (self.image) {
        [self.image drawInRect:rect];
    } else {
        [super drawContextInRect:rect];
    }
}

@end

@implementation XIBPatternBrush

- (void)drawContextInRect:(CGRect)rect {
    if (self.image) {
        [self.image drawAsPatternInRect:rect];
    } else {
        [super drawContextInRect:rect];
    }
}

@end

@implementation XIBSpriteBrush {
    CGSize _spriteSize;
    CGSize _dimension;
}

- (void)awakeFromNib {
    self.image = self.sourceImageView.image;
    _spriteSize = self.sourceImageView.spriteSize;
    
    CGSize size = self.sourceImageView.frame.size;

    _dimension = CGSizeMake(size.width / _spriteSize.width, size.height/_spriteSize.height);
}


- (void)drawContextInRect:(CGRect)rect {
    
    CGContextRef context =  UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    
    
    CGFloat x = self.spritePosition.x * -rect.size.width;
    CGFloat y = self.spritePosition.y * -rect.size.height;
    
    CGPoint drawPoint = CGPointMake(
                                    rect.origin.x + x,
                                    rect.origin.y + y
                                    );
    
    CGSize drawSize = CGSizeMake(
                                 rect.size.width * _dimension.width,
                                 rect.size.height * _dimension.height);

    CGRect drawRect = (CGRect){drawPoint, drawSize};

    UIRectClip(rect);

    /*
    [[UIColor redColor] set];
    UIRectFill(drawRect);

    [[UIColor yellowColor] set];
    UIRectFill(rect);
     */

    [self.image drawInRect:drawRect];

    CGContextRestoreGState(context);
}


@end


