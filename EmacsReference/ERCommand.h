//
//  ERCommand.h
//  EmacsReference
//
//  Created by Senthil Kumar Vijayakumar on 31/08/11.
//  Copyright (c) 2011 Wings. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ERCategory.h"

@interface ERCommand : NSObject {
    int commandId;
    NSString *text;
    NSString *key;
   int category;
}

@property(nonatomic) int commandId;
@property(nonatomic, retain) NSString *text;
@property(nonatomic, retain) NSString *key;
@property(nonatomic) int category;

@end
