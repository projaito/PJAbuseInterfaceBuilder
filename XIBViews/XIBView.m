//
//  XIBView.m
//  AnyHap
//
//  Created by james on 31/10/12.
//  Copyright (c) 2012 mystcolor. All rights reserved.
//

#import "XIBView.h"
#import "XIBImageView.h"
#import <QuartzCore/QuartzCore.h>

@implementation XIBView

- (void)awakeFromNib {
    if (self.defaultShadowsEnabled) {
        CALayer *layer      = self.layer;
        
        if (self.useBoundsForShadowPath) {
            UIBezierPath *path  = [UIBezierPath bezierPathWithRect:layer.bounds];
            layer.shadowPath    = path.CGPath;
        }

        layer.shadowOffset  = CGSizeZero;
        layer.shadowRadius  = 4.0f;
        layer.shadowColor   = [UIColor blackColor].CGColor;
        layer.shadowOpacity = 1.0f;
    }
}

@end


@implementation XIBDrawRectView

- (void)awakeFromNib {
    [self.drawAsPatternImageViews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [obj setHidden:YES];
    }];
    [self.drawInRectImageViews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [obj setHidden:YES];
    }];
    [self.drawAtPointImageViews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [obj setHidden:YES];
    }];
    [self.drawableViews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [obj setHidden:YES];
    }];
}

- (void)drawRect:(CGRect)rect {
    [self.drawAsPatternImageViews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [[obj image] drawAsPatternInRect:[obj frame]];
    }];
    [self.drawInRectImageViews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [[obj image] drawInRect:[obj frame]];
    }];
    [self.drawAtPointImageViews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [[obj image] drawAtPoint:[obj frame].origin];
    }];
    [self.drawableViews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj conformsToProtocol:@protocol(XIBDrawable)]) {
            [obj drawContextInRect:[obj frame]];
        }
    }];
}

@end

