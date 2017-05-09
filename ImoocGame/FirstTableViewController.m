//
//  FirstTableViewController.m
//  ImoocGame
//
//  Created by 邹前立 on 2017/5/9.
//  Copyright © 2017年 邹前立. All rights reserved.
//

#import "FirstTableViewController.h"

@interface FirstTableViewController () {
    NSArray *heros;
    UITableViewCell *cell;
}

@end

@implementation FirstTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!heros) {
        heros = [NSArray array];
    }
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"heros" ofType:@"plist"];
    heros = [NSArray arrayWithContentsOfFile:filePath];
    
}
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
//    [self preferredStatusBarStyle:UIStatusBarStyleDefault];
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return heros.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cell no : %lu",indexPath.row);
    NSString *heroID = @"heroID";
//    cell = [tableView dequeueReusableCellWithIdentifier:heroID forIndexPath:indexPath];
//    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:heroID];
    NSDictionary *heroInfo = [heros objectAtIndex:indexPath.row];
        cell.backgroundColor = [UIColor lightGrayColor];
        NSString *image  = [heroInfo valueForKey:@"icon"];
        NSString *name   = [heroInfo valueForKey:@"name"];
        NSString *detail = [heroInfo valueForKey:@"intro"];
        cell.imageView.image = [UIImage imageNamed:image]; // 必须设置图片--然后下面才能调整图片大小
//        cell.imageView.frame = CGRectMake(5, 5, 30, 30);
    // 调整cell图片frame 画布大小=图片大小
    CGSize itemSize = CGSizeMake(90, 90); // 画布大小
    UIGraphicsBeginImageContext(itemSize);
    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height); // 图片大小
    [cell.imageView.image drawInRect:imageRect]; // 绘制
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext(); // 取图
    UIGraphicsEndImageContext();
    
        cell.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
        cell.imageView.layer.borderWidth = 2.0;
        cell.imageView.layer.cornerRadius = 20.0;
        cell.imageView.layer.masksToBounds = true;
        cell.textLabel.text = name;
        cell.textLabel.textColor = [UIColor redColor];
        cell.detailTextLabel.text = detail;
        cell.detailTextLabel.textColor = [UIColor blueColor];
        cell.detailTextLabel.numberOfLines = 0;
    // 设置cell分割线
    UIView *splitView = [[UIView alloc] initWithFrame:CGRectMake(0, 108, 414, 2)];
    splitView.backgroundColor = [UIColor whiteColor];
    [cell addSubview:splitView];
//    }
    return cell;
}


#pragma mark header footer
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headView = [[UIView alloc] init];
    headView.backgroundColor = [UIColor greenColor];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 300, 20)];
    titleLabel.backgroundColor = [UIColor grayColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"head--storyboard";
    [headView addSubview:titleLabel];
    
    // 添加一个按钮的目的--点击时进入代码实现的tableViewController
    UIButton *toCode = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame)-110, 20, 100, 20)];
    toCode.layer.borderColor = [UIColor blackColor].CGColor;
    toCode.layer.borderWidth = 2;
    [toCode setTitle:@"toCode" forState:UIControlStateNormal];
    [toCode setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [toCode setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    toCode.backgroundColor = [UIColor redColor];
    [toCode addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:toCode];
    return headView;
    
}
- (void) buttonAction:(UIButton *)btn {
    NSLog(@"btn clicked");
    // 呈现新的控制器
    
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footView = [[UIView alloc] init];
    footView.backgroundColor = [UIColor brownColor];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 414, 20)];
//    titleLabel.backgroundColor = [UIColor grayColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"foot--storyboard";
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
    return 84;
}
@end
