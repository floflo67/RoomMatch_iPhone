//
//  RoomMatchViewController.m
//  RoomMatch_iPhone
//
//  Created by Florian Reiss on 11/08/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import "RoomMatchViewController.h"
#import <MapKit/MapKit.h>

@interface RoomMatchViewController () <LeftSidebarViewControllerDelegate, MKMapViewDelegate>
@property (nonatomic, weak) IBOutlet MKMapView *mapView;
@end

@implementation RoomMatchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    /*self.centerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.centerView];*/
    self.navigationItem.title = @"Room match";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ButtonMenuLeft.png"]
                                                                             style:UIBarButtonItemStyleBordered
                                                                            target:self
                                                                            action:@selector(revealLeftSidebar:)];    
    self.navigationItem.revealSidebarDelegate = self;
    self.mapView.region = [self setupMapView];
}

#pragma mark - MapView delegate

- (MKCoordinateRegion)setupMapView
{
    /*
     Define size of zoom
     */
    MKCoordinateSpan span;
    span.latitudeDelta = 0.02;
    span.longitudeDelta = 0.02;
    
    /*
     Define origin
     Center = location of venue
     */
    CLLocationCoordinate2D location;
    location.latitude = 37.78 ; // newLocation.coordinate.latitude;
    location.longitude = - 122.41;// newLocation.coordinate.longitude;
    
    MKCoordinateRegion region;
    region.span = span;
    region.center = location;
    
    return region;
}

#pragma mark - reveal side bars

- (void)revealLeftSidebar:(id)sender
{
    [self.navigationController toggleRevealState:JTRevealedStateLeft];
}

#pragma mark - JTRevealSidebarDelegate

// This is an examle to configure your sidebar view through a custom UITableViewController
- (UIView*)viewForLeftSidebar
{
    CGRect viewFrame = self.navigationController.applicationViewFrame;
    UIViewController *controller = self.leftSidebarViewController;
    if (!controller) {
        self.leftSidebarViewController = [[LeftSidebarViewController alloc] init];        
        self.leftSidebarViewController.sidebarDelegate = self;
        controller = self.leftSidebarViewController;
    }
    controller.view.frame = CGRectMake(0, viewFrame.origin.y - 5, 270, viewFrame.size.height + 5);
    //controller.view.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
    return controller.view;
}

// Optional delegate methods for additional configuration after reveal state changed
- (void)didChangeRevealedStateForViewController:(UIViewController*)viewController
{
    if (viewController.revealedState == JTRevealedStateNo) {
        self.view.userInteractionEnabled = YES;
    } else {
        self.view.userInteractionEnabled = NO;
    }
}

#pragma mark - SidebarViewControllerDelegate

- (void)sidebarViewController:(LeftSidebarViewController*)sidebarViewController didSelectObject:(NSObject*)object atIndexPath:(NSIndexPath*)indexPath
{
    [self.navigationController setRevealedState:JTRevealedStateNo];
}

- (NSIndexPath*)lastSelectedIndexPathForSidebarViewController:(LeftSidebarViewController*)sidebarViewController
{
    return self.leftSelectedIndexPath;
}

@end
