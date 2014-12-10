//
//  RSCustomCell.m
//  RSTransitionEffectSample
//
//  Created by mukesh mandora on 10/10/14.
//  Copyright (c) 2014 P.D.Q. All rights reserved.
//

#import "RSCustomCell.h"

@implementation RSCustomCell
- (void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view
{
    CGRect rectInSuperview = [tableView convertRect:self.frame toView:view];
    
    float distanceFromCenter = CGRectGetHeight(view.frame)/2 - CGRectGetMinY(rectInSuperview);
    float difference = CGRectGetHeight(self.rsImageView.frame) - CGRectGetHeight(self.frame);
    float move = (distanceFromCenter / CGRectGetHeight(view.frame)) * difference;
    
    CGRect imageRect = self.rsImageView.frame;
    imageRect.origin.y = -(difference/2)+move;
    self.rsImageView.frame = imageRect;
}
@end
