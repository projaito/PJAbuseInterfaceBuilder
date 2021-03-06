//
//  PJAppearanceAttributesPlaceholder.m
//  PJAbuseInterfaceBuilderDemo
//
//  Created by James Tang on 11/10/12.
//  Copyright (c) 2012 projaito. All rights reserved.
//

#import "PJAppearanceAttributesPlaceholder.h"
#import <objc/runtime.h>

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

@implementation UIImageView (PJAppearanceAttributePlaceholder)

static char *resizableInsetKey;

- (void)setResizableInset:(NSString *)resizableInset {
    objc_setAssociatedObject(self, &resizableInsetKey, resizableInset, OBJC_ASSOCIATION_COPY);
}

- (NSString *)resizableInset {
    return objc_getAssociatedObject(self, &resizableInsetKey);
}

- (UIImage *)resizableImage {

    UIEdgeInsets inset = UIEdgeInsetsFromString(self.resizableInset);

    if (UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsetsZero, inset)) {
        return self.image;
    }

    UIImage *resizableImage = [self.image resizableImageWithCapInsets:inset];
    return resizableImage;
}

@end