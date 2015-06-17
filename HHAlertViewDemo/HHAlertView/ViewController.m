//
//  ViewController.m
//  HHAlertView
//
//  Created by ChenHao on 2/12/15.
//  Copyright (c) 2015 AEXAIR. All rights reserved.
//

#import "ViewController.h"
#import "HHAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)success:(id)sender {
    

   HHAlertView *alertview = [[HHAlertView alloc] initWithTitle:@"成功" detailText:@"dfdgdfddfdgdfddfdgdfddfdgdfddfdgdfddfdgdfddfdgdfd?" addView:self.view cancelButtonTitle:@"ddd" otherButtonTitles:nil];
    [alertview show];
}
- (IBAction)wraing:(id)sender {
    
}
- (IBAction)error:(id)sender {
  
}


@end
