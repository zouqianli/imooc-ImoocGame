//
//  MyCollectionViewCell.h
//  ImoocGame
//
//  Created by 邹前立 on 2017/5/10.
//  Copyright © 2017年 邹前立. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *introLabel;
+ (instancetype) createCellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;
- (instancetype)initWithFrame:(CGRect)frame ;
- (void) loadImage:(NSString*)image name:(NSString*)name intro:(NSString*)intro;
- (void) addImage:(NSString *) image;
- (void) addName:(NSString *) name ;
- (void) addIntro:(NSString *) intro ;
@end
