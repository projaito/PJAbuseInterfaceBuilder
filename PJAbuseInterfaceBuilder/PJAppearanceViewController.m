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
@property (weak, nonatomic) IBOutlet UIButton *barButtonItemNormalTextAttribute;
@property (weak, nonatomic) IBOutlet UIButton *barButtonItemSelectedTextAttribute;

@property (weak, nonatomic) IBOutlet UITabBar *tabBar;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIButton *segmentedControlNormalTextAttribute;
@property (weak, nonatomic) IBOutlet UIButton *segmentedControlSelectedTextAttribute;

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
    [self configureAppearance:self.barButtonItem usingPlaceholder:self.barButtonItemNormalTextAttribute];
    [self configureAppearance:self.barButtonItem usingPlaceholder:self.barButtonItemSelectedTextAttribute];
    [self configureAppearance:self.segmentedControl usingPlaceholder:self.segmentedControlNormalTextAttribute];
    [self configureAppearance:self.segmentedControl usingPlaceholder:self.segmentedControlSelectedTextAttribute];

    // Then finally configure with the actual container to override all
    // unexpected attributes set with placeholders
    [self configureAppearance:self.navigationBar];
    [self configureAppearance:self.barButtonItem];
    [self configureAppearance:self.tabBar];
    [self configureAppearance:self.segmentedControl];
}

- (void)configureAppearance:(id)container {
    [self configureAppearance:container usingPlaceholder:nil];
}

- (void)configureAppearance:(id)container usingPlaceholder:(id)placeholder {
    
    id appearance = [[container class] appearance];
    if ( ! placeholder) {
        placeholder = container;
    }
    
    
    // UINavigationBar
    if ([container respondsToSelector:@selector(setTintColor:)]) {
        [appearance setTintColor:[placeholder tintColor]];
    }
    
    if ([container respondsToSelector:@selector(setTitleTextAttributes:forState:)] && [placeholder conformsToProtocol:@protocol(PJAppearanceTextAttributePlaceholder)]) {
        NSDictionary *textAttributes = [placeholder textAttributes];
        UIControlState controlState  = [placeholder state];
        [appearance setTitleTextAttributes:textAttributes forState:controlState];
    }
}



@end
