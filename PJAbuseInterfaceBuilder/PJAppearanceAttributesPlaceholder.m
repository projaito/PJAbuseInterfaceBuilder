//
//  PJAppearanceAttributesPlaceholder.m
//  PJAbuseInterfaceBuilderDemo
//
//  Created by James Tang on 11/10/12.
//  Copyright (c) 2012 projaito. All rights reserved.
//

#import "PJAppearanceAttributesPlaceholder.h"


@implementation UILabel (PJAppearanceTextAttributePlaceholder)

- (NSDictionary *)textAttributes {
    NSDictionary *textAttributes = @{
    UITextAttributeFont : self.font,
    UITextAttributeTextColor : self.textColor,
    UITextAttributeTextShadowColor : self.shadowColor,
    UITextAttributeTextShadowOffset : [NSValue valueWithCGSize:self.shadowOffset],
    };

    return textAttributes;
}

@end