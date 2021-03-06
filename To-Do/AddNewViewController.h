//
//  AddNewViewController.h
//  To-Do
//
//  Created by Chelsea Liu on 6/24/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddNewDelegate.h"

@interface AddNewViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *insertTitleTextfield;

@property (weak, nonatomic) IBOutlet UISegmentedControl *urgencyControl;

@property (weak, nonatomic) IBOutlet UITextView *insertDescriptTextfield;

@property (assign, nonatomic) id <AddNewDelegate> delegate;

@property (strong, nonatomic) NSString *priorityNumberLabel; 

- (void) modifyArrayInMaster;

@end
