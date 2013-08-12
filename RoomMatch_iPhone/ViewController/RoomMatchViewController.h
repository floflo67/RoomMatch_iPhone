//
//  RoomMatchViewController.h
//  RoomMatch_iPhone
//
//  Created by Florian Reiss on 11/08/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "JTRevealSidebarV2Delegate.h"
#import "LeftSidebarViewController.h"

@interface RoomMatchViewController : UIViewController <JTRevealSidebarV2Delegate, LeftSidebarViewControllerDelegate, MKMapViewDelegate>

@end
