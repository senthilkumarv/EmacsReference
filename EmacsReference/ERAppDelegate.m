//
//  ERAppDelegate.m
//  EmacsReference
//
//  Created by Senthil Kumar Vijayakumar on 31/08/11.
//  Copyright (c) 2011 Wings. All rights reserved.
//

#import "ERAppDelegate.h"

@implementation ERAppDelegate

@synthesize window = _window;
@synthesize commands;
@synthesize categories;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    ERDataReader *rdr = [[ERDataReader alloc] initWithDatabaseFileName:@"emacs.db"];
    self.categories = [rdr readCategories];
    self.commands = [rdr readCommands];
    return YES;
}
							
@end
