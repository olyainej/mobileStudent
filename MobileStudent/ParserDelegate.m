//
//  ParserDelegate.m
//  MobileStudent
//
//  Created by Olga on 25.06.14.
//  Copyright (c) 2014 Olga. All rights reserved.
//

#import "ParserDelegate.h"




@implementation ParserDelegate
@synthesize done=m_done;
@synthesize titles=m_titles;
@synthesize error=m_error;



// документ начал парситься
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    m_done = NO;
    m_titles = [NSMutableArray new];
}
// парсинг окончен
- (void)parserDidEndDocument:(NSXMLParser *)parser {
    m_done = YES;
}


// встретили новый элемент
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    // проверяем, нашли ли мы элемент "title"
    m_isTitle = [[elementName lowercaseString] isEqualToString:@"title"];
    
    if ( m_isTitle ) {
        // если да - создаем строку в которую запишем его значение
        m_title = [NSMutableString new];
    }
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    // если элемент title закончился - добавим строку в результат
    if ( m_isTitle ) {
        [m_titles addObject:m_title];
        
    }
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    // если сейчас получаем значение элемента title
    // добавим часть его значения к строке
    if ( m_isTitle ) {
        [m_title appendString:string];
        NSLog(@"@",m_title);
    }
}

@end

