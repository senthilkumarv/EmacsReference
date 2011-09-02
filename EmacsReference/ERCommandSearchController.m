//
//  ERCommandSearchController.m
//  EmacsReference
//
//  Created by Senthil Kumar Vijayakumar on 01/09/11.
//  Copyright (c) 2011 Wings. All rights reserved.
//

#import "ERCommandSearchController.h"


@implementation ERCommandSearchController

@synthesize resultTableController;
@synthesize commands;
@synthesize searchResults;

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ERSearchDetailViewController *sdvc = [segue destinationViewController];
    ERTableDetailCell *cell = sender;
    sdvc.key = cell.commandKey.text;
    sdvc.purpose = cell.commandText.text;
    return;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.searchResults = [NSMutableArray array];
    [self.searchResults addObjectsFromArray:self.commands];
    [self.searchDisplayController.searchResultsTableView setDelegate:self];
}

- (void)viewDidUnload
{
    [self setResultTableController:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.searchResults count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CommandCell";
    ERTableDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ERTableDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    ERCommand *cmd = [self.searchResults objectAtIndex:indexPath.row];
    cell.commandText.text = [cmd.text capitalizedString];
    cell.commandKey.text = cmd.key;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.0f;
}

- (void)filterContentForSearchText:(NSString*)searchText
{
    [self.searchResults removeAllObjects];
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"text contains[cd] %@ or key contains[cd] %@", searchText, searchText];
    [self.searchResults addObjectsFromArray: [self.commands filteredArrayUsingPredicate:resultPredicate]];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    self.searchDisplayController.searchResultsTableView.hidden = YES;
    [self filterContentForSearchText:searchText];
    [self.resultTableController reloadData];
    [self.searchDisplayController.searchResultsTableView reloadData];
}

@end
