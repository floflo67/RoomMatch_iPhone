//
//  RoomMatchAppDelegate.m
//  RoomMatch_iPhone
//
//  Created by Florian Reiss on 11/08/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import "RoomMatchAppDelegate.h"
#import "RoomMatchViewController.h"

@implementation RoomMatchAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
    
    // Override point for customization after application launch.
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark - getter and setter

- (UINavigationController *)navigationController
{
    if(!_navigationController)
        _navigationController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    return _navigationController;
}

- (RoomMatchViewController *)viewController
{
    if(!_viewController)
        _viewController = [[RoomMatchViewController alloc] initWithNibName:@"RoomMatchViewController" bundle:nil];
    return _viewController;
}

@end
