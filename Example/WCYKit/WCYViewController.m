//
//  WCYViewController.m
//  WCYKit
//
//  Created by 1690014290@qq.com on 05/14/2020.
//  Copyright (c) 2020 1690014290@qq.com. All rights reserved.
//

#import "WCYViewController.h"
#import "WCYDemoViewController.h"

#import <WCYKitHeader.h>

@interface WCYViewController ()

@property (nonatomic, strong) NSArray *datarray;
@property (nonatomic, strong) NSArray *detailArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation WCYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"WCYKit";
    
    self.datarray = [NSArray arrayWithObjects:@"WCYDefines",@"WCYCategories",@"WCYKitHeader",@"WCYTool", nil];
       
    self.detailArray = [NSArray arrayWithObjects:@"WCYDefines是我在开发中常常用的的一些宏定义。内容比较全，它包含获取设备信息、应用信息、系统控件高度、导航栏的基础设置、tabbar的基础设置、基本颜色设置、主题色设置、rgb颜色宏定义、弱引用强引用、判断非空、弧度角度的转换、获取类名的宏定义、单例的宏定义等等。它包含了一些东西，推荐使用查看",
                           @"WCYCategories是我开发中常常使用的一些扩展类，我已经在每个类的备注中详细写了这个类是做什么的，怎么使用。大家可以自行查看",
                           @"WCYKitHeader是WCYkit的整体头文件。使用本类只需导入本文件即可",
                           @"WCYTool是我在开发中封装的一些工具类，具体可查看具体分类", nil];
       
    
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datarray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AdaptedWidth(50);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:GET_CLASS_NAME(UITableViewCell)];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:GET_CLASS_NAME(UITableViewCell)];
    }
    
    cell.textLabel.text = self.datarray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    WCYDemoViewController *demo = [[WCYDemoViewController alloc] init];
    demo.title = self.datarray[indexPath.row];
    demo.detailText = self.detailArray[indexPath.row];
    [self.navigationController pushViewController:demo animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
