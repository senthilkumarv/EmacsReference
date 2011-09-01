//
//  ERDataReader.h
//  EmacsReference
//
//  Created by Senthil Kumar Vijayakumar on 31/08/11.
//  Copyright (c) 2011 Wings. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ERCommand.h"
@interface ERDataReader : NSObject

-(NSArray *) readCommands;
-(NSArray *) readCategories;
- (id)initWithDatabaseFileName:(NSString *) value;

@end
