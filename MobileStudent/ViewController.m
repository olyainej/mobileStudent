//
//  ViewController.m
//  MobileStudent
//
//  Created by Olga on 25.06.14.
//  Copyright (c) 2014 Olga. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.label setText:@"NEWS"];;
    [self.tabBarItem setImage:[UIImage imageNamed:@"Копия New-iOS-7-Style-Tab-Bar-Icons.jpg"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
