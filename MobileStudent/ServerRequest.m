//
//  ServerRequest.m
//  MobileStudent
//
//  Created by Olga on 25.06.14.
//  Copyright (c) 2014 Olga. All rights reserved.
//

#import "ServerRequest.h"

@implementation ServerRequest



+(NSMutableArray*) getUrlFromServer{
    
    
    NSURL *url = [NSURL URLWithString:@"http://shelly.kpfu.ru/e-ksu/get_schedulle_aud?p_group_name=11-201"];
    
    
    NSError *error = nil;
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSMutableArray *bordItems = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    
   NSLog(@"%@",bordItems);
    return bordItems;
    
    
}
@end
