//
//  TaskManager.h
//  MobileStudent
//
//  Created by Olga on 02.07.14.
//  Copyright (c) 2014 Olga. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

@interface TaskManager : NSObject
+ (instancetype)sharedInstance;
- (void)addTask:(Task*)task;
- (void)deleteTask:(Task*)task;
- (void)taskChanged:(Task*)task;

@property (nonatomic, strong, readonly) NSArray* tasks;
@end
