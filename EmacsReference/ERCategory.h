//
//  ERCategory.h
//  EmacsReference
//
//  Created by Senthil Kumar Vijayakumar on 31/08/11.
//  Copyright (c) 2011 Wings. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ERCategory : NSObject {
    int categoryId;
    NSString *name;
}

@property(nonatomic) int categoryId;
@property(nonatomic, retain) NSString *name;

@end
