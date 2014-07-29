//
//  AddLessonViewController.m
//  MobileStudent
//
//  Created by Olga on 01.07.14.
//  Copyright (c) 2014 Olga. All rights reserved.
//

#import "AddLessonViewController.h"
#import "AddingLesson.h"

@interface AddLessonViewController ()

@property (weak, nonatomic) IBOutlet UITextField *timeField;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UILabel *Time;
@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation AddLessonViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.doneButton) return;
    if (self.timeField.text.length > 0 && self.nameField.text.length>0) {
        self.lesson = [[AddingLesson alloc] init];
        self.lesson.time = self.timeField.text;
        self.lesson.lessonName = self.nameField.text;
      
    }
    
}

@end
