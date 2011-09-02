//
//  ERDetailViewController.m
//  EmacsReference
//
//  Created by Senthil Kumar Vijayakumar on 31/08/11.
//  Copyright (c) 2011 Wings. All rights reserved.
//

#import "ERDetailViewController.h"


@implementation ERDetailViewController
@synthesize commands;

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"ShowDetails"]) {
        ERSearchDetailViewController *detail = [segue destinationViewController];
        ERTableDetailCell *cell = sender;
        detail.key = cell.commandKey.text;
        detail.purpose = cell.commandText.text;
    }
}

#pragma mark - View lifecycle

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [commands count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CommandCell";
    
    ERTableDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ERTableDetailCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    ERCommand *cmd = [commands objectAtIndex:indexPath.row];
    cell.commandText.text = [cmd.text capitalizedString];
    cell.commandKey.text = cmd.key;
    return cell;
}

#pragma mark - Table view delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.0f;
}
@end
