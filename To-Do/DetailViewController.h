//
//  DetailViewController.h
//  To-Do
//
//  Created by Chelsea Liu on 6/24/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableView.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *taskTitleDetail;
@property (weak, nonatomic) IBOutlet UILabel *taskSpecsDetail;
@property (weak, nonatomic) IBOutlet UILabel *taskCompletionDetail;

@property (strong, nonatomic) CustomTableView *customView;



@end

