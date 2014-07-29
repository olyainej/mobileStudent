//
//  AddTaskControllerViewController.h
//  MobileStudent
//
//  Created by Olga on 02.07.14.
//  Copyright (c) 2014 Olga. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Task;
@interface AddTaskControllerViewController : UIViewController
@property (nonatomic, strong) Task* task;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UITextField *timeField;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextView *nameView;


@end
