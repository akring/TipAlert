//
//  TipAlertView.h
//  ecmc
//
//  Created by akring on 15/9/16.
//  Copyright © 2015年 cp9. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TipAlertView;

//去评价
typedef void (^AcceptBlock)();
//无情拒绝
typedef void (^RefuseBlock)();

@interface TipAlertView : UIView{
    
    NSArray *btnTitleArr;/**< 按钮标题数组，传入两个即可 */
    UIImage *topImage;/**< 顶部图片 */
    NSString *titleStr,*contextStr;
    NSString *contextMsgStr;
    UILabel *contextMsgLabel;
    NSTextAlignment alignment;
}

@property (nonatomic,strong) UIImageView *bgImageView;
@property (nonatomic, strong) UILabel *contextLabel;
@property (nonatomic,copy) AcceptBlock AcceptBlock;/**< 接受并去评价Block */
@property (nonatomic,copy) RefuseBlock RefuseBlock;/**< 无情拒绝Block */

- (id)initWithMessage:(NSString *)message image:(UIImage *)image buttonTitles:(NSArray *)btnArr;

- (void)show;

@end
