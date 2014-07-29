//
//  Bord.m
//  MobileStudent
//
//  Created by Olga on 23.07.14.
//  Copyright (c) 2014 Olga. All rights reserved.
//

#import "Bord.h"

@implementation Bord

+(instancetype)sharedInstance
{
    static id _singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [Bord new];
    });
    return _singleton;
}

-(id)init {
    self.news = [NSMutableArray new];
    return self;
}

@end
