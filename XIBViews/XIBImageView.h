//
//  XIBImageView.h
//  PJAbuseInterfaceBuilderDemo
//
//  Created by james on 26/10/12.
//  Copyright (c) 2012 projaito. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XIBView.h"

@interface XIBImageView : UIImageView

// capInsets > capInsetsString > capInsetsView
@property (nonatomic) UIEdgeInsets capInsets;
@property (nonatomic, copy) NSString *capInsetsString;
@property (nonatomic, strong) IBOutlet UIView *capInsetsView;

@end


@interface XIBSpriteImageView : UIImageView

@property (nonatomic) CGSize spriteSize;

- (CGRect)rectAtPosition:(CGPoint)position;

- (CGPoint)spriteForTouchLocation:(CGPoint)touchLocation;

@end