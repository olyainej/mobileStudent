//
//  Task.m
//  MobileStudent
//
//  Created by Olga on 02.07.14.
//  Copyright (c) 2014 Olga. All rights reserved.
//

#import "Task.h"

@implementation Task
- (void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeObject:self.title forKey:@"title"];
    [encoder encodeObject:self.desc forKey:@"desc"];
   
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        self.title = [decoder decodeObjectForKey:@"title"];
        self.desc = [decoder decodeObjectForKey:@"desc"];
       
    }
    return self;
}


@end
