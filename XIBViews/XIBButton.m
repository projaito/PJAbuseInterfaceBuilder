//
//  XIBButton.m
//  PJAbuseInterfaceBuilderDemo
//
//  Created by james on 26/10/12.
//  Copyright (c) 2012 projaito. All rights reserved.
//

#import "XIBButton.h"

@implementation XIBButton

- (void)awakeFromNib {
    
    if (self.backgroundImageSelected.image) {
        [self setBackgroundImage:self.backgroundImageSelected.image forState:UIControlStateSelected];
    }

    if (self.backgroundImageNormal.image) {
        [self setBackgroundImage:self.backgroundImageNormal.image forState:UIControlStateNormal];
    }

    if (self.backgroundImageHighlighted.image) {
        [self setBackgroundImage:self.backgroundImageHighlighted.image forState:UIControlStateHighlighted];
    }
    
    if (self.backgroundImageDisabled.image) {
        [self setBackgroundImage:self.backgroundImageDisabled.image forState:UIControlStateDisabled];
    }

    if (self.backgroundImageSelectedHighlighted.image) {
        [self setBackgroundImage:self.backgroundImageSelectedHighlighted.image forState:UIControlStateHighlighted|UIControlStateSelected];
    }
    
    if (self.imageSelectedHighlighted.image) {
        [self setImage:self.imageSelectedHighlighted.image forState:UIControlStateHighlighted|UIControlStateSelected];
    }


    self.rectForTitle.hidden = YES;
    self.rectForBackground.hidden = YES;
    self.rectForContent.hidden = YES;
    self.rectForImage.hidden = YES;

    if ( self.selectedHighlightTextColor ) {
        [self setTitleColor:self.selectedHighlightTextColor forState:UIControlStateHighlighted | UIControlStateSelected];
    }
    if ( self.selectedHighlightTextShadowColor ) {
        [self setTitleShadowColor:self.selectedHighlightTextShadowColor forState:UIControlStateSelected | UIControlStateHighlighted];
    }
}

- (CGRect)contentRectForBounds:(CGRect)bounds {
    if (self.rectForContent) {
        return self.rectForContent.frame;
    }

    return [super contentRectForBounds:bounds];
}

- (CGRect)backgroundRectForBounds:(CGRect)bounds {
    if (self.rectForBackground) {
        return self.rectForBackground.frame;
    }
    
    return [super backgroundRectForBounds:bounds];
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    if (self.rectForTitle) {
        return self.rectForTitle.frame;
    }
    
    return [super titleRectForContentRect:contentRect];
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    if (self.rectForImage) {
        return self.rectForImage.frame;
    }

    return [super imageRectForContentRect:contentRect];
}

@end
