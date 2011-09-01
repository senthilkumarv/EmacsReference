//
//  ERAppDelegate.h
//  EmacsReference
//
//  Created by Senthil Kumar Vijayakumar on 31/08/11.
//  Copyright (c) 2011 Wings. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ERDataReader.h"
@interface ERAppDelegate : UIResponder <UIApplicationDelegate> {
    @private
    NSArray *commands;
    NSArray *categories;
}
@property (strong, nonatomic) UIWindow *window;
@property(nonatomic, retain) NSArray *commands;
@property(nonatomic, retain) NSArray *categories;

@end
