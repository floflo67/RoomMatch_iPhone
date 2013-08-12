//
//  LeftSidebarViewController.h
//  RoomMatch_iPhone
//
//  Created by Florian Reiss on 11/08/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LeftSidebarViewControllerDelegate;

@interface LeftSidebarViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) id <LeftSidebarViewControllerDelegate> sidebarDelegate;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray* menuItem;
@property (nonatomic) NSInteger index;
@end

@protocol LeftSidebarViewControllerDelegate <NSObject>

-(void)sidebarViewController:(LeftSidebarViewController*)sidebarViewController didSelectObject:(NSObject*)object atIndexPath:(NSIndexPath*)indexPath;

@optional
-(NSIndexPath*)lastSelectedIndexPathForSidebarViewController:(LeftSidebarViewController*)sidebarViewController;

@end