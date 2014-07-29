//
//  Parser.h
//  MobileStudent
//
//  Created by Olga on 30.06.14.
//  Copyright (c) 2014 Olga. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Parser : NSObject <NSXMLParserDelegate>{
    NSXMLParser *parser;
    NSMutableData *bordData;
    NSMutableArray *news;
    NSString * currentElement;
    NSMutableString *currentTime;
    NSMutableString *bordName;
    NSMutableString *bordRoom;
    NSMutableString *bordBuilding;
    NSMutableString *bordTeacher;
    NSMutableString *bordType;
}
@property(nonatomic,retain) NSXMLParser *parser;
@property(nonatomic,retain) NSMutableData *bordData;
@property (nonatomic, retain) NSMutableArray *news;
@property (nonatomic, retain) NSString * currentElement;
@property (nonatomic, retain) NSMutableString *currentTime;
@property (nonatomic, retain) NSMutableString *bordName;
@property (nonatomic, retain) NSMutableString *bordRoom;
@property (nonatomic, retain) NSMutableString *bordBuilding;
@property (nonatomic, retain) NSMutableString *bordTeacher;
@property (nonatomic, retain) NSMutableString *bordType;



@end
