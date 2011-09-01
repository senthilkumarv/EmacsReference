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
int ERExecuteSelectCallback(void *a_param, int argc, char **argv, char **column);
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
    NSLog(@"%@", [self documentFilePath]);
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

-(NSArray *) executeSelectCommandOnTable: (NSString *) tableName andStorageClass: (id) object {
    NSMutableArray *list = [NSMutableArray array];
    return list;
    
}

-(NSArray *) readCategories {
    NSMutableArray *categories = [NSMutableArray array];
    return categories;
}
int ERExecuteSelectCallback(void *a_param, int argc, char **argv, char **column) {
    ERCommand *cmd = [[ERCommand alloc] init];
    cmd.commandId = atoi(argv[0]);
    cmd.text = [NSString stringWithUTF8String:argv[1]];
    cmd.key = [NSString stringWithUTF8String:argv[2]];
    [result addObject:cmd];
    sqlite3_close(db);
    return SQLITE_OK;
}

-(NSArray *) readCommands {
    result = [NSMutableArray array];
    if([self openDatabase]) {
        char *err = NULL;
        sqlite3_exec(db, "SELECT * FROM command", ERExecuteSelectCallback, NULL, &err);
        ERRCHECK
    }
    return result;
}

- (id)initWithDatabaseFileName:(NSString *) value {
    self = [super init];
    if (self) {
        self.fileName = value;
        [self setupDatabase];
    }
    return self;
}

-(void) dealloc {
    [self closeDatabase];
}

@end
