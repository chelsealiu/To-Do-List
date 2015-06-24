//
//  ToDo.h
//  To-Do
//
//  Created by Chelsea Liu on 6/24/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property (strong, nonatomic) NSString *titleX;
@property (strong, nonatomic) NSString *taskDescription;
@property (strong, nonatomic) NSString *priorityNumber;
@property (nonatomic) BOOL isCompleted;
@property (nonatomic, strong) NSMutableArray *allTasks; 




@end
