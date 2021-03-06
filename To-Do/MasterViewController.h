//
//  MasterViewController.h
//  To-Do
//
//  Created by Chelsea Liu on 6/24/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddNewDelegate.h"

@interface MasterViewController : UITableViewController <AddNewDelegate>

@property NSMutableArray *objects; //cells in the tableView

@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeToMarkComplete;


@end

