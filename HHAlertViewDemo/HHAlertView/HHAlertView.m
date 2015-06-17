//
//  MrLoadingView.m
//  MrLoadingView
//
//  Created by ChenHao on 2/11/15.
//  Copyright (c) 2015 xxTeam. All rights reserved.
//

#import "HHAlertView.h"


#define OKBUTTON_BACKGROUND_COLOR [UIColor colorWithRed:158/255.0 green:214/255.0 blue:243/255.0 alpha:1]
#define CANCELBUTTON_BACKGROUND_COLOR [UIColor colorWithRed:255/255.0 green:20/255.0 blue:20/255.0 alpha:1]

#define SUCCESS_COLOR [UIColor colorWithRed:126/255.0 green:216/255.0 blue:33/255.0 alpha:1]


static const CGFloat HHALERTVIEW_WIDTH = 260;
static const CGFloat HHALERTVIEW_HEIGHT = 300;
static const CGFloat HHALERTVIEW_PADDING = 20;

static const CGFloat LOGOVIEW_SIZE      = 60;
static const CGFloat Simble_TOP      = 20;

static const CGFloat Button_SIZE_WIDTH        = 100;
static const CGFloat Buutton_SIZE_HEIGHT      = 30;



NSInteger const HHAlertview_SIZE_TITLE_FONT = 25;
NSInteger const HHAlertview_SIZE_DETAIL_FONT = 18;


static const CGFloat KDefaultRadius = 5.0;

@interface HHAlertView()

@property (nonatomic, strong) UILabel  *titleLabel;
@property (nonatomic, strong) UILabel  *detailLabel;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) NSArray  *ohherButtons;

@property (nonatomic, strong) UIView   *logoView;
@property (nonatomic, strong) UIView   *superView;//parant view
@property (nonatomic, strong) UIView   *maskView;
@property (nonatomic, strong) UIView   *mainAlertView; //main alert view




@end


@implementation HHAlertView

#pragma mark Lifecycle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.xOffset = 0.0;
        self.yOffset = 0.0;
        self.radius  = KDefaultRadius;
        
        
    }
    
    return self;
}


- (instancetype)initWithTitle:(NSString *)title
                   detailText:(NSString *)detailtext
                      addView:(UIView *)superView
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSArray *)otherButtonsTitles
{
    
    self = [self initWithFrame:superView.bounds];
    if (self) {
        self.superView = superView;
        self.titleText = title;
        self.detailText = detailtext;
        self.cancelButtonTitle = cancelButtonTitle;
        self.otherButtonTitles = otherButtonsTitles;
        [self layout];
        
    }
    return self;
}


#pragma mark UI

- (void)addView
{
    [self addSubview:self.maskView];
    [self addSubview:self.mainAlertView];
    self.logoView = [self getCheckmarkView];
    [self.mainAlertView addSubview:self.logoView];
    [self.mainAlertView addSubview:self.titleLabel];
    [self.mainAlertView addSubview:self.detailLabel];
}

- (void)setupLabel
{
    [self.titleLabel setText:self.titleText];
    [self.titleLabel sizeToFit];
    
    [self.detailLabel setText:self.detailText];
    [self.detailLabel setTextColor:[UIColor grayColor]];
    [self.detailLabel setFont:[UIFont systemFontOfSize:14]];
    [self.detailLabel setNumberOfLines:0];
    
}

- (void)setupButton
{
    if (self.cancelButtonTitle == nil && self.otherButtonTitles ==nil) {
        NSAssert(NO, @"error");
    }
    
    if (self.cancelButtonTitle != nil && self.otherButtonTitles ==nil) {
        self.cancelButton = [[UIButton alloc] init];
        [self.cancelButton setTitle:self.cancelButtonTitle forState:UIControlStateNormal];
        [self.cancelButton addTarget:self action:@selector(buttonTouch:) forControlEvents:UIControlEventTouchUpInside];
        [[self.cancelButton layer] setCornerRadius:4.0];
        [self.cancelButton setBackgroundColor:SUCCESS_COLOR];
        [self.mainAlertView addSubview:self.cancelButton];
    }
    
}

#pragma mark Layout

- (void)layout
{
    [self addView];
    [self setupLabel];
    [self setupButton];
    [self.superView addSubview:self];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.mainAlertView setBackgroundColor:[UIColor whiteColor]];
    [[self.mainAlertView layer] setCornerRadius:self.radius];
    
    //logoView frame
    CGPoint logoCenter =  CGPointMake(CGRectGetWidth(self.mainAlertView.frame)/2, HHALERTVIEW_PADDING+LOGOVIEW_SIZE/2);
    [self.logoView setCenter:logoCenter];
    
    //titleLabel frame
    CGPoint titleCenter = CGPointMake(CGRectGetWidth(self.mainAlertView.frame)/2, 20+CGRectGetHeight(self.titleLabel.frame)/2 + CGRectGetMaxY(self.logoView.frame));
    [self.titleLabel setCenter:titleCenter];
    
    //detailLabel frame
    [self.detailLabel setFrame:CGRectMake(0, 0, CGRectGetWidth(self.mainAlertView.frame)-HHALERTVIEW_PADDING*2, 0)];
    [self.detailLabel sizeToFit];
    
    CGPoint detailCenter = CGPointMake(CGRectGetWidth(self.mainAlertView.frame)/2, 10+CGRectGetHeight(self.detailLabel.frame)/2 + CGRectGetMaxY(self.titleLabel.frame));
    [self.detailLabel setCenter:detailCenter];
    
    if (self.cancelButtonTitle != nil && self.otherButtonTitles ==nil){
        CGRect buttonFrame = CGRectMake(0, 0, HHALERTVIEW_WIDTH - HHALERTVIEW_PADDING *2, 40);
        [self.cancelButton setFrame:buttonFrame];
        
        CGPoint buttonCenter = CGPointMake(CGRectGetWidth(self.mainAlertView.frame)/2, HHALERTVIEW_HEIGHT - HHALERTVIEW_PADDING - 20);
        [self.cancelButton setCenter:buttonCenter];
    }
    
    
    
}

#pragma mark Event Response

- (void)buttonTouch:(UIButton *)button
{
    [self hide];
}


#pragma mark show & hide 


- (void)show
{
    [self setAlpha:1];
}


- (void)hide
{
    [UIView animateWithDuration:0.5 animations:^{
        
        [self setAlpha:0];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

#pragma draw method

- (void)drawError
{
//    [_logoView removeFromSuperview];
//    _logoView = [[UIView alloc] initWithFrame:CGRectMake(([self getSelfSize].width-Simble_SIZE)/2, Simble_TOP, Simble_SIZE, Simble_SIZE)];
//    
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(Simble_SIZE/2, Simble_SIZE/2) radius:Simble_SIZE/2 startAngle:0 endAngle:M_PI*2 clockwise:YES];
//    
//    CGPoint p1 =  CGPointMake(Simble_SIZE/4, Simble_SIZE/4);
//    [path moveToPoint:p1];
//    
//    CGPoint p2 =  CGPointMake(Simble_SIZE/4*3, Simble_SIZE/4*3);
//    [path addLineToPoint:p2];
//    
//    CGPoint p3 =  CGPointMake(Simble_SIZE/4*3, Simble_SIZE/4);
//    [path moveToPoint:p3];
//    
//    CGPoint p4 =  CGPointMake(Simble_SIZE/4, Simble_SIZE/4*3);
//    [path addLineToPoint:p4];
//    
//    
//    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
//    layer.lineWidth = 5;
//    layer.path = path.CGPath;
//    layer.fillColor = [UIColor clearColor].CGColor;
//    layer.strokeColor = [UIColor redColor].CGColor;
//    
//    
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:NSStringFromSelector(@selector(strokeEnd))];
//    animation.fromValue = @0;
//    animation.toValue = @1;
//    animation.duration = 0.5;
//    [layer addAnimation:animation forKey:NSStringFromSelector(@selector(strokeEnd))];
//    
//    [_logoView.layer addSublayer:layer];
//    [self addSubview:_logoView];
}

- (UIView *)getCheckmarkView
{
    UIView *logoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LOGOVIEW_SIZE, LOGOVIEW_SIZE)];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(LOGOVIEW_SIZE/2, LOGOVIEW_SIZE/2) radius:LOGOVIEW_SIZE/2 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    
    [path moveToPoint:CGPointMake(LOGOVIEW_SIZE/4, LOGOVIEW_SIZE/2)];
    CGPoint p1 = CGPointMake(LOGOVIEW_SIZE/4+10, LOGOVIEW_SIZE/2+10);
    [path addLineToPoint:p1];
    
    
    CGPoint p2 = CGPointMake(LOGOVIEW_SIZE/4*3, LOGOVIEW_SIZE/4);
    [path addLineToPoint:p2];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.fillColor = [UIColor clearColor].CGColor;
    
    layer.strokeColor = SUCCESS_COLOR.CGColor;
    layer.lineWidth = 5;
    layer.path = path.CGPath;
    
    [logoView.layer addSublayer:layer];
    return logoView;
}

- (void)drawWraning
{
//    [_logoView removeFromSuperview];
//    _logoView = [[UIView alloc] initWithFrame:CGRectMake(([self getSelfSize].width-Simble_SIZE)/2, Simble_TOP, Simble_SIZE, Simble_SIZE)];
//    
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(Simble_SIZE/2, Simble_SIZE/2) radius:Simble_SIZE/2 startAngle:0 endAngle:M_PI*2 clockwise:YES];
//    path.lineCapStyle = kCGLineCapRound;
//    path.lineJoinStyle = kCGLineCapRound;
//    
//    [path moveToPoint:CGPointMake(Simble_SIZE/2, Simble_SIZE/6)];
//    CGPoint p1 = CGPointMake(Simble_SIZE/2, Simble_SIZE/6*3.8);
//    [path addLineToPoint:p1];
//    
//    [path moveToPoint:CGPointMake(Simble_SIZE/2, Simble_SIZE/6*4.5)];
//    [path addArcWithCenter:CGPointMake(Simble_SIZE/2, Simble_SIZE/6*4.5) radius:2 startAngle:0 endAngle:M_PI*2 clockwise:YES];
//    
//    
//    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
//    layer.fillColor = [UIColor clearColor].CGColor;
//    layer.strokeColor = [UIColor orangeColor].CGColor;
//    layer.lineWidth = 5;
//    layer.path = path.CGPath;
//    
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:NSStringFromSelector(@selector(strokeEnd))];
//    animation.fromValue = @0;
//    animation.toValue = @1;
//    animation.duration = 0.5;
//    [layer addAnimation:animation forKey:NSStringFromSelector(@selector(strokeEnd))];
//    
//    [_logoView.layer addSublayer:layer];
//    
//    [self addSubview:_logoView];
}


#pragma mark getter and setter

- (UIView *)maskView
{
    if (!_maskView) {
        _maskView = [[UIView alloc] initWithFrame:self.bounds];
        [_maskView setBackgroundColor:[UIColor blackColor]];
        [_maskView setAlpha:0.2];
    }
    return _maskView;
}

- (UIView *)mainAlertView
{
    if (!_mainAlertView) {
        _mainAlertView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HHALERTVIEW_WIDTH, HHALERTVIEW_HEIGHT)];
        [_mainAlertView setCenter:self.center];
    }
    return _mainAlertView;
}

- (UIView *)logoView
{
    if (!_logoView) {
        _logoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    }
    return _logoView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel
{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
    }
    return _detailLabel;
}

@end
