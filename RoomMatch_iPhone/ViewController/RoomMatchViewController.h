//
//  RoomMatchViewController.h
//  RoomMatch_iPhone
//
//  Created by Florian Reiss on 11/08/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTRevealSidebarV2Delegate.h"
#import "LeftSidebarViewController.h"
#import "UIViewController+JTRevealSidebarV2.h"
#import "UINavigationItem+JTRevealSidebarV2.h"

@class LeftSidebarViewController;

@interface RoomMatchViewController : UIViewController <JTRevealSidebarV2Delegate>

@property (nonatomic, strong) LeftSidebarViewController *leftSidebarViewController;
@property (nonatomic, strong) UIView *centerView;
@property (nonatomic, strong) NSIndexPath *leftSelectedIndexPath;

@end
