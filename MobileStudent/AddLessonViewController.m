//
//  AddLessonViewController.m
//  MobileStudent
//
//  Created by Olga on 23.07.14.
//  Copyright (c) 2014 Olga. All rights reserved.
//

#import "AddLessonViewController.h"
#import "Bord.h"

@interface AddLessonViewController () <UITextFieldDelegate, UITextViewDelegate>
{
    Bord *bord;
}
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextView *timeField;

@end

@implementation AddLessonViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    bord = [Bord sharedInstance];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    _a1 = textField.text;
}

-(void)textViewDidEndEditing:(UITextView *)textView {
    _a2 = textView.text;
}
- (IBAction)end:(id)sender {
    _exam = [NSDictionary dictionaryWithObjectsAndKeys:_a1, @"name",
             _a2, @"time", nil];
    [bord.news addObject:_exam];
}

@end
