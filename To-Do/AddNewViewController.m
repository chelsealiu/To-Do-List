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

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) modifyArrayInMaster {
    
    ToDo *toDo = [[ToDo alloc] init];
    toDo.titleX = self.insertTitleTextfield.text;
    toDo.taskDescription = self.insertDescriptTextfield.text;
    toDo.priorityNumber = self.insertPriorityTextfield.text;
    [self.delegate addToArray:toDo];
    
}


- (IBAction)doneButton:(id)sender {
    [self modifyArrayInMaster];

    [self dismissViewControllerAnimated:YES completion:nil];
    
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
