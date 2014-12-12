//
//  MediaParser.h
//  edtech
//
//  Created by ShinPleZ on 10/23/56 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MediaData;
@interface MediaParser : NSObject<NSXMLParserDelegate>
{
    NSXMLParser *parser;
    NSString *currentElement;
    NSMutableString *currentElementValue;
    NSMutableArray *dataContainer;
    MediaData *mediaData;
}
@property (nonatomic, retain) NSMutableArray *dataContainer;
-(id)initMediaParserXML:(NSString *)fileName;
@end
