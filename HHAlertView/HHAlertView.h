//
//  MrLoadingView.h
//  MrLoadingView
//
//  Created by ChenHao on 2/11/15.
//  Copyright (c) 2015 xxTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HHAlertButton)
{
    HHAlertButtonOk,
    HHAlertButtonCancel
};



typedef NS_ENUM(NSInteger, HHAlertStyle)
{
    HHAlertStyleDefault,
    HHAlertStyleOk,
    HHAlertStyleError,
    HHAlertStyleWraing,
};


@protocol HHAlertViewDelegate <NSObject>


@optional
/**
 *  the delegate to tell user whitch button is clicked
 *
 *  @param button button
 */
- (void)didClickButtonAnIndex:(HHAlertButton )button;

@end





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


+ (void)showAlertWithStyle:(HHAlertStyle )HHAlertStyle inView:(UIView *)view Title:(NSString *)title detail:(NSString *)detail cancelButton:(NSString *)cancel Okbutton:(NSString *)ok;


@property (nonatomic, weak) id<HHAlertViewDelegate> delegate;

@end
