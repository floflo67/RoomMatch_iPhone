//
//  RoomMatchViewController.m
//  RoomMatch_iPhone
//
//  Created by Florian Reiss on 11/08/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import "RoomMatchViewController.h"
#import "UIViewController+JTRevealSidebarV2.h"
#import "UINavigationItem+JTRevealSidebarV2.h"

@interface RoomMatchViewController()
@property (nonatomic, weak) IBOutlet MKMapView *mapView;
@property (nonatomic, weak) NSIndexPath *leftSelectedIndexPath;
@property (nonatomic, strong) LeftSidebarViewController *leftSidebarViewController;
@end

@implementation RoomMatchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    self.navigationItem.title = @"Room match";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ButtonMenuLeft.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(revealLeftSidebar:)];    
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
    controller.view.frame = CGRectMake(0, viewFrame.origin.y, 270, viewFrame.size.height);
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
    if(self.leftSelectedIndexPath != sidebarViewController.selectedIndexPath)
        self.leftSelectedIndexPath = sidebarViewController.selectedIndexPath;
    return self.leftSelectedIndexPath;
}

#pragma mark - getter and setter

- (LeftSidebarViewController *)leftSidebarViewController
{
    if(!_leftSidebarViewController) {
        _leftSidebarViewController = [[LeftSidebarViewController alloc] init];
        _leftSidebarViewController.sidebarDelegate = self;
    }
    return _leftSidebarViewController;
}

@end
