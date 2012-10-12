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
@property (weak, nonatomic) IBOutlet UILabel *barButtonItemNormalTextAttribute;
@property (weak, nonatomic) IBOutlet UILabel *barButtonItemSelectedTextAttribute;

@property (weak, nonatomic) IBOutlet UITabBar *tabBar;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *segmentedControlNormalTextAttribute;
@property (weak, nonatomic) IBOutlet UILabel *segmentedControlSelectedTextAttribute;

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
    [[[self.segmentedControl class] appearance] setTitleTextAttributes:[self.segmentedControlNormalTextAttribute textAttributes] forState:UIControlStateNormal];
    [[[self.segmentedControl class] appearance] setTitleTextAttributes:[self.segmentedControlSelectedTextAttribute textAttributes] forState:UIControlStateSelected];
    [[[self.segmentedControl class] appearance] setTintColor:self.segmentedControl.tintColor];

    // UIBarButtonItem
    [[[self.barButtonItem class] appearance] setTitleTextAttributes:[self.barButtonItemNormalTextAttribute textAttributes] forState:UIControlStateNormal];
    [[[self.barButtonItem class] appearance] setTitleTextAttributes:[self.barButtonItemSelectedTextAttribute textAttributes] forState:UIControlStateSelected];
    [[[self.barButtonItem class] appearance] setTintColor:self.barButtonItem.tintColor];

    // UINavigationBar
    [[[self.navigationBar class] appearance] setTintColor:self.navigationBar.tintColor];
    
    // UITabBar
    [[[self.tabBar class] appearance] setTintColor:self.tabBar.tintColor];
}

@end
