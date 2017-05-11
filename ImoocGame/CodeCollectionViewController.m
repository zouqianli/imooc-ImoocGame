//
//  CodeCollectionViewController.m
//  ImoocGame
//
//  Created by 邹前立 on 2017/5/10.
//  Copyright © 2017年 邹前立. All rights reserved.
//

#import "CodeCollectionViewController.h"
#import "MyCollectionViewCell.h"
@interface CodeCollectionViewController () <UICollectionViewDelegate,UICollectionViewDataSource>{
    NSArray *heros;
    UICollectionView *myCollectionView;
}
@end
@implementation CodeCollectionViewController
//static NSString * const reuseIdentifier = @"reuseIdentifier";
- (void)viewDidLoad {
    [super viewDidLoad];
    if (!heros) {
        heros = [NSArray array];
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil];
        heros = [NSArray arrayWithContentsOfFile:filePath];
    }
    // layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(414, 110);
    layout.headerReferenceSize = CGSizeMake(414, 44);
    layout.footerReferenceSize = CGSizeMake(414, 44);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    // init
    myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 414, 736) collectionViewLayout:layout];
    myCollectionView.backgroundColor = [UIColor whiteColor];
    myCollectionView.dataSource = self;
    myCollectionView.delegate = self;
    // Register cell header footer classes
    [myCollectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"reuseIdentifier"]; // [MyCollectionViewCell class] -- 不然返回的是UIcollectionViewCell -- 报错 unrecognized method
    [myCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headView"];
    [myCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footView"];
    [self.view addSubview:myCollectionView];
}
#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 35;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *hero = [heros objectAtIndex:indexPath.row];
    NSString *image = [hero valueForKey:@"icon"];
    NSString *name  = [hero valueForKey:@"name"];
    NSString *intro = [hero valueForKey:@"intro"];
    MyCollectionViewCell *cell = [MyCollectionViewCell createCellWithCollectionView:collectionView forIndexPath:indexPath];
    [cell loadImage:image name:name intro:intro];
    return cell;
}
#pragma mark <UICollectionViewDelegate>
// header footer
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headView" forIndexPath:indexPath];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 300, 20)];
        //    titleLabel.backgroundColor = [UIColor grayColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = @"head--code";
        [headView addSubview:titleLabel];
        headView.backgroundColor = [UIColor lightGrayColor];
        // 添加一个按钮的目的--点击时进入代码实现的tableViewController
        UIButton *back = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame)-110, 20, 100, 20)];
        back.layer.borderColor = [UIColor blackColor].CGColor;
        back.layer.borderWidth = 2;
        [back setTitle:@"back" forState:UIControlStateNormal];
        [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [back setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        back.backgroundColor = [UIColor redColor];
        [back addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [headView addSubview:back];
        return headView;
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        UICollectionReusableView *footView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footView" forIndexPath:indexPath];
        footView.backgroundColor = [UIColor yellowColor];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 414, 20)];
        //    titleLabel.backgroundColor = [UIColor grayColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = @"foot--code";
        [footView addSubview:titleLabel];
        return footView;
    }
    return nil;
}
// 返回按钮响应方法
- (void) backButtonAction:(UIButton *)btn {
    NSLog(@"backBtn");
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
