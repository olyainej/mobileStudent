//
//  ParserDelegate.h
//  MobileStudent
//
//  Created by Olga on 25.06.14.
//  Copyright (c) 2014 Olga. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParserDelegate : NSObject<NSXMLParserDelegate> {
    BOOL m_done;
    BOOL m_isTitle;
    NSError* m_error;
    NSMutableArray* m_titles;
    NSMutableString* m_title;
}
// свойство-флаг, который показывает закончен ли парсинг
@property (readonly) BOOL done;
// если есть ошибка - ее описание, если нет - nil
@property (readonly) NSError* error;
// результат парсинга
@property (readonly) NSArray* titles;

@end