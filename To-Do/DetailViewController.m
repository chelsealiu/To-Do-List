//
//  DetailViewController.m
//  To-Do
//
//  Created by Chelsea Liu on 6/24/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import "DetailViewController.h"
#import "ToDo.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        
        ToDo *item = (ToDo*)(self.detailItem);
        //casting
        
        self.taskTitleDetail.text = item.titleX;
        self.taskSpecsDetail.text = item.taskDescription;
        
        if (item.isCompleted == YES) {
            self.taskCompletionDetail.text = @"Completed!";
            self.taskCompletionDetail.backgroundColor = [UIColor greenColor];
        } else {
            self.taskCompletionDetail.text = @"Not completed";
            self.taskCompletionDetail.backgroundColor = [UIColor redColor];

        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
