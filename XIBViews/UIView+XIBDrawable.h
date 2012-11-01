//
//  UIView+XIBDrawable.h
//  PJAbuseInterfaceBuilderDemo
//
//  Created by james on 1/11/12.
//  Copyright (c) 2012 projaito. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XIBSpriteImageView;

@protocol XIBDrawable <NSObject>

- (void)drawContextInRect:(CGRect)rect;

@end


#pragma mark -

@interface UIView (XIBDrawable) <XIBDrawable>

@end

@interface UIImageView (XIBDrawable) <XIBDrawable>

@end

@interface UILabel (XIBDrawable) <XIBDrawable>

@end


#pragma mark -

@interface XIBBrush : UIImageView

@property (nonatomic, weak) IBOutlet UIImageView *sourceImageView;

@end


@interface XIBPatternBrush : XIBBrush

@end


@interface XIBSpriteBrush : UIImageView

@property (nonatomic, weak) IBOutlet XIBSpriteImageView *sourceImageView;
@property (nonatomic) CGPoint spritePosition;

@end

