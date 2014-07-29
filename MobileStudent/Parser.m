//
//  Parser.m
//  MobileStudent
//
//  Created by Olga on 30.06.14.
//  Copyright (c) 2014 Olga. All rights reserved.
//

#import "Parser.h"

@implementation Parser
//    NSXMLParser *parser;
//    NSMutableData *bordData;
//    NSMutableArray *news;
//    NSString * currentElement;
//    NSMutableString *currentTime;
//    NSMutableString *bordName;
//    NSMutableString *bordRoom;
//    NSMutableString *bordBuilding;
//    NSMutableString *bordTeacher;
//    NSMutableString *bordType;
@synthesize parser,bordData,news,currentTime,bordName,bordRoom,bordType,bordTeacher,bordBuilding,currentElement;





-(void)connectingToURL:(NSURLConnection *)connection {
    NSURL *url = [NSURL URLWithString:@"http://shelly.kpfu.ru/e-ksu/get_schedulle_aud?p_group_name=01-110"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url
                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                       timeoutInterval:60.0];
    NSURLConnection *conn =[[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (conn){
        //bordData = [NSData dataWithContentsOfURL:url];
        bordData = [[NSMutableData alloc] init];
        
    }
    else{
        NSLog(@"ERROR");
    }
    
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSMutableData *)data {
    [bordData appendData:data];
}





-init {
    if(self == [super init]) {
        NSString *result = [[NSString alloc] initWithData:bordData encoding:NSWindowsCP1251StringEncoding];
        bordData = [result dataUsingEncoding:NSUTF8StringEncoding];
        // NSLog(@"Data = %@",result);
        
        news = [[NSMutableArray alloc]init];
        parser = [[NSXMLParser alloc] initWithData:bordData];
        
        parser.delegate = self;
        [parser parse];
    }      
    return self;
}




- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Error = %@", error);
}


- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict  {
    
    
    currentElement = elementName;
    // NSLog(@"I use delegate. Current element: %@",elementName);
    if ([elementName isEqualToString:@"class"]) {
        currentTime = [[NSMutableString alloc]init];
        bordName = [[NSMutableString alloc]init];
        bordRoom = [[NSMutableString alloc]init];
        bordBuilding = [[NSMutableString alloc]init];
        bordTeacher = [[NSMutableString alloc]init];
        bordType = [[NSMutableString alloc]init];
        return;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    // NSLog(@"CURRENT ELEMENT OF FOUNDCHARACTERS IS: %@",currentElement);
    if ([currentElement isEqualToString:@"time"]) {
		[currentTime appendString:string];
        // NSLog(@"%@",currentTime);
	}
    if ([currentElement isEqualToString:@"name"]) {
		[bordName appendString:string];
        // NSLog(@"%@",bordName);
    }
    if ([currentElement isEqualToString:@"room"]) {
		[bordRoom appendString:string];
        //  NSLog(@"%@",bordRoom);
    }
    if ([currentElement isEqualToString:@"building"]) {
		[bordBuilding appendString:string];
        //  NSLog(@"%@",bordBuilding);
    }
    if ([currentElement isEqualToString:@"teacher"]) {
		[bordTeacher appendString:string];
        // NSLog(@"%@",bordTeacher);
    }
    if ([currentElement isEqualToString:@"type"]) {
		[bordType appendString:string];
        //  NSLog(@"%@",bordType);
    }
}


-(void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"class"]) {
        NSDictionary *newsItem = [NSDictionary dictionaryWithObjectsAndKeys:
                                  currentTime, @"time",
                                  bordName, @"name",
                                  bordRoom,@"room",
                                  bordBuilding,@"building",
                                  bordTeacher,@"teacher",
                                  bordType,@"type", nil];
        [news addObject:newsItem];
        NSLog(@"NEWS%@",news);
        currentTime = nil;
        bordName = nil;
        bordRoom = nil;
        bordBuilding = nil;
        bordTeacher = nil;
        bordType = nil;
        
        
        currentElement = nil;
        return;
    }
}


- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"%@", parseError);
}





@end
