//
//  ViewController.m
//  DraggableTableView
//
//  Created by ling toby on 7/17/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController
NSMutableArray *toDoList;

- (void)viewDidLoad {
    
//1 set editing
    [self.tableView setEditing:TRUE animated:TRUE];
    [super viewDidLoad];
    toDoList = [[NSMutableArray alloc]initWithObjects:@"buy food",@"wash cars",@"cooking",@"clean the house", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [toDoList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.textLabel.text = toDoList[indexPath.row];
    
    return cell;
}


//-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    return UITableViewCellEditingStyleNone;
//}


//2. Set cell to no move
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) // Don't move the first row
        return NO;
    return YES;
}

//3. delegate. 移动表现动作。
- (NSIndexPath *)tableView:(UITableView *)tableView
targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath
       toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {
//    NSDictionary *section = [data objectAtIndex:sourceIndexPath.section];
//    NSUInteger sectionCount = [[section valueForKey:@"content"] count];
//    if (sourceIndexPath.section != proposedDestinationIndexPath.section) {
//        NSUInteger rowInSourceSection =
//        (sourceIndexPath.section > proposedDestinationIndexPath.section) ?
//        0 : sectionCount - 1;
//        return [NSIndexPath indexPathForRow:rowInSourceSection inSection:sourceIndexPath.section];
//    } else if (proposedDestinationIndexPath.row >= sectionCount) {
//        return [NSIndexPath indexPathForRow:sectionCount - 1 inSection:sourceIndexPath.section];
//    }
    // Allow the proposed destination.
    return proposedDestinationIndexPath;
}


//4.data source. Update datatsource
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    NSString *stringToMove = [toDoList objectAtIndex:sourceIndexPath.row];
    [toDoList removeObjectAtIndex:sourceIndexPath.row];
    [toDoList insertObject:stringToMove atIndex:destinationIndexPath.row];
}


@end
