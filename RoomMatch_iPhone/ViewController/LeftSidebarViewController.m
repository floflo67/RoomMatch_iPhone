//
//  LeftSidebarViewController.m
//  RoomMatch_iPhone
//
//  Created by Florian Reiss on 11/08/13.
//  Copyright (c) 2013 Florian Reiss. All rights reserved.
//

#import "LeftSidebarViewController.h"

@interface LeftSidebarViewController ()
@property (nonatomic, strong) NSArray *objects;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic) NSInteger index;
@end

@implementation LeftSidebarViewController

#pragma mark - view life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.objects = @[@[@"profile"], @[@"search", @"filter"], @[@"see matches"], @[@"notification", @"create alert"]];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger countRows = [self.objects[section] count];
    if(countRows == 0)
        return 1;
    return countRows;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.objects count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title;
    switch (section) {
        case 0:
            title = @"Profile";
            break;
        case 1:
            title = @"Search";
            break;
        case 2:
            title = @"Matches";
            break;
        case 3:
            title = @"Notifications";
            break;
        default:
            break;
    }
    
    return title;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [self.objects[indexPath.section][indexPath.row] description];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"section: %i, row: %i", indexPath.section, indexPath.row);
}

#pragma mark - getter and setter

- (NSArray *)objects
{
    if(!_objects)
        _objects = [[NSArray alloc] init];
    return _objects;
}

@end
