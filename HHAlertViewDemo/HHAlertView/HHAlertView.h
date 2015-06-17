//
//  MrLoadingView.h
//  MrLoadingView
//
//  Created by ChenHao on 2/11/15.
//  Copyright (c) 2015 xxTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHAlertViewConst.h"
#import "UIView+Draw.h"

@protocol HHAlertViewDelegate;

/*
 * the style of the logo view
 */
typedef NS_ENUM(NSInteger, HHAlertViewMode){
    HHAlertViewModeSuccess,
    HHAlertViewModeError,
    HHAlertViewModeWarning,
    HHAlertViewModeDefault = HHAlertViewModeSuccess
};

typedef NS_ENUM(NSInteger, HHAlertEnterStyle){
    HHAlertEnterStyleCenter,
    

};
#if NS_BLOCKS_AVAILABLE

/**
 *  the block to tell user whitch button is clicked
 *
 *  @param button button
 */
typedef void (^selectButtonIndexComplete)(NSInteger index);

#endif



@interface HHAlertView : UIView


/**
 *  show a alert view with title detailTitle and at least one button
 *
 *  @param title              <#title description#>
 *  @param detailtext         <#detailtext description#>
 *  @param delegate           <#delegate description#>
 *  @param cancelButtonTitle  <#cancelButtonTitle description#>
 *  @param otherButtonsTitles <#otherButtonsTitles description#>
 *
 *  @return instance of alertview
 */
- (instancetype)initWithTitle:(NSString *)title
                   detailText:(NSString *)detailtext
                      addView:(UIView *)superView
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSArray  *)otherButtonsTitles;


/**
 *  dismiss the alertview
 */
- (void)hide;

- (void)show;


@property (nonatomic, weak)   id<HHAlertViewDelegate> delegate;

@property (nonatomic, copy)   selectButtonIndexComplete completeBlock;

@property (nonatomic, assign) HHAlertViewMode mode;

@property (nonatomic, copy)   NSString *titleText;

@property (nonatomic, copy)   NSString *detailText;

@property (nonatomic, strong) UIImage *customImage;

@property (nonatomic, assign) CGFloat xOffset;

@property (nonatomic, assign) CGFloat yOffset;

@property (nonatomic, assign) CGFloat radius;

@property (nonatomic, copy)   NSString  *cancelButtonTitle;

@property (nonatomic, strong) NSArray   *otherButtonTitles;

@end



@protocol HHAlertViewDelegate <NSObject>

@optional
/**
 *  the delegate to tell user whitch button is clicked
 *
 *  @param button button
 */
- (void)didClickButtonAnIndex:(NSInteger )buttonIndex;

@end

