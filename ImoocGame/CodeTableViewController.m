//
//  CodeTableViewController.m
//  ImoocGame
//
//  Created by 邹前立 on 2017/5/9.
//  Copyright © 2017年 邹前立. All rights reserved.
//

#import "CodeTableViewController.h"
#import "MyTableViewCell.h"
@interface CodeTableViewController () <UITableViewDelegate,UITableViewDataSource> {
    NSArray *heros;
    
    UITableView *myTableView;
}

@end

@implementation CodeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    if (!heros) {
        heros = [NSArray array];
    }
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"heros" ofType:@"plist"];
    heros = [NSArray arrayWithContentsOfFile:filePath];
    myTableView.dataSource = self;
    myTableView.delegate = self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return heros.count;
    return 25;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *heroInfo = [heros objectAtIndex:indexPath.row];
    NSString *image  = [heroInfo valueForKey:@"icon"];
    NSString *name   = [heroInfo valueForKey:@"name"];
    NSString *intro = [heroInfo valueForKey:@"intro"];
    
    MyTableViewCell *cell = [MyTableViewCell createCellWithTableView:myTableView];
    [cell loadImage:image name:name intro:intro]; // data
    return cell;
}
#pragma mark header footer
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headView = [[UIView alloc] init];
    headView.backgroundColor = [UIColor greenColor];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 414, 20)];
//    titleLabel.backgroundColor = [UIColor grayColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"head--code";
    [headView addSubview:titleLabel];
    [headView addSubview:[self addBackButton]];
    return headView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footView = [[UIView alloc] init];
    footView.backgroundColor = [UIColor brownColor];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 414, 20)];
    //    titleLabel.backgroundColor = [UIColor grayColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"foot--code";
    [footView addSubview:titleLabel];
    return footView;
    
}
#pragma mark height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 110;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 44;
}
// 返回按钮
- (UIButton *) addBackButton {
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame)-110, 20, 100, 20)];
    backBtn.layer.borderColor = [UIColor blackColor].CGColor;
    backBtn.layer.borderWidth = 2;
    [backBtn setTitle:@"back" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    backBtn.backgroundColor = [UIColor redColor];
    [backBtn addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:backBtn];
    return backBtn;
}
// 返回按钮响应方法
- (void) backButtonAction:(UIButton *)btn {
    NSLog(@"backBtn");
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
