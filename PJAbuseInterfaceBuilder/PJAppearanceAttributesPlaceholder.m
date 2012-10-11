//
//  PJAppearanceAttributesPlaceholder.m
//  PJAbuseInterfaceBuilderDemo
//
//  Created by James Tang on 11/10/12.
//  Copyright (c) 2012 projaito. All rights reserved.
//

#import "PJAppearanceAttributesPlaceholder.h"


@implementation UIButton (PJAppearanceTextAttributePlaceholder)

- (NSDictionary *)textAttributes {
    NSDictionary *textAttributes = @{
    UITextAttributeFont : self.titleLabel.font,
    UITextAttributeTextColor : [self titleColorForState:self.state],
    UITextAttributeTextShadowColor : [self titleShadowColorForState:self.state],
    UITextAttributeTextShadowOffset : [NSValue valueWithCGSize:self.titleLabel.shadowOffset],
    };
    
    return textAttributes;
}

@end