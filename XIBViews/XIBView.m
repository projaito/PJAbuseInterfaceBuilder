//
//  XIBView.m
//  AnyHap
//
//  Created by james on 31/10/12.
//  Copyright (c) 2012 mystcolor. All rights reserved.
//

#import "XIBView.h"
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
