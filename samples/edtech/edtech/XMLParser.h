//
//  XMLParser.h
//  edtech
//
//  Created by ShinPleZ on 10/23/56 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IndexData;
@interface XMLParser : NSObject<NSXMLParserDelegate>
{
    NSXMLParser *parser;
    NSString *currentElement;
    NSMutableString *currentElementValue;
    NSMutableArray *dataContainer;
    IndexData *indexData;
    
}
@property (nonatomic, retain) NSMutableArray *dataContainer;
-(id)initParserXML:(NSString *)fileName;
@end
