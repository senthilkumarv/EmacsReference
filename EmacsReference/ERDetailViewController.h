//
//  ERDetailViewController.h
//  EmacsReference
//
//  Created by Senthil Kumar Vijayakumar on 31/08/11.
//  Copyright (c) 2011 Wings. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ERDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
