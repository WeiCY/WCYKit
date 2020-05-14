//
//  WCYDemoViewController.m
//  WCYKit_Example
//
//  Created by CityDoWCY on 2020/5/14.
//  Copyright © 2020 1690014290@qq.com. All rights reserved.
//

#import "WCYDemoViewController.h"
#import <WCYKitHeader.h>

@interface WCYDemoViewController ()

@end

@implementation WCYDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"详情";
    
    UITextView *textView = [[UITextView alloc] init];
    textView.frame = CGRectMake(20, 20, EQUIPMENT_SCREENT_WIDTH-40, EQUIPMENT_SCREENT_HEIGHT-TopNavHeight-40);
    textView.userInteractionEnabled = NO;
    textView.text = self.detailText;
    [self.view addSubview:textView];
    
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
