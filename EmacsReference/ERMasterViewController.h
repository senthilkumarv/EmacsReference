//
//  ERMasterViewController.h
//  EmacsReference
//
//  Created by Senthil Kumar Vijayakumar on 31/08/11.
//  Copyright (c) 2011 Wings. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ERDetailViewController;

@interface ERMasterViewController : UITableViewController

@property (strong, nonatomic) ERDetailViewController *detailViewController;

@end
