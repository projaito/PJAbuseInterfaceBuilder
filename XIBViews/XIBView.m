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


@implementation XIBFlowLayoutView {
    CGRect _frame;
    CGRect _targetViewFrame;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _frame = self.frame;
    }
    return self;
}

- (void)awakeFromNib {
    self.frame = _frame;
    _targetViewFrame = self.targetView.frame;
    [self.targetView addObserver:self forKeyPath:self.keyPath options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self updateSize];
}

- (void)dealloc {
    [self.targetView removeObserver:self forKeyPath:self.keyPath];
}


- (void)updateSize {
    CGSize size = [self.targetView sizeThatFits:_targetViewFrame.size contentMode:self.targetView.contentMode];
    
    CGSize diffSize = CGSizeMake(self.targetView.frame.size.width - size.width, self.targetView.frame.size.height - size.height);
    
    CGRect bounds = (CGRect){
        CGPointZero,
        self.frame.size.width - diffSize.width,
        self.frame.size.height - diffSize.height,
    };

    self.bounds = CGRectIntegral(bounds);

}

#pragma mark Action

//- (IBAction)targetViewValueChanged:(id)sender {
//    [self updateSize];
//}

@end

@implementation UIView (FlowSize)

- (CGSize)sizeThatFits:(CGSize)size contentMode:(UIViewContentMode)contentMode {
    return [self sizeThatFits:size];
}

@end


@implementation UIImageView (FlowSize)

- (CGSize)sizeThatFits:(CGSize)size contentMode:(UIViewContentMode)contentMode {
    
    if (contentMode == UIViewContentModeScaleAspectFit) {
        return [self sizeThatAspectFits:size];
    } else if (contentMode == UIViewContentModeScaleAspectFill) {
        return [self sizeThatAspectFills:size];
    } else {
        return [super sizeThatFits:size contentMode:contentMode];
    }
}

- (CGSize)sizeThatAspectFits:(CGSize)size {
    UIImage *image = self.image;
    
    if ( ! image) {
        return CGSizeZero;
    }
    
    float imageRatio = image.size.width / image.size.height;
    
    float viewRatio = size.width / size.height;
    
    float width, height;
    if(imageRatio < viewRatio)
    {
        float scale = size.height / image.size.height;
        
        width = scale * image.size.width;
        height = size.height;
        
    } else {
        float scale = size.width / image.size.width;
        
        height = scale * image.size.height;
        width = size.width;
    }
    
    return CGSizeMake(width, height);
}

- (CGSize)sizeThatAspectFills:(CGSize)size {
    UIImage *image = self.image;
    
    if ( ! image) {
        return CGSizeZero;
    }

    float imageRatio = image.size.width / image.size.height;
    
    float viewRatio = size.width / size.height;
    
    float width, height;
    if(imageRatio > viewRatio)
    {
        float scale = size.height / image.size.height;
        
        width = scale * image.size.width;
        height = size.height;

    } else {
        float scale = size.width / image.size.width;
        
        height = scale * image.size.height;
        width = size.width;
    }
    
    return CGSizeMake(width, height);
}

@end
