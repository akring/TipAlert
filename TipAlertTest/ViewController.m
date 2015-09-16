//
//  ViewController.m
//  TipAlertTest
//
//  Created by akring on 15/9/16.
//  Copyright © 2015年 akring. All rights reserved.
//

#import "ViewController.h"
#import "TipAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)showAlert:(id)sender{
    
    TipAlertView *alert = [[TipAlertView alloc] initWithMessage:@"卖萌求鼓励\nXXX新版本用着还喜欢么，给点鼓励好不好呢？" image:[UIImage imageNamed:@"exampleImage"] buttonTitles:@[@"反馈问题",@"鼓励我们"]];
    
    alert.AcceptBlock = ^(){
        
        NSLog(@"去评价了",nil);
    };
    alert.RefuseBlock = ^(){
        
        NSLog(@"被拒绝了",nil);
    };
    [alert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
