//
//  ERSearchDetailViewController.h
//  EmacsReference
//
//  Created by Senthil Kumar Vijayakumar on 02/09/11.
//  Copyright (c) 2011 Wings. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ERSearchDetailViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableViewCell *keyCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *purposeCell;

@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) NSString *purpose;

@end
