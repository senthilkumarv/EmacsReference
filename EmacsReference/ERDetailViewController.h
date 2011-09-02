//
//  ERDetailViewController.h
//  EmacsReference
//
//  Created by Senthil Kumar Vijayakumar on 31/08/11.
//  Copyright (c) 2011 Wings. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ERTableDetailCell.h"
#import "ERCommand.h"
#import "ERSearchDetailViewController.h"

@interface ERDetailViewController : UITableViewController {
    @private
    NSArray *commands;
}

@property(nonatomic, retain) NSArray *commands;

@end
