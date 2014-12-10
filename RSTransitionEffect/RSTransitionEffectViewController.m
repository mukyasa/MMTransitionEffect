//
//  RSTransitionEffectViewController.m
//  RSTransitionEffect
//
//  Created by R0CKSTAR on 12/11/13.
//  Copyright (c) 2013 P.D.Q. All rights reserved.
//

#import "RSTransitionEffectViewController.h"

#import "RSBasicItem.h"
@interface RSTransitionEffectViewController ()

@property (nonatomic, strong) NSDictionary *targetFrames;

@property (nonatomic, strong) UIColor *backgroundColor;

- (void)__bindItem;

//- (void)__buildTargetFrames;
//
//- (void)__switchToSourceFrames:(BOOL)isSource;

@end

@implementation RSTransitionEffectViewController

#pragma mark - Private

- (void)__bindItem
{
//    self.imageView=[[UIImageView alloc] initWithFrame:CGRectMake(self.view.center.x-80, 30, 160, 160)];
//    [self.view addSubview:self.imageView];
    
   
    self.imageView.layer.cornerRadius = self.imageView.bounds.size.width / 2;
    self.imageView.clipsToBounds = YES;
    self.imageView.image = self.item.image;
    
    self.textLabel.text = self.item.text;
    [self.textLabel sizeToFit];
    self.detailTextLabel.text = self.item.detailText;
    [self.detailTextLabel sizeToFit];
}

- (void)__buildTargetFrames
{
    
    [self.imageView layoutIfNeeded];
    NSMutableDictionary *frames = [NSMutableDictionary dictionary];
    
    [frames setObject:[NSValue valueWithCGRect:self.cell.frame] forKey:@"cell"];
    
    
    [frames setObject:[NSValue valueWithCGRect:self.imageView.frame] forKey:@"imageView"];

    
    CGRect frame = self.textLabel.frame;
    frame.origin.x = roundf((self.view.bounds.size.width - frame.size.width) / 2.0f);
    [frames setObject:[NSValue valueWithCGRect:frame] forKey:@"textLabel"];
    
    frame = self.detailTextLabel.frame;
    frame.origin.x = roundf((self.view.bounds.size.width - frame.size.width) / 2.0f);
    [frames setObject:[NSValue valueWithCGRect:frame] forKey:@"detailTextLabel"];
    
    self.targetFrames = [NSDictionary dictionaryWithDictionary:frames];
}


#pragma mark - RSTransitionEffectViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
       
        UIWindow *window = [[UIApplication sharedApplication] keyWindow];
        UIGraphicsBeginImageContextWithOptions(window.bounds.size, YES, 0.0f);
        CGContextRef context = UIGraphicsGetCurrentContext();
        [window.layer renderInContext:context];
        self.backgroundColor = [UIColor colorWithPatternImage:UIGraphicsGetImageFromCurrentImageContext()];
        UIGraphicsEndImageContext();
        
        self.animationDuration = 1.0f;
       

        self.cellBackgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)__switchToCornerRadius:(BOOL)isSource
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    if(isSource){
        animation.fromValue = [NSNumber numberWithFloat:(160 / 2)];
        animation.toValue = [NSNumber numberWithFloat:80/ 2];
    }
    else{
        animation.fromValue = [NSNumber numberWithFloat:(80 / 2)];
        animation.toValue = [NSNumber numberWithFloat:160/ 2];
    }
   
    animation.duration = self.animationDuration;
    [self.imageView.layer addAnimation:animation forKey:@"cornerRadius"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
       self.backgroundView.backgroundColor = self.backgroundColor;
    

    self.cell.backgroundColor = self.cellBackgroundColor;
    
    [self __bindItem];
    
    [[self.view superview] layoutIfNeeded];

    [UIView animateWithDuration:self.animationDuration
                          delay:0.0
                        options:UIViewAnimationOptionLayoutSubviews

                        animations:^{
                           
                            self.imghoriz.constant=23;
                            self.texthoriz.constant=166;
                            self.detailtexthoriz.constant=166;
                            
                            self.imgheightconstraint.constant=80;
                            self.imgwidthconstraint.constant=80;
                            
                            self.toppaceimgconstraint.constant=[self.img floatValue]-20;//20 status bar
                            self.toptxtconstraint.constant=[self.txt floatValue]-20;
                            self.topdetailconstraint.constant=[self.det floatValue]-20;
                            self.bottomtoolbarconstrint.constant=-44;
                            
                            self.cellheightconstraint.constant=140;
                            self.celltopconstraint.constant=[self.cel floatValue];
                            [self __switchToCornerRadius:NO];
                            [[self.view superview] layoutIfNeeded];
                            
                        }
                     completion:^(BOOL finished){
                         
                         [UIView animateWithDuration:self.animationDuration   delay:0.0
                                             options:UIViewAnimationOptionLayoutSubviews
                                            animations:^{
                                                self.backgroundView.alpha = 0;
                                                self.imghoriz.constant=self.view.center.x-80;//80 width of img
                                                self.texthoriz.constant=self.view.center.x-40;//40 width of text
                                                self.detailtexthoriz.constant=self.view.center.x-40;//40 width of detail txt

                                                self.imgheightconstraint.constant=160;
                                                self.imgwidthconstraint.constant=160;
                                                
                                                self.toppaceimgconstraint.constant=30;
                                                self.toptxtconstraint.constant=210;
                                                self.topdetailconstraint.constant=240;
                                                
                                                self.bottomtoolbarconstrint.constant=0;
                                                self.cellheightconstraint.constant=290;
                                                self.celltopconstraint.constant=0;
                                                [[self.view superview] layoutIfNeeded];

                             }
                            completion:^(BOOL finished){
                                              
                               
                        }];

                         
                }];
    
   
    
  }



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)close:(id)sender
{
    [UIView animateWithDuration:self.animationDuration animations:^{
         [[self.view superview] layoutIfNeeded];
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:self.animationDuration animations:^{
                             self.cell.alpha = 0;
                             self.backgroundView.alpha=1;
                             self.imghoriz.constant=23;
                             self.texthoriz.constant=166;
                             self.detailtexthoriz.constant=166;
                             
                             self.imgheightconstraint.constant=80;
                             self.imgwidthconstraint.constant=80;
                             self.toppaceimgconstraint.constant=[self.img floatValue]-20;
                             
                             self.toptxtconstraint.constant=[self.txt floatValue]-20;
                             self.topdetailconstraint.constant=[self.det floatValue]-20;
                             
                             self.bottomtoolbarconstrint.constant=-44;
                             
                             self.cellheightconstraint.constant=140;
                             self.celltopconstraint.constant=[self.cel floatValue];
                             [self __switchToCornerRadius:YES];
                             [[self.view superview] layoutIfNeeded];

                            


                         } completion:^(BOOL finished) {
                             [[self.view superview] layoutIfNeeded];
                             [self.navigationController popViewControllerAnimated:NO];
                             
                         }];

                         
                     }];


}

@end
