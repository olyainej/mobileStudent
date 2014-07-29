//
//  Bord.h
//  MobileStudent
//
//  Created by Olga on 23.07.14.
//  Copyright (c) 2014 Olga. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bord : NSObject

+(instancetype)sharedInstance;
@property (nonatomic, strong) NSMutableArray *news;

@end
