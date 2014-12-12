//
//  MediaData.h
//  edtech
//
//  Created by ShinPleZ on 10/23/56 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MediaData : NSObject
{
    NSString *mediaTitle;
    NSString *mediaDescription;
    NSString *mediaImage;
    NSString *mediaSource;
}
@property (nonatomic, retain) NSString *mediaTitle;
@property (nonatomic, retain) NSString *mediaDescription;
@property (nonatomic, retain) NSString *mediaImage;
@property (nonatomic, retain) NSString *mediaSource;

@end
