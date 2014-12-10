//
//  RSCustomCell.h
//  RSTransitionEffectSample
//
//  Created by mukesh mandora on 10/10/14.
//  Copyright (c) 2014 P.D.Q. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSCustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *rsImageView;
@property (weak, nonatomic) IBOutlet UILabel *reTitle;
@property (weak, nonatomic) IBOutlet UILabel *rsDetail;


- (void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view;

@end
