//
//  itemCell.h
//  ToDo
//
//  Created by Mac Tyler on 10/13/13.
//  Copyright (c) 2013 Mac Tyler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface itemCell : UITableViewCell
@property (nonatomic, retain) IBOutlet UITextField *toDoItem;
@property (nonatomic, weak) id <UITextFieldDelegate> textFieldDelegate;
- (IBAction)EditToDo:(id)sender;

@end
