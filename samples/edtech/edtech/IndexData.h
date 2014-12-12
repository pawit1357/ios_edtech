//
//  IndexData.h
//  edtech
//
//  Created by ShinPleZ on 10/21/56 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "subData.h"
@interface IndexData : NSObject
{
    NSString *chapterId;
    NSString *name;
    NSString *content;
    subData *titleData;
    NSMutableArray *titleContainer;
}
@property (nonatomic, retain) NSString *chapterId;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) subData *titleData;
@property (nonatomic, retain) NSMutableArray *titleContainer;
@end
