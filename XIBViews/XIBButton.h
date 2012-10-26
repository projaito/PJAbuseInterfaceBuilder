//
//  XIBButton.h
//  PJAbuseInterfaceBuilderDemo
//
//  Created by james on 26/10/12.
//  Copyright (c) 2012 projaito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XIBButton : UIButton

@property (nonatomic, strong) IBOutlet UIImageView *selectedImageView;
@property (nonatomic, strong) IBOutlet UIImageView *normalImageView;
@property (nonatomic, strong) IBOutlet UIImageView *highlightedImageView;
@property (nonatomic, strong) IBOutlet UIImageView *disabledImageView;

@end
