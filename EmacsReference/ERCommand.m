//
//  ERCommand.m
//  EmacsReference
//
//  Created by Senthil Kumar Vijayakumar on 31/08/11.
//  Copyright (c) 2011 Wings. All rights reserved.
//

#import "ERCommand.h"

@implementation ERCommand
@synthesize commandId, text, key, category;

-(NSString *) description {
    return [NSString stringWithFormat:@"%d %@ %@ %d", self.commandId, self.text, self.key, self.category];
}

@end
