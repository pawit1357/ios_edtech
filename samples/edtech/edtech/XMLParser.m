//
//  XMLParser.m
//  edtech
//
//  Created by ShinPleZ on 10/23/56 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import "XMLParser.h"
#import "IndexData.h"

@implementation XMLParser
@synthesize dataContainer;
-(id)initParserXML:(NSString *)fileName
{
    self = [super init];
    if (self) {
        NSString *xmlPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"xml"];
        NSData *xmlData = [NSData dataWithContentsOfFile:xmlPath];
        parser = [[NSXMLParser alloc] initWithData:xmlData];
        parser.delegate = self;
        BOOL success = [parser parse];
        if (success) {
            NSLog(@"No Errors : XMLParser");
        }
        else
        {
            NSLog(@"Error XMLParser");
        }
    }
    return self;
}
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	NSString * errorString = [NSString stringWithFormat:@"Unable to download story feed from web site (Error code %i )", [parseError code]];
	NSLog(@"error parsing XML: %@", errorString);
	
	UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Error loading content" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[errorAlert show];
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"found this element: %@", elementName);
	currentElement = [elementName copy];
	if ([elementName isEqualToString:@"index"])
    {
        dataContainer = [[NSMutableArray alloc] init];
    }
    else if([elementName isEqualToString:@"chapter"]) {
        indexData = [[IndexData alloc] init];
        indexData.chapterId = [attributeDict objectForKey:@"id"];
        NSLog(@"attribute index = %@", indexData.chapterId);
    }
    else if([elementName isEqualToString:@"titles"]) {
        indexData.titleContainer = [[NSMutableArray alloc] init];
    }
    else if([elementName isEqualToString:@"title"]) {
        indexData.titleData = [[subData alloc] init];
        
    }
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"chapter"]) {
        [dataContainer addObject:indexData];
        indexData = nil;
    }
    else if ([elementName isEqualToString:@"name"]) {
        indexData.name = currentElementValue;
        NSLog(@"name = %@", indexData.name);
    }
    else if ([elementName isEqualToString:@"content"]) {
        indexData.content = currentElementValue;
        NSLog(@"content = %@", indexData.content);
    }
    else if ([elementName isEqualToString:@"titlename"]) {
        indexData.titleData.nameSub = currentElementValue;
        NSLog(@"nameSub = %@", indexData.titleData.nameSub);
    }
    else if ([elementName isEqualToString:@"titlecontent"]) {
        indexData.titleData.contentSub = currentElementValue;
        NSLog(@"contentSub = %@", indexData.titleData.contentSub);
    }
    else if ([elementName isEqualToString:@"title"]) {
        [indexData.titleContainer addObject:indexData.titleData];
        indexData.titleData = nil;
    }
    currentElementValue = nil;
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if(!currentElementValue)
    {
        currentElementValue = [[NSMutableString alloc] initWithString:string];
    }
    else [currentElementValue appendString:string];
    
    
}
@end
