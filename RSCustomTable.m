//
//  RSCustomTable.m
//  RSTransitionEffectSample
//
//  Created by mukesh mandora on 10/10/14.
//  Copyright (c) 2014 P.D.Q. All rights reserved.
//

#import "RSCustomTable.h"
#import "RSBasicItem.h"
#import "RSDetailViewController.h"
#import "UITableView+Frames.h"
#import "RSCustomCell.h"
@implementation RSCustomTable
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

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
   // [self scrollViewDidScroll:nil];
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
    static NSString *CellIdentifier = @"RSCell";
    RSCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if(cell==nil){
        cell=[[RSCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    RSBasicItem *item = [self.items objectAtIndex:[indexPath row]];
    
    cell.rsImageView.layer.cornerRadius = cell.rsImageView.frame.size.width / 2;
    cell.rsImageView.layer.masksToBounds=YES;
    cell.rsImageView.clipsToBounds = YES;
    cell.rsImageView.image = item.image;
    cell.reTitle.text = item.text;
    cell.rsDetail.text = item.detailText;
    
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
    
    

    viewController.img=[NSString stringWithFormat:@"%f",[[viewController.sourceFrames objectForKey:@"imageView"] CGRectValue].origin.y];
   
    NSLog(@"%f", [[viewController.sourceFrames objectForKey:@"textLabel"] CGRectValue].origin.y);
    viewController.txt=[NSString stringWithFormat:@"%f",[[viewController.sourceFrames objectForKey:@"textLabel"] CGRectValue].origin.y];
    viewController.det=[NSString stringWithFormat:@"%f",[[viewController.sourceFrames objectForKey:@"detailTextLabel"] CGRectValue].origin.y];
    viewController.cel=[NSString stringWithFormat:@"%f",[[viewController.sourceFrames objectForKey:@"cell"] CGRectValue].origin.y];
    
    [self.navigationController pushViewController:viewController animated:NO];
}

@end