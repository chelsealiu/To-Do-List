//
//  AddNewDelegate.h
//  To-Do
//
//  Created by Chelsea Liu on 6/24/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//



#import "ToDo.h"

@protocol AddNewDelegate <NSObject>

@required

- (void) addToArray: (ToDo *) toDo;

@end