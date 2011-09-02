//
//  ERCommandSearchController.h
//  EmacsReference
//
//  Created by Senthil Kumar Vijayakumar on 01/09/11.
//  Copyright (c) 2011 Wings. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ERCommand.h"
#import "ERTableDetailCell.h"
#import "ERSearchDetailViewController.h"

@interface ERCommandSearchController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate> {
    NSArray *commands;
    NSMutableArray *searchResults;
}

@property (strong, nonatomic) IBOutlet UITableView *resultTableController;
@property(nonatomic, retain) NSArray *commands;
@property (nonatomic, retain) NSMutableArray *searchResults;

@end
