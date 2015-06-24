//
//  MasterViewController.m
//  To-Do
//
//  Created by Chelsea Liu on 6/24/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDo.h"
#import "CustomTableView.h"
#import "AddNewViewController.h"

@interface MasterViewController ()


@property CustomTableView *customCell;
@property ToDo *toDo;

@end


@implementation MasterViewController


-(void)awakeFromNib {
    [super awakeFromNib];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.objects = [[NSMutableArray alloc] init];
    
    //can add more to description
    
    ToDo *groceryToDo = [[ToDo alloc] init];
    [self.objects addObject: groceryToDo];
    groceryToDo.titleX = @"Grocery List";
    groceryToDo.taskDescription = @"Nom nom nom nom nom";
    groceryToDo.priorityNumber = @"(1)";
    groceryToDo.isCompleted = NO;

    
    ToDo *lighthouseToDo = [[ToDo alloc] init];
    [self.objects addObject: lighthouseToDo];
    lighthouseToDo.titleX = @"Lighthouse To-Do";
    lighthouseToDo.taskDescription = @"All the assignments I still haven't finished :(";
    lighthouseToDo.priorityNumber = @"(2)";
    lighthouseToDo.isCompleted = NO;

    
    ToDo *homeToDo = [[ToDo alloc] init];
    [self.objects addObject: homeToDo];
    homeToDo.titleX = @"Home To-Do";
    homeToDo.taskDescription = @"Things to do at home.";
    homeToDo.priorityNumber = @"(3)";
    homeToDo.isCompleted = NO;

    ToDo *lifeToDo = [[ToDo alloc] init];
    [self.objects addObject: lifeToDo];
    lifeToDo.titleX = @"Life Goals";
    lifeToDo.taskDescription = @"Introspection and the meaning of life";
    lifeToDo.priorityNumber = @"(4)";
    lifeToDo.isCompleted = NO;
   
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    
    UISwipeGestureRecognizer *showExtrasSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(cellSwipe:)];
    showExtrasSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.tableView addGestureRecognizer:showExtrasSwipe];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self performSegueWithIdentifier: @"addNewSegue" sender:sender];
    //button press triggers segue to add new entry
}


#pragma mark - Segues

//response to tap, need an outlet for tableView?
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
        
    } else if ([[segue identifier] isEqualToString:@"addNewSegue"]) {
        AddNewViewController *newVC = [segue destinationViewController]; //auto alloc/init
        newVC.delegate = self;
   
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%lu", (unsigned long)self.objects.count);
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ToDo *item = [[ToDo alloc] init];
    NSUInteger index = [indexPath indexAtPosition:[indexPath length] - 1];
    item = self.objects[index];
    
    self.customCell = [[CustomTableView alloc] init];
    self.customCell = [tableView dequeueReusableCellWithIdentifier:@"TitleCell" forIndexPath:indexPath];
    self.customCell.titleLabel.text = item.titleX;
    self.customCell.descriptLabel.text = item.taskDescription;
    self.customCell.priorityLabel.text = item.priorityNumber;
    
    return self.customCell;
    
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {

    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
    }
}

-(void) addToArray: (ToDo *) toDo {
    
    [self.objects insertObject:toDo atIndex: 0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

    //receiving end of delegation from AddNewViewController to add a new cell

}

-(IBAction)cellSwipe:(UISwipeGestureRecognizer *)gesture
{
    
    CGPoint location = [gesture locationInView:self.tableView];
    NSIndexPath *swipedIndexPath = [self.tableView indexPathForRowAtPoint:location];
    UITableViewCell *swipedCell  = [self.tableView cellForRowAtIndexPath:swipedIndexPath];

    ToDo *tempToDo = [self.objects objectAtIndex:swipedIndexPath.row];
    tempToDo.isCompleted = YES;
    
    CustomTableView *tempCell = (CustomTableView *)swipedCell;
    
    NSAttributedString * titleString =
    [[NSAttributedString alloc] initWithString:tempToDo.titleX
                                    attributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle)}];
    
    [tempCell.titleLabel setAttributedText:titleString];
    
    NSAttributedString * descriptString =
    [[NSAttributedString alloc] initWithString:tempToDo.taskDescription
                                    attributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle)}];
    
    [tempCell.descriptLabel setAttributedText:descriptString];
    
    NSAttributedString * priorityString =
    [[NSAttributedString alloc] initWithString:tempToDo.priorityNumber
                                    attributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle)}];
    
    [tempCell.priorityLabel setAttributedText:priorityString];
    
}



@end
