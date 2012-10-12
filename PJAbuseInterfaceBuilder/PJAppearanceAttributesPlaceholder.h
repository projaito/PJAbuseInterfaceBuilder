//
//  PJAppearanceAttributesPlaceholder.h
//  PJAbuseInterfaceBuilderDemo
//
//  Created by James Tang on 11/10/12.
//  Copyright (c) 2012 projaito. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol PJAppearanceTextAttributePlaceholder <NSObject>

- (NSDictionary *)textAttributes;

@end

@interface UILabel (PJAppearanceTextAttributePlaceholder) <PJAppearanceTextAttributePlaceholder>

@end