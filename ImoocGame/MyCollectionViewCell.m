//
//  MyCollectionViewCell.m
//  ImoocGame
//
//  Created by 邹前立 on 2017/5/10.
//  Copyright © 2017年 邹前立. All rights reserved.
//

#import "MyCollectionViewCell.h"
@interface MyCollectionViewCell() {
    
}
@end
@implementation MyCollectionViewCell

+ (instancetype) createCellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath{
    static NSString * const reuseIdentifier = @"reuseIdentifier";
    MyCollectionViewCell *cell = (MyCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    for (UIView *item in cell.subviews) { // 清空重用cell内容
        [item removeFromSuperview];
    }
    if (!cell) {
        NSLog(@"确定注册了cell？");
        cell = [[MyCollectionViewCell alloc] init];
    }
    return cell;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 100, 100)];
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 10, 300, 20)];
        _introLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 35, 300, 65)];
        
    }
    return self;
}
- (void) addImage:(NSString *) image {
    if(!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 100, 100)];
    }
    _imageView.image = [UIImage imageNamed:image];
}
- (void) addName:(NSString *) name {
    if(!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 10, 300, 20)];
    }
    _nameLabel.text = name;
}
- (void) addIntro:(NSString *) intro {
    if(!_introLabel) {
        _introLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 35, 300, 65)];
    }
    _introLabel.text = intro;
}
- (void) loadImage:(NSString*)image name:(NSString*)name intro:(NSString*)intro {
    self.backgroundColor = [UIColor cyanColor];
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 100, 100)];
    _imageView.image = [UIImage imageNamed:image];
    [self addSubview:_imageView];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 10, 300, 20)];
    _nameLabel.text = name;
    [self addSubview:_nameLabel];
    
    _introLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 35, 300, 65)];
    _introLabel.text = intro;
    _introLabel.numberOfLines = 0;
    _introLabel.textColor = [UIColor purpleColor];
    _introLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_introLabel];

}

@end
