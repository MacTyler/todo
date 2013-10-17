//
//  ItemsViewController.m
//  ToDo
//
//  Created by Mac Tyler on 10/13/13.
//  Copyright (c) 2013 Mac Tyler. All rights reserved.
//

#import "ItemsViewController.h"
#import "itemCell.h"

@interface ItemsViewController ()

@property (strong, nonatomic) NSMutableArray *toDoArray;

@end

@implementation ItemsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.title = @"To Do List";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.opaque = NO;
    UINib *customNIB = [UINib nibWithNibName:@"itemCell" bundle:nil];
    
    self.clearsSelectionOnViewWillAppear = NO;
    
    [self.tableView registerNib:customNIB forCellReuseIdentifier:@"itemCell"];

    [self setNavigationBarButtonsToNormal];
    
    _toDoArray = [[NSMutableArray alloc] init];
    
    NSLog(@"array: %@", self.toDoArray);
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (void)setNavigationBarButtonsToNormal
{
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(Add:)];
}

- (void)setNavigationBarButtonsToAdding
{
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(Done:)];
}

- (void)setNavigationBarButtonsToEditing
{
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItem = nil;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [[self view] endEditing:YES];
}




//
//- (IBAction)addToDoItem:(id)sender {
//    [self.toDoArray  insertObject:@"hello" atIndex:0];
////    [self.toDoArray addObject:[NSString stringWithFormat:@"%@",self.toDoItem.text]];
//
//    [self.tableView reloadData];
//    NSLog(@"array: %@", self.toDoArray);
//}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_toDoArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"itemCell";
    
    itemCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    cell.toDoItem.text = [_toDoArray objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.toDoItem.delegate = self;
    return cell;
}

- (void)Add:(id)sender
{
    [_toDoArray insertObject:@"" atIndex:0];
    [self.tableView reloadData];
    
    itemCell *cell = (itemCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [cell.toDoItem setDelegate:self];
    [cell.toDoItem becomeFirstResponder];
    
    NSLog(@"Array: %@", _toDoArray);
}

- (void)Done:(id)sender
{
    [[self view] endEditing:YES];
    
    NSLog(@"Array: %@", _toDoArray);
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.toDoArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView endUpdates];
        NSLog(@"array: %@", self.toDoArray);
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSObject *object = [_toDoArray objectAtIndex:[fromIndexPath row]];
    [_toDoArray removeObjectAtIndex:[fromIndexPath row]];
    [_toDoArray insertObject:object atIndex:[toIndexPath row]];
    NSLog(@"Array: %@", _toDoArray);
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    itemCell *cell = (itemCell *)[[[textField superview] superview] superview];
    [cell becomeFirstResponder];
    
    [self setNavigationBarButtonsToAdding];
//    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    itemCell *cell = (itemCell *)[[[textField superview] superview] superview];
    UITableView *tableView =  (UITableView *)[[cell superview] superview];
    NSInteger index = [[tableView indexPathForCell:cell] row];
    
    [_toDoArray replaceObjectAtIndex:index withObject:textField.text];
    
    [self setNavigationBarButtonsToNormal];
}

#pragma mark UITableViewDelegate
- (void)tableView: (UITableView*)tableView willDisplayCell: (UITableViewCell*)cell forRowAtIndexPath: (NSIndexPath*)indexPath {
    
//    cell.backgroundColor = indexPath.row % 2
//    ? [UIColor colorWithRed: 0.0 green: 0.0 blue: 1.0 alpha: 1.0]
//    : [UIColor colorWithRed: 0.0 green: 0.0 blue: 1.0 alpha: 1.0];
    
    
    float blueColorGrade;
    float greenColorGrade;
    float redColorGrade;
    blueColorGrade = 1.0 - (indexPath.row * .05);
//    greenColorGrade = 0.1 - (indexPath.row * .1);
//    redColorGrade = (indexPath.row * .08);
    cell.backgroundColor = [UIColor colorWithRed: redColorGrade green: greenColorGrade blue: blueColorGrade alpha: 1.0];
    
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
}


- (void)cellColor {
//    itemCell *cell = (itemCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexForPathRow:0 inSection:0]];
    
//    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self Done:nil];
    
    return YES;
}
/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */
@end
