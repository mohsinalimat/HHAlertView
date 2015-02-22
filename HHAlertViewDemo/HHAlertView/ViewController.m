//
//  ViewController.m
//  HHAlertView
//
//  Created by ChenHao on 2/12/15.
//  Copyright (c) 2015 AEXAIR. All rights reserved.
//

#import "ViewController.h"
#import "HHAlertView.h"

@interface ViewController ()<HHAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //config the alertview
    [[HHAlertView shared] setDelegate:self];
}

- (IBAction)success:(id)sender {
    [HHAlertView showAlertWithStyle:HHAlertStyleOk inView:self.view Title:@"Success" detail:@"You are successful!" cancelButton:nil Okbutton:@"Sure" block:^(HHAlertButton buttonindex) {
        if (buttonindex == HHAlertButtonOk) {
            NSLog(@"ok Button is seleced use block");
        }
        else
        {
            NSLog(@"cancel Button is seleced use block");

        }
    }];
}
- (IBAction)wraing:(id)sender {
    [HHAlertView showAlertWithStyle:HHAlertStyleWraning inView:self.view Title:@"Wraing" detail:@"Are you sure?" cancelButton:@"No" Okbutton:@"Sure"];
}
- (IBAction)error:(id)sender {
    [HHAlertView showAlertWithStyle:HHAlertStyleError inView:self.view Title:@"Error" detail:@"Some thing must be error!" cancelButton:nil Okbutton:@"I konw"];
}

- (void)didClickButtonAnIndex:(HHAlertButton)button
{
    if (button == HHAlertButtonOk) {
        NSLog(@"ok Button is seleced use delegate");
    }
    else
    {
        NSLog(@"cancel Button is seleced use delegate");
        
    }
}

@end
