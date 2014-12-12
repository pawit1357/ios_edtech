//
//  Questionary.h
//  Ed. Tech
//
//  Created by icsnk on 7/13/14.
//  Copyright (c) 2014 ShinPleZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@interface Questionary : NSManagedObject

@property (nonatomic,retain) NSString * url;
@property (nonatomic,retain) NSString * flag;
@end
