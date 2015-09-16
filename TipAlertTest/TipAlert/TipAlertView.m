//
//  TipAlertView.m
//  ecmc
//
//  Created by akring on 15/9/16.
//  Copyright © 2015年 cp9. All rights reserved.
//

#import "TipAlertView.h"
#import <QuartzCore/QuartzCore.h>
#import "closeButton.h"

#define CONTEXT_FONT [UIFont systemFontOfSize:15]
#define ALERT_WIDTH 241
#define TITLE_VIEW_BG_COLOR @"e8e8e8"
#define TITLE_LABEL_COLOR @"184c85"
#define ALERT_CONTEXT_COLOR @"686868"

@interface TipAlertView(){
    
    CGSize alertSize;/**< Alert的尺寸 */
}

@end

@implementation TipAlertView

- (id)initWithMessage:(NSString *)message image:(UIImage *)image buttonTitles:(NSArray *)btnArr
{
    //    UIWindow *alertWindow = [[UIApplication sharedApplication] keyWindow];
    //    CGRect rect = alertWindow.bounds;
    CGRect rect = CGRectMake(0, 0, CGRectGetWidth([[UIScreen mainScreen] applicationFrame]), CGRectGetHeight([[UIScreen mainScreen] applicationFrame])+20);
    
    if (self = [super initWithFrame:rect])
    {
        btnTitleArr = btnArr;
        self.backgroundColor = [UIColor clearColor];
        
        UIView *bgView = [[UIView alloc]initWithFrame:rect];
        bgView.backgroundColor = [UIColor blackColor];
        bgView.alpha = 0.8f;
        [self addSubview:bgView];
        
        topImage = image;
        contextStr = message;
        alertSize = CGSizeMake(rect.size.width-60, (rect.size.width-60)*1.0);
        alignment = NSTextAlignmentCenter;

    }
    
    return self;
}

#pragma mark -创建组件
/**
 *  创建Alert体
 */
- (void)addAlertImages
{
    CGRect rect;
    
    rect = CGRectMake(0, 0, alertSize.width, alertSize.height);
    
    _bgImageView = [[UIImageView alloc]init];
    _bgImageView.backgroundColor = [UIColor whiteColor];
    _bgImageView.frame = rect;
    _bgImageView.userInteractionEnabled = YES;
    _bgImageView.layer.masksToBounds = YES;
    _bgImageView.layer.cornerRadius = 10;
    _bgImageView.layer.borderColor = [[UIColor colorWithWhite:0.147 alpha:1.000] CGColor];
    _bgImageView.layer.borderWidth = 1;
    [self addSubview:_bgImageView];
    
    rect = CGRectMake(0, 0, alertSize.width, alertSize.width/2.2);
    UIImageView *ttImageView = [[UIImageView alloc]init];
    if (topImage != nil) {
        ttImageView.image = topImage;
    }
    ttImageView.backgroundColor = [UIColor whiteColor];
    ttImageView.frame = rect;
    [_bgImageView addSubview:ttImageView];
    
}

/**
 *  创建文字Label
 */
- (void)addAlertLabels
{
    CGRect rect;
    
    //19开始，宽220
    CGFloat width = alertSize.width-60;
    rect = CGRectMake((CGRectGetWidth(_bgImageView.frame)-width)/2, alertSize.width/2.2, width, alertSize.width/3);
    self.contextLabel = [[UILabel alloc]initWithFrame:rect];
    self.contextLabel.backgroundColor = [UIColor clearColor];
    self.contextLabel.textAlignment = alignment;
    self.contextLabel.textColor = [UIColor blackColor];
    self.contextLabel.font = [UIFont systemFontOfSize:15];
    self.contextLabel.numberOfLines = 3;
    self.contextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.contextLabel.text = contextStr;
    [_bgImageView addSubview:self.contextLabel];
    
    _bgImageView.center = self.center;
}

/**
 *  创建关闭按钮
 */
- (void)addCloseBtn
{
    UIButton *btn = [closeButton buttonWithType:UIButtonTypeSystem];
    [btn addTarget:self action:@selector(dismissAnimation) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(CGRectGetMaxX(_bgImageView.frame)-18, CGRectGetMinY(_bgImageView.frame)-10, 26, 26);
    [self addSubview:btn];
}

- (void)addAlertButtons
{
    //button height 38
    for (NSInteger i=0; i<btnTitleArr.count; i++)
    {
        if(btnTitleArr.count == 2)
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.layer.masksToBounds = YES;
            btn.layer.cornerRadius = 4;
            [btn setTitle:[btnTitleArr objectAtIndex:i] forState:UIControlStateNormal];
            [btn.titleLabel setFont:[UIFont systemFontOfSize:15]];
            [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            float offset = (CGRectGetWidth(_bgImageView.frame)-120*2)/3;
            btn.frame = CGRectMake(offset*(i+1)+120*i, CGRectGetHeight(_bgImageView.frame)-50, 120, 38);
            
            
            btn.tag = i;
            if (i == 0)//拒绝按钮
            {
                btn.layer.borderWidth = 1.0f;
                btn.layer.borderColor = [[UIColor colorWithWhite:0.8 alpha:1.000] CGColor];
                [btn setBackgroundColor:[self getColor:@"F4F3F3"]];
                [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            }
            else//同意按钮
            {
                [btn setBackgroundColor:[self getColor:@"39C27E"]];
                [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            }
            
            [_bgImageView addSubview:btn];
        }
    }
}

#pragma mark 点击按钮回调
- (void)buttonClick:(UIButton *)btnTag
{
    if (btnTag.tag == 0) {//拒绝按钮
        if(self.RefuseBlock)
        {
            self.RefuseBlock();
        }
    }
    else if (btnTag.tag == 1) {//评价按钮
        if(self.AcceptBlock)
        {
            self.AcceptBlock();
        }
    }
    
    [self dismissAnimation];
}

#pragma mark -showWithAnimation
- (void)performAnimation
{
    self.alpha = 0;
    
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{self.alpha = 1;}
                     completion:nil];
}

- (void)dismissAnimation
{
    self.alpha = 1;
    
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{self.alpha = 0;}
                     completion:^(BOOL finish){[self removeFromSuperview];}];
}

#pragma mark -show
- (void)show
{
    UIWindow *alertWindow = [[UIApplication sharedApplication] keyWindow];
    
    [self addAlertImages];
    [self addAlertLabels];
    [self addAlertButtons];
    [self addCloseBtn];
    
    [alertWindow addSubview:self];
    [self performAnimation];
}

#pragma mark - 颜色
- (UIColor *)getColor:(NSString *) hexColor
{
    
    if(hexColor!=nil&&(NSNull*)hexColor!=[NSNull null]){
        hexColor=[hexColor stringByReplacingOccurrencesOfString:@"#" withString:@""];
    }
    
    unsigned int redInt_, greenInt_, blueInt_;
    NSRange rangeNSRange_;
    rangeNSRange_.length = 2;  // 范围长度为2
    
    // 取红色的值
    rangeNSRange_.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:rangeNSRange_]] scanHexInt:&redInt_];
    
    // 取绿色的值
    rangeNSRange_.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:rangeNSRange_]] scanHexInt:&greenInt_];
    
    // 取蓝色的值
    rangeNSRange_.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:rangeNSRange_]] scanHexInt:&blueInt_];
    
    return [UIColor colorWithRed:(float)(redInt_/255.0f) green:(float)(greenInt_/255.0f) blue:(float)(blueInt_/255.0f) alpha:1.0f];
}

@end
