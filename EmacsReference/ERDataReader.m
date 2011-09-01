//
//  ERDataReader.m
//  EmacsReference
//
//  Created by Senthil Kumar Vijayakumar on 31/08/11.
//  Copyright (c) 2011 Wings. All rights reserved.
//

#import "ERDataReader.h"

@interface ERDataReader(){
@private
    NSString *fileName;
}
@property(nonatomic, retain) NSString *fileName;
@end

@implementation ERDataReader

sqlite3 *db;
NSMutableArray *result;
int ERReadCommandCallback(void *context, int count, char **value, char **column);
int ERReadCategoryCallback(void *context, int count, char **value, char **column);
@synthesize fileName;

-(NSString *) resourceFilePath {
    NSString *resPath = [[NSBundle mainBundle] resourcePath];
    return [resPath stringByAppendingPathComponent: self.fileName];
}

-(NSString *) documentFilePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent: fileName];
}

-(void) setupDatabase {
    NSFileManager *fm = [NSFileManager defaultManager];
    if([fm fileExistsAtPath:[self documentFilePath]]) {
        return;
    }
    [fm copyItemAtPath:[self resourceFilePath] toPath:[self documentFilePath] error:nil];
}

-(BOOL) openDatabase {
    if(db != NULL)
        return YES;
    int status = sqlite3_open([[self documentFilePath] UTF8String], &db);
    if(status == SQLITE_OK)
        return YES;
    db = NULL;
    return NO;
}

-(BOOL) closeDatabase {
    if(db == NULL)
        return YES;
    int status = sqlite3_close(db);
    if(status != SQLITE_OK)
        return NO;
    db = NULL;
    return YES;
}

-(NSArray *) readCategories {
    [result removeAllObjects];
    result = [NSMutableArray array];
    if([self openDatabase]) {
        char *err = NULL;
        sqlite3_exec(db, "SELECT * FROM category", ERReadCategoryCallback, NULL, &err);
        ERRCHECK
    }
    return [result copy];
}

int ERReadCategoryCallback(void *context, int count, char **value, char **column) {
    ERCategory *cat = [[ERCategory alloc] init];
    cat.categoryId = atoi(value[0]);
    cat.name = [NSString stringWithUTF8String:value[1]];
    [result addObject:cat];
    sqlite3_close(db);
    return SQLITE_OK;    
}

int ERReadCommandCallback(void *context, int count, char **value, char **column) {
    ERCommand *cmd = [[ERCommand alloc] init];
    cmd.commandId = atoi(value[0]);
    cmd.text = [NSString stringWithUTF8String:value[1]];
    cmd.key = [NSString stringWithUTF8String:value[2]];
    cmd.category = atoi(value[3]);
    [result addObject:cmd];
    sqlite3_close(db);
    return SQLITE_OK;
}

-(NSArray *) readCommands {
    [result removeAllObjects];
    if([self openDatabase]) {
        char *err = NULL;
        sqlite3_exec(db, "SELECT * FROM command", ERReadCommandCallback, NULL, &err);
        ERRCHECK
    }
    return [result copy];
}

- (id)initWithDatabaseFileName:(NSString *) value {
    self = [super init];
    if (self) {
        self.fileName = value;
        result = [NSMutableArray array];
        [self setupDatabase];
    }
    return self;
}

-(void) dealloc {
    [self closeDatabase];
}

@end
