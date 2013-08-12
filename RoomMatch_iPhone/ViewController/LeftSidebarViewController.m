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

@end

@implementation LeftSidebarViewController

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
    
    return title;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - getter and setter

- (NSArray *)objects
{
    if(!_objects)
        _objects = [[NSArray alloc] init];
    return _objects;
}

@end
