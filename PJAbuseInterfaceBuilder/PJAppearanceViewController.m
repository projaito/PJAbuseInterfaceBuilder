//
//  JTAppearanceViewController.m
//  JTAbuseInterfaceBuilder
//
//  Created by james on 11/10/12.
//  Copyright (c) 2012 mystcolor. All rights reserved.
//

#import "PJAppearanceViewController.h"
#import "PJAppearanceAttributesPlaceholder.h"

@interface PJAppearanceViewController ()

@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonItem;
@property (weak, nonatomic) IBOutlet UILabel *barButtonItemTextAttributeNormal;
@property (weak, nonatomic) IBOutlet UILabel *barButtonItemTextAttributeHighlighted;
@property (weak, nonatomic) IBOutlet UIImageView *barButtonItemBackgroundImageNormal;
@property (weak, nonatomic) IBOutlet UIImageView *barButtonItemBackgroundImageHighlighted;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backBarButtonItem;
@property (weak, nonatomic) IBOutlet UIImageView *backBarButtonItemBackgroundImageNormal;
@property (weak, nonatomic) IBOutlet UIImageView *backBarButtonItemBackgroundImageHighlighted;

@property (weak, nonatomic) IBOutlet UITabBar *tabBar;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *segmentedControlTextAttributeNormal;
@property (weak, nonatomic) IBOutlet UILabel *segmentedControlTextAttributeHighlighted;

@end

@implementation PJAppearanceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // KISS
    
    // UISegmentedControl
    [[[self.segmentedControl class] appearance] setTitleTextAttributes:[self.segmentedControlTextAttributeNormal textAttributes] forState:UIControlStateNormal];
    [[[self.segmentedControl class] appearance] setTitleTextAttributes:[self.segmentedControlTextAttributeHighlighted textAttributes] forState:UIControlStateHighlighted];
    [[[self.segmentedControl class] appearance] setTintColor:self.segmentedControl.tintColor];

    // UIBarButtonItem
    [[[self.barButtonItem class] appearance] setTitleTextAttributes:[self.barButtonItemTextAttributeNormal textAttributes] forState:UIControlStateNormal];
    [[[self.barButtonItem class] appearance] setTitleTextAttributes:[self.barButtonItemTextAttributeHighlighted textAttributes] forState:UIControlStateHighlighted];
    [[[self.barButtonItem class] appearance] setTintColor:self.barButtonItem.tintColor];
    [[[self.barButtonItem class] appearance] setBackgroundImage:[self.barButtonItemBackgroundImageNormal resizableImage] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[[self.barButtonItem class] appearance] setBackgroundImage:[self.barButtonItemBackgroundImageHighlighted resizableImage] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
    [[[self.backBarButtonItem class] appearance] setBackButtonBackgroundImage:[self.backBarButtonItemBackgroundImageNormal resizableImage] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[[self.backBarButtonItem class] appearance] setBackButtonBackgroundImage:[self.backBarButtonItemBackgroundImageHighlighted resizableImage] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
    // UINavigationBar
    [[[self.navigationBar class] appearance] setTintColor:self.navigationBar.tintColor];
    
    // UITabBar
    [[[self.tabBar class] appearance] setTintColor:self.tabBar.tintColor];
}

- (void)viewDidUnload {
    [self setBackBarButtonItemBackgroundImageNormal:nil];
    [self setBackBarButtonItemBackgroundImageHighlighted:nil];
    [self setBackBarButtonItem:nil];
    [super viewDidUnload];
}
@end
