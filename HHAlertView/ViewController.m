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
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)success:(id)sender {
    [HHAlertView showAlertWithStyle:HHAlertStyleOk inView:self.view Title:@"Success" detail:@"You are successful!" cancelButton:nil Okbutton:@"Sure"];
}
- (IBAction)wraing:(id)sender {
    [HHAlertView showAlertWithStyle:HHAlertStyleWraing inView:self.view Title:@"Wraing" detail:@"Are you sure?" cancelButton:@"No" Okbutton:@"Sure"];
}
- (IBAction)error:(id)sender {
    [HHAlertView showAlertWithStyle:HHAlertStyleError inView:self.view Title:@"Error" detail:@"Some thing must be error!" cancelButton:nil Okbutton:@"I konw"];
}

@end
