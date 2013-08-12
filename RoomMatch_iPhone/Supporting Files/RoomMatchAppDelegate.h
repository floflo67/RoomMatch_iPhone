//
//  RoomMatchAppDelegate.h
//  RoomMatch_iPhone
//
//  Created by Florian Reiss on 11/08/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RoomMatchViewController;

@interface RoomMatchAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) RoomMatchViewController *viewController;
@property (nonatomic, strong) UINavigationController *navigationController;

@end
