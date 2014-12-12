//
//  DataManagement.m
//  Ed. Tech
//
//  Created by icsnk on 7/13/14.
//  Copyright (c) 2014 ShinPleZ. All rights reserved.
//


#import "DataManagement.h"
#import "Questionary.h"
#import <CoreData/CoreData.h>

static DataManagement *_databaseManagement = nil;

@implementation DataManagement
@synthesize _context;
@synthesize questionList;

+(id)DatabaseManagement{
    @synchronized(self) {
        
        if (_databaseManagement == nil)
            _databaseManagement = [[self alloc] init];
    }
    return _databaseManagement;
}
- (id)init {
    
    if (self = [super init]) {
        
        
        
    }
    return self;
}


-(void)saveQuestion:(NSMutableDictionary*)_data{
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"TblQuestionary" inManagedObjectContext:_context];
    
    
    [fetchRequest setEntity:entity];
    
    Questionary *list = [NSEntityDescription insertNewObjectForEntityForName:@"TblQuestionary" inManagedObjectContext:_context];
    list.url = [_data objectForKey:@"url"];
    list.flag = [_data objectForKey:@"flag"];
    
    
    NSError *error;
    
    self.questionList = [[_context executeFetchRequest:fetchRequest error:&error] mutableCopy];
    
    NSLog(@"save list %d",[self.questionList count]);
    
    if (![_context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
    
    [fetchRequest release];
    
}

-(NSMutableArray*)getQuestionary{
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"TblQuestionary" inManagedObjectContext:_context];
    
    
    [fetchRequest setEntity:entity];
    
    
    
    
    NSError *error;
    
    self.questionList = [[_context executeFetchRequest:fetchRequest error:&error] mutableCopy];
    
    
    if (![_context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
    
    [fetchRequest release];
    
    
    return  self.questionList;
    
}

@end
