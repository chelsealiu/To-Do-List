//
//  AddNewViewController.m
//  To-Do
//
//  Created by Chelsea Liu on 6/24/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import "AddNewViewController.h"
#import "ToDo.h"
#import "MasterViewController.h"


@interface AddNewViewController ()

@end

@implementation AddNewViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.priorityNumberLabel = @"(Low)";
    //low urgency by default; will only change if clicked on another segment
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)doneButton:(id)sender {
    [self modifyArrayInMaster];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (IBAction)urgencySegments:(UISegmentedControl *)sender {
    
    NSInteger selectedSegment = sender.selectedSegmentIndex;
    
    if (selectedSegment == 2) {
        self.priorityNumberLabel = @"(High)";
        
    } else if (selectedSegment == 1) {
        self.priorityNumberLabel = @"(Medium)";
    }
    else {
        self.priorityNumberLabel = @"(Low)";
        
    }

}

- (void) modifyArrayInMaster {
    
    ToDo *toDo = [[ToDo alloc] init];
    toDo.titleX = self.insertTitleTextfield.text;
    toDo.taskDescription = self.insertDescriptTextfield.text;
    toDo.priorityNumber = self.priorityNumberLabel;
    [self.delegate addToArray:toDo];
    
}

@end
