//
//  ERSearchDetailViewController.m
//  EmacsReference
//
//  Created by Senthil Kumar Vijayakumar on 02/09/11.
//  Copyright (c) 2011 Wings. All rights reserved.
//

#import "ERSearchDetailViewController.h"


@implementation ERSearchDetailViewController
@synthesize keyCell;
@synthesize purposeCell;
@synthesize key;
@synthesize purpose;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.keyCell.textLabel.text = self.key;
    self.purposeCell.textLabel.text = self.purpose;
}

- (void)viewDidUnload
{
    [self setKeyCell:nil];
    [self setPurposeCell:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
