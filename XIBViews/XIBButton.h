//
//  XIBButton.h
//  PJAbuseInterfaceBuilderDemo
//
//  Created by james on 26/10/12.
//  Copyright (c) 2012 projaito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XIBButton : UIButton

@property (nonatomic, weak) IBOutlet UIImageView *backgroundImageHighlighted;
@property (nonatomic, weak) IBOutlet UIImageView *backgroundImageSelected;
@property (nonatomic, weak) IBOutlet UIImageView *backgroundImageNormal;
@property (nonatomic, weak) IBOutlet UIImageView *backgroundImageDisabled;
@property (nonatomic, weak) IBOutlet UIImageView *backgroundImageSelectedHighlighted;

@property (nonatomic, weak) IBOutlet UIImageView *imageSelectedHighlighted;

@property (nonatomic, strong) IBOutlet UIView *rectForContent;
@property (nonatomic, strong) IBOutlet UIView *rectForBackground;
@property (nonatomic, strong) IBOutlet UIView *rectForTitle;
@property (nonatomic, strong) IBOutlet UIView *rectForImage;

@property (nonatomic, assign) UIColor *selectedHighlightTextColor;
@property (nonatomic, assign) UIColor *selectedHighlightTextShadowColor;

@end
