//
//  ItemsViewController.h
//  ToDo
//
//  Created by Mac Tyler on 10/13/13.
//  Copyright (c) 2013 Mac Tyler. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "itemCell.h"

@interface ItemsViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIBarButtonItem *addButton;
//@property (strong, nonatomic) NSMutableArray *toDoArray;
//- (IBAction)addToDoItem:(id)sender;

@end
