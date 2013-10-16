//
//  itemCell.m
//  ToDo
//
//  Created by Mac Tyler on 10/13/13.
//  Copyright (c) 2013 Mac Tyler. All rights reserved.
//

#import "itemCell.h"
#import "ItemsViewController.h"

@implementation itemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _toDoItem.delegate = self.textFieldDelegate;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)EditToDo:(id)sender {
//    NSLog(@"Sup");
//    NSLog(@"%@", _toDoItem.text);
    
//    _toDoItem.text
//    [toDoArray replaceObjectAtIndex:selectedRow withObject:_toDoItem.text];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_toDoItem resignFirstResponder];
    return YES;
}

@end
