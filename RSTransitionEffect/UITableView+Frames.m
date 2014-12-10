//
//  UITableView+Frames.m
//  RSTransitionEffect
//
//  Created by R0CKSTAR on 12/11/13.
//  Copyright (c) 2013 P.D.Q. All rights reserved.
//

#import "UITableView+Frames.h"
#import "RSCustomCell.h"

@implementation UITableView (Frames)

- (NSDictionary *)framesForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [self cellForRowAtIndexPath:indexPath];
//    CGRect cellFrameInTableView = [self rectForRowAtIndexPath:indexPath];
//    CGRect cellFrameInWindow = [self convertRect:cellFrameInTableView toView:[UIApplication sharedApplication].keyWindow];
//    
//    NSMutableDictionary *frames = [NSMutableDictionary dictionary];
//    
//    [frames setObject:[NSValue valueWithCGRect:cellFrameInWindow] forKey:@"cell"];
//    
//    [frames setObject:[NSValue valueWithCGRect:CGRectOffset(cell.imageView.frame, cellFrameInWindow.origin.x, cellFrameInWindow.origin.y)] forKey:@"imageView"];
//    
//    [frames setObject:[NSValue valueWithCGRect:CGRectOffset(cell.textLabel.frame, cellFrameInWindow.origin.x, cellFrameInWindow.origin.y)] forKey:@"textLabel"];
//    
//    [frames setObject:[NSValue valueWithCGRect:CGRectOffset(cell.detailTextLabel.frame, cellFrameInWindow.origin.x, cellFrameInWindow.origin.y)] forKey:@"detailTextLabel"];
//    
//    return [NSDictionary dictionaryWithDictionary:frames];
    
    RSCustomCell *cell = (RSCustomCell*)[self cellForRowAtIndexPath:indexPath];
    CGRect cellFrameInTableView = [self rectForRowAtIndexPath:indexPath];
    CGRect cellFrameInWindow = [self convertRect:cellFrameInTableView toView:[UIApplication sharedApplication].keyWindow];
    
    NSMutableDictionary *frames = [NSMutableDictionary dictionary];
    
    [frames setObject:[NSValue valueWithCGRect:cellFrameInWindow] forKey:@"cell"];
    


    [frames setObject:[NSValue valueWithCGRect:CGRectOffset(cell.rsImageView.frame, cellFrameInWindow.origin.x, cellFrameInWindow.origin.y)] forKey:@"imageView"];
    
    
    
    [frames setObject:[NSValue valueWithCGRect:CGRectOffset(cell.reTitle.frame, cellFrameInWindow.origin.x, cellFrameInWindow.origin.y)] forKey:@"textLabel"];
    
    [frames setObject:[NSValue valueWithCGRect:CGRectOffset(cell.rsDetail.frame, cellFrameInWindow.origin.x, cellFrameInWindow.origin.y)] forKey:@"detailTextLabel"];
    
   // NSLog(@"%@",frames);
    
    return [NSDictionary dictionaryWithDictionary:frames];

}

@end
