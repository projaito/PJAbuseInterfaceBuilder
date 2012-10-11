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
@property (weak, nonatomic) IBOutlet id <PJAppearanceTextAttributePlaceholder> barButtonItemNormalTextAttribute;
@property (weak, nonatomic) IBOutlet id <PJAppearanceTextAttributePlaceholder> barButtonItemSelectedTextAttribute;

@property (weak, nonatomic) IBOutlet UITabBar *tabBar;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet id <PJAppearanceTextAttributePlaceholder> segmentedControlNormalTextAttribute;
@property (weak, nonatomic) IBOutlet id <PJAppearanceTextAttributePlaceholder> segmentedControlSelectedTextAttribute;

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

    // Configure all with placeholder first then actual container because
    // the use case is that if we are using placeholder objects, the original
    // appearance container can't config those properties.
    [self configureAppearance:self.barButtonItem usingPlaceholder:self.barButtonItemNormalTextAttribute controlState:UIControlStateNormal];
    [self configureAppearance:self.barButtonItem usingPlaceholder:self.barButtonItemSelectedTextAttribute controlState:UIControlStateSelected];
    [self configureAppearance:self.segmentedControl usingPlaceholder:self.segmentedControlNormalTextAttribute controlState:UIControlStateNormal];
    [self configureAppearance:self.segmentedControl usingPlaceholder:self.segmentedControlSelectedTextAttribute controlState:UIControlStateSelected];

    // Then finally configure with the actual container to override all
    // unexpected attributes set with placeholders
    [self configureAppearance:self.navigationBar];
    [self configureAppearance:self.barButtonItem];
    [self configureAppearance:self.tabBar];
    [self configureAppearance:self.segmentedControl];
}

- (void)configureAppearance:(id)container {
    [self configureAppearance:container usingPlaceholder:nil controlState:0];
}

- (void)configureAppearance:(id)container usingPlaceholder:(id)placeholder controlState:(UIControlState)state {
    
    id appearance = [[container class] appearance];
    if ( ! placeholder) {
        placeholder = container;
    }

    // UINavigationBar
    if ([container respondsToSelector:@selector(setTintColor:)] && [placeholder respondsToSelector:@selector(tintColor)]) {
        [appearance setTintColor:[placeholder tintColor]];
    }

    if ([container respondsToSelector:@selector(setTitleTextAttributes:forState:)] && [placeholder conformsToProtocol:@protocol(PJAppearanceTextAttributePlaceholder)]) {
        NSDictionary *textAttributes = [placeholder textAttributes];
        [appearance setTitleTextAttributes:textAttributes forState:state];
    }
}


@end
