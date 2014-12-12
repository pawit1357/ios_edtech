//
//  QutionaryService.m
//  Ed. Tech
//
//  Created by icsnk on 7/13/14.
//  Copyright (c) 2014 ShinPleZ. All rights reserved.
//

#import "QutionaryService.h"
#import "Questionary.h"
#import "DataManagement.h"

@implementation QutionaryService


-(void)initial{
    
    
    NSString *path = @"http://muic-mlearning.net/itechservice/index.php/ServiceQuestionnaire/GetQuestion/app_id/19";
    
    
    NSString *escapedUrlString = (NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,  (CFStringRef)path, NULL, (CFStringRef)@" ", kCFStringEncodingUTF8);
    
    
    NSData *postData = [escapedUrlString dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:escapedUrlString]
                                                           cachePolicy:NSURLCacheStorageNotAllowed
                                                       timeoutInterval:300];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    
    if (theConnection) {
        JSONData = [[NSMutableData alloc] init];
        NSLog(@"theConnection %@",JSONData);
        [theConnection start];
    }
    else
    {
        NSLog( @"Connection is null.");
    }
    
}


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"didReceiveResponse");
    [JSONData setLength: 0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"didReceiveData");
    [JSONData appendData:data];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError");
    [connection release];
    [JSONData release];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    parser = [[NSXMLParser alloc]initWithData:JSONData];
    parser.delegate =self;
    [parser parse];
}

- (void) parser: (NSXMLParser*) parser parseErrorOccurred: (NSError *) parseError{
    
	NSString * errorString = [NSString stringWithFormat:@"Unable to download xml from web site (Error code %i )", [parseError code]];
	NSLog(@"error parsing XML: %@", errorString);
	
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
	
    
    currentElement = [elementName copy];
	if([elementName isEqualToString:@"item"]){
        
        NSLog(@"----- start parser update ------");
        
    }else if([elementName isEqualToString:@"url"]){
        
        _url = [[NSMutableString alloc]init];
    }
    
    
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    if([elementName isEqualToString:@"item"]){
        
        NSLog(@"path:%@",_url);
        
        Questionary *ques  = (Questionary*)[[[DataManagement DatabaseManagement] getQuestionary] lastObject];
        if ([ques.url isEqualToString:_url]) {
            
        }else{
            
            NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
            [dic setObject:_url forKey:@"url"];
            [dic setObject:@"N" forKey:@"flag"];
            [[DataManagement DatabaseManagement] saveQuestion:dic];
            NSLog(@"Update Questionary URL.");
        }
        NSLog(@"------- end parser update -------");
        
		return;
        
	}
}

-(NSString*)ReplaceFirstNewLine:(NSString *)original
{
    NSMutableString * newString = [NSMutableString stringWithString:original];
    
    NSRange foundRange = [original rangeOfString:@"\n"];
    if (foundRange.location != NSNotFound)
    {
        [newString replaceCharactersInRange:foundRange
                                 withString:@""];
    }
    return [[newString retain] autorelease];
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    if(![[string stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString: @""]){
        
        string = [self ReplaceFirstNewLine:string];
        
        if([currentElement isEqualToString:@"url"]){
            
            [_url setString:string];
            
        }
    }
}

@end
