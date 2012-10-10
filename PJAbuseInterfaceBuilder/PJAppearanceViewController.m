//
//  JTAppearanceViewController.m
//  JTAbuseInterfaceBuilder
//
//  Created by james on 11/10/12.
//  Copyright (c) 2012 mystcolor. All rights reserved.
//

#import "PJAppearanceViewController.h"

@interface PJAppearanceViewController ()
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonItem;
@property (weak, nonatomic) IBOutlet UITabBar *tabBar;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

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
    // Do any additional setup after loading the view from its nib.
    
    [self configureAppearance:self.navigationBar];
    [self configureAppearance:self.barButtonItem];
    [self configureAppearance:self.tabBar];
    [self configureAppearance:self.segmentedControl];
}

- (void)configureAppearance:(id)container {
    id appearance = [[container class] appearance];

    
    // UINavigationBar
    if ([container respondsToSelector:@selector(setTintColor:)]) {
        [appearance setTintColor:[container tintColor]];
    }

}



@end
