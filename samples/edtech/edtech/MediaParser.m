//
//  MediaParser.m
//  edtech
//
//  Created by ShinPleZ on 10/23/56 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import "MediaParser.h"
#import "MediaData.h"

@implementation MediaParser
@synthesize dataContainer;

-(id)initMediaParserXML:(NSString *)fileName
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
	if ([elementName isEqualToString:@"media"])
    {
        dataContainer = [[NSMutableArray alloc] init];
    }
    else if([elementName isEqualToString:@"clip"]) {
        mediaData = [[MediaData alloc] init];
    }

}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"clip"]) {
        [dataContainer addObject:mediaData];
        mediaData = nil;
    }
    else if ([elementName isEqualToString:@"title"]) {
        mediaData.mediaTitle = currentElementValue;
        //NSLog(@"mediaTitle = %@", mediaData.mediaTitle);
    }
    else if ([elementName isEqualToString:@"description"]) {
        mediaData.mediaDescription = currentElementValue;
        //NSLog(@"mediaDescription = %@", mediaData.mediaDescription);
    }
    else if ([elementName isEqualToString:@"image"]) {
        mediaData.mediaImage = currentElementValue;
        //NSLog(@"mediaImage = %@", mediaData.mediaImage);
    }
    else if ([elementName isEqualToString:@"source"]) {
        mediaData.mediaSource = currentElementValue;
        //NSLog(@"mediaSource = %@", mediaData.mediaSource);
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
