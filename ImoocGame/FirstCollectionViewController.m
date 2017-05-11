//
//  FirstCollectionViewController.m
//  ImoocGame
//
//  Created by 邹前立 on 2017/5/9.
//  Copyright © 2017年 邹前立. All rights reserved.
//

#import "FirstCollectionViewController.h"
#import "CodeCollectionViewController.h"
@interface FirstCollectionViewController () {
    NSArray *heros;
    UICollectionViewCell *cell;
}

@end

@implementation FirstCollectionViewController

static NSString * const storyboardID = @"storyboardID";

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!heros) {
        heros = [NSArray array];
    }
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"heros" ofType:@"plist"];
    heros = [NSArray arrayWithContentsOfFile:filePath];
    // Register cell classes 注册
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:storyboardID];
    
    // Do any additional setup after loading the view.
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return heros.count;
//    return 3;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:storyboardID forIndexPath:indexPath];
    if (!cell) { // 因为使用storyboard重用cell
        cell = [[UICollectionViewCell alloc] init];
        NSLog(@"cell no : %lu",indexPath.row); // 重用cell，if不执行，无输出
    }
    // 清空cell contentView 后面子控件添加到contentView
    for (UIView *item in cell.contentView.subviews) {
        [item removeFromSuperview];
    }
    cell.backgroundColor = [UIColor lightGrayColor];
    
    NSDictionary *heroInfo = [heros objectAtIndex:indexPath.row];
    NSString *image  = [heroInfo valueForKey:@"icon"];
    NSString *name  = [heroInfo valueForKey:@"name"];
    NSString *detail = [heroInfo valueForKey:@"intro"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 100, 100)];
    imageView.image = [UIImage imageNamed:image]; // 必须设置图片--然后下面才能调整图片大小
    //        cell.imageView.frame = CGRectMake(5, 5, 30, 30);
    // 调整cell图片frame 画布大小=图片大小
    CGSize itemSize = CGSizeMake(90, 90); // 画布大小
    UIGraphicsBeginImageContext(itemSize);
    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height); // 图片大小
    [imageView.image drawInRect:imageRect]; // 绘制
    imageView.image = UIGraphicsGetImageFromCurrentImageContext(); // 取图
    UIGraphicsEndImageContext();
    imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    imageView.layer.borderWidth = 2.0;
    imageView.layer.cornerRadius = 20.0;
    imageView.layer.masksToBounds = true;
    [cell.contentView addSubview:imageView];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 10, CGRectGetWidth(cell.frame)-110, 20)];
    textLabel.text = name;
    textLabel.textColor = [UIColor blackColor];
    [cell.contentView addSubview:textLabel];
    
    UILabel *detailTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 30, CGRectGetWidth(cell.frame)-110, CGRectGetHeight(cell.frame)-30)];
    detailTextLabel.text = detail;
    detailTextLabel.font = [UIFont systemFontOfSize:12.0];
    detailTextLabel.textColor = [UIColor blueColor];
    detailTextLabel.numberOfLines = 0;
    [cell.contentView addSubview:detailTextLabel];
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headView" forIndexPath:indexPath];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 300, 20)];
        //    titleLabel.backgroundColor = [UIColor grayColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = @"head--storyboard";
        [headView addSubview:titleLabel];
        headView.backgroundColor = [UIColor cyanColor];
        // 添加一个按钮的目的--点击时进入代码实现的collectionViewController
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
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        UICollectionReusableView *footView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footView" forIndexPath:indexPath];
        footView.backgroundColor = [UIColor yellowColor];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 414, 20)];
        //    titleLabel.backgroundColor = [UIColor grayColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = @"foot--storyboard";
        [footView addSubview:titleLabel];
        return footView;
    }
    return nil;
}
- (void) buttonAction:(UIButton *)btn {
    NSLog(@"btn clicked");
    // 呈现新的控制器--代码添加codecollectionviewcontroller
    CodeCollectionViewController *codeCollectionVC = [[CodeCollectionViewController alloc]init];
    [self presentViewController:codeCollectionVC animated:YES completion:nil];
}
@end
