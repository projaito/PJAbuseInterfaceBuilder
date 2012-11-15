//
//  XIBView.h
//  AnyHap
//
//  Created by james on 31/10/12.
//  Copyright (c) 2012 mystcolor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+XIBDrawable.h"


@interface XIBView : UIView

@property (nonatomic) BOOL defaultShadowsEnabled;
@property (nonatomic) BOOL useBoundsForShadowPath;

@end

@interface XIBDrawRectView : UIView

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *drawAsPatternImageViews;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *drawInRectImageViews;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *drawAtPointImageViews;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *drawableViews;    // UIView <XIBDrawable>

@end


@interface XIBFlowLayoutView : UIView

@property (weak, nonatomic) IBOutlet UIView *targetView;
@property (copy, nonatomic) NSString *keyPath;

//- (IBAction)targetViewValueChanged:(id)sender;

@end


@interface UIView (FlowSize)

- (CGSize)sizeThatFits:(CGSize)size contentMode:(UIViewContentMode)contentMode;

@end