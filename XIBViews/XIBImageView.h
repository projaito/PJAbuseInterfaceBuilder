//
//  XIBImageView.h
//  PJAbuseInterfaceBuilderDemo
//
//  Created by james on 26/10/12.
//  Copyright (c) 2012 projaito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XIBImageView : UIImageView

// capInsets > capInsetsString > capInsetsView
@property (nonatomic) UIEdgeInsets capInsets;
@property (nonatomic, copy) NSString *capInsetsString;
@property (nonatomic, strong) IBOutlet UIView *capInsetsView;

@end

