//
//  RSTableViewController.m
//  RSTransitionEffect
//
//  Created by R0CKSTAR on 12/11/13.
//  Copyright (c) 2013 P.D.Q. All rights reserved.
//

#import "RSTableViewController.h"

#import "UITableView+Frames.h"

#import "RSDetailViewController.h"

#import "RSBasicItem.h"

@interface RSTableViewController ()

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation RSTableViewController

- (NSMutableArray *)items
{
    if (!_items) {
        _items = [[NSMutableArray alloc] init];
    }
    return _items;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    @autoreleasepool {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"SampleData" ofType:@"plist"];
        NSArray *items = [[[NSDictionary alloc] initWithContentsOfFile:path] objectForKey:@"Data"];
        for (NSDictionary *dict in items) {
            RSBasicItem *item = [[RSBasicItem alloc] init];
            item.image = [UIImage imageNamed:[dict objectForKey:@"Image"]];
            item.text = [dict objectForKey:@"Place"];
            item.detailText = [dict objectForKey:@"Country"];
            [self.items addObject:item];
        }
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    RSBasicItem *item = [self.items objectAtIndex:[indexPath row]];
 
    cell.imageView.image = item.image;
    cell.textLabel.text = item.text;
    cell.detailTextLabel.text = item.detailText;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    RSDetailViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
    viewController.sourceFrames = [tableView framesForRowAtIndexPath:indexPath];
    viewController.item = [self.items objectAtIndex:[indexPath row]];
    viewController.animationDuration = 0.8f;
    [self.navigationController pushViewController:viewController animated:NO];
}

@end
