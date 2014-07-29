//
//  AddTaskControllerViewController.m
//  MobileStudent
//
//  Created by Olga on 02.07.14.
//  Copyright (c) 2014 Olga. All rights reserved.
//

#import "AddTaskControllerViewController.h"
#import "Task.h"
#import "TaskManager.h"

@interface AddTaskControllerViewController ()<UITextFieldDelegate, UITextViewDelegate>
@end

@implementation AddTaskControllerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //заполняем данными из Task
    //у кнопок есть свойство selected, оно тут  пригодится
    [_timeField setText:[_task title]];
    [_nameView setText:[_task desc]];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    
    [_task setTitle:textField.text];
    
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    [_task setDesc:textView.text];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //выходим из режима редактирования
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    //выходим из режима редактирования
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
