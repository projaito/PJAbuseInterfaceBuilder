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
    
    if (self.selectedImageView.image) {
        [self setBackgroundImage:self.selectedImageView.image forState:UIControlStateSelected];
    }

    if (self.normalImageView.image) {
        [self setBackgroundImage:self.normalImageView.image forState:UIControlStateNormal];
    }

    if (self.highlightedImageView.image) {
        [self setBackgroundImage:self.highlightedImageView.image forState:UIControlStateHighlighted];
    }
    
    if (self.disabledImageView.image) {
        [self setBackgroundImage:self.disabledImageView.image forState:UIControlStateDisabled];
    }
}


@end
