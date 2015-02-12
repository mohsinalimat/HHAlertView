//
//  MrLoadingView.h
//  MrLoadingView
//
//  Created by ChenHao on 2/11/15.
//  Copyright (c) 2015 xxTeam. All rights reserved.
//

#import <UIKit/UIKit.h>




typedef NS_ENUM(NSInteger, MralertStyle)
{
    HHAlertStyleDefault,
    HHAlertStyleOk,
    HHAlertStyleError,
    HHAlertStyleWraing,
};


@interface HHAlertView : UIView

/**
 *  the singleton of the calss
 *
 *  @return the sington
 */
+ (instancetype)shared;

/**
 *  dismiss the alertview
 */
+ (void)Hide;


+ (void)showAlertWithStyle:(MralertStyle )MralertStyle inView:(UIView *)view Title:(NSString *)title detail:(NSString *)detail cancelButton:(NSString *)cancel Okbutton:(NSString *)ok;




@end
