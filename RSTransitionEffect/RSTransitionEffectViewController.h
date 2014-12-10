//
//  RSTransitionEffectViewController.h
//  RSTransitionEffect
//
//  Created by R0CKSTAR on 12/11/13.
//  Copyright (c) 2013 P.D.Q. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RSBasicItem;

@interface RSTransitionEffectViewController : UIViewController

@property (nonatomic, strong) NSDictionary *sourceFrames;

@property (nonatomic, strong) RSBasicItem *item;

@property (nonatomic, assign) NSTimeInterval animationDuration;

@property (nonatomic, copy) UIColor *cellBackgroundColor;

#pragma mark - IB

@property (nonatomic, weak) IBOutlet UIView *cell;

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@property (nonatomic, weak) IBOutlet UILabel *textLabel;

@property (nonatomic, weak) IBOutlet UILabel *detailTextLabel;

@property (nonatomic, weak) IBOutlet UIView *backgroundView;

@property (nonatomic, weak) IBOutlet UIToolbar *toolbar;

- (IBAction)close:(id)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imghoriz;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *texthoriz;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *detailtexthoriz;


//img
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgheightconstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgwidthconstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toppaceimgconstraint;

//TEXT
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toptxtconstraint;


//DETAIL

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topdetailconstraint;

//TOOLBAR
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomtoolbarconstrint;

//CELL
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cellheightconstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *celltopconstraint;

@property(strong,nonatomic) NSString *img,*txt,*det,*cel;
@end
