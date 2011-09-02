//
//  ERMasterViewController.m
//  EmacsReference
//
//  Created by Senthil Kumar Vijayakumar on 31/08/11.
//  Copyright (c) 2011 Wings. All rights reserved.
//

#import "ERMasterViewController.h"

#import "ERDetailViewController.h"

@implementation ERMasterViewController

@synthesize detailViewController = _detailViewController;

NSArray *categories;

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ERAppDelegate *appDelegate = (ERAppDelegate *)[[UIApplication sharedApplication] delegate];
    if([[segue identifier] isEqualToString:@"ShowCommands"]) {
        ERDetailViewController *detailViewController = [segue destinationViewController];    
        UITableViewCell *cell = sender;
        NSPredicate *filter = [NSPredicate predicateWithFormat:@"category = %d", cell.tag];
        NSArray *result = [[appDelegate commands] filteredArrayUsingPredicate:filter];
        [detailViewController setCommands:result];
        return;
    }
    if([[segue identifier] isEqualToString:@"SearchCommands"]) {
        ERCommandSearchController *searchController = [segue destinationViewController];
        searchController.commands = appDelegate.commands;
        return;
    }    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    ERAppDelegate *appDelegate = (ERAppDelegate *)[[UIApplication sharedApplication] delegate];
    categories = [appDelegate categories];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [categories count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ERCategory *category = [categories objectAtIndex: indexPath.row];
    static NSString *CellIdentifier = @"CategoryCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.tag = [category categoryId];
    cell.textLabel.text = [category name];
    
    return cell;
}

@end
