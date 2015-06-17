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

}

- (IBAction)success:(id)sender {
    

   HHAlertView *alertview = [[HHAlertView alloc] initWithTitle:@"成功" detailText:@"恭喜你，操作顺利的实行了！\n换个行试试看效果" addView:self.view cancelButtonTitle:nil otherButtonTitles:@[@"确定"]];
    [alertview setEnterMode:HHAlertEnterModeTop];
    [alertview setLeaveMode:HHAlertLeaveModeBottom];
    [alertview showWithBlock:^(NSInteger index) {
        NSLog(@"%ld",index);
    }];
}
- (IBAction)wraing:(id)sender {
    HHAlertView *alertview = [[HHAlertView alloc] initWithTitle:@"警告" detailText:@"这可能导致你的iPhone出大事噢，确定要这样做嘛?" addView:self.view cancelButtonTitle:@"取消" otherButtonTitles:nil];
    alertview.mode = HHAlertViewModeWarning;
    [alertview setEnterMode:HHAlertEnterModeBottom];
    [alertview setDelegate:self];
    [alertview show];
    
}
- (IBAction)error:(id)sender {
    HHAlertView *alertview = [[HHAlertView alloc] initWithTitle:@"错误" detailText:@"发生了一个不可预知的错误，怎么办？要再试一试吗?" addView:self.view cancelButtonTitle:@"不要" otherButtonTitles:@[@"好的"]];
    alertview.mode = HHAlertViewModeError;
    [alertview show];
  
}
- (IBAction)custom:(id)sender {
    HHAlertView *alertview = [[HHAlertView alloc] initWithTitle:@"自定义View" detailText:@"这是一个自定义的view的样子?" addView:self.view cancelButtonTitle:@"噢" otherButtonTitles:nil];
    alertview.mode = HHAlertViewModeCustom;
    [alertview setCustomView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ff"]]];
    [alertview show];
    
}

- (void)HHAlertView:(HHAlertView *)alertview didClickButtonAnIndex:(NSInteger)buttonIndex

{
    NSLog(@"%ld",buttonIndex);
}


@end
