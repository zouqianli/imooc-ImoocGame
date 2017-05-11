//
//  MyTableViewself.m
//  ImoocGame
//
//  Created by 邹前立 on 2017/5/9.
//  Copyright © 2017年 邹前立. All rights reserved.
//

#import "MyTableViewCell.h"
@interface MyTableViewCell() {
    
    UIImageView *imageView1;
    UILabel *textLabel1;
    UILabel *detailTextLabel1;
}
@end

@implementation MyTableViewCell
+ (instancetype) createCellWithTableView:(UITableView *) tableView {
    static NSString *codeCellID = @"codeCellID";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:codeCellID];
    if (!cell) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:codeCellID];
    }
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 414, 10)];// 分割线
    lineView.backgroundColor = [UIColor whiteColor];
    [cell addSubview:lineView];
    cell.backgroundColor = [UIColor cyanColor];
    return cell;
}

// 添加内容
- (void) loadImage:(NSString*)image name:(NSString*)name intro:(NSString*)intro {
    
    imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 90, 90)];
    imageView1.image = [UIImage imageNamed:image];
    // 调整cell图片frame 画布大小=图片大小
    CGSize itemSize = CGSizeMake(90, 90); // 画布大小
    UIGraphicsBeginImageContext(itemSize);
    CGRect imageRect = CGRectMake(0, 0, itemSize.width, itemSize.height); // 图片大小
    [imageView1.image drawInRect:imageRect]; // 绘制
    imageView1.image = UIGraphicsGetImageFromCurrentImageContext(); // 取图
    UIGraphicsEndImageContext();

//    imageView1.backgroundColor = [UIColor blueColor];
    imageView1.layer.borderColor = [UIColor whiteColor].CGColor;
    imageView1.layer.borderWidth = 2.0;
    imageView1.layer.cornerRadius = 20.0;
    imageView1.layer.masksToBounds = true;
    [self addSubview:imageView1];

    textLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(110, 10, 300, 20)];
    textLabel1.text = name;
//    textLabel1.backgroundColor = [UIColor grayColor];
    textLabel1.textColor = [UIColor redColor];
    textLabel1.font = [UIFont systemFontOfSize:12];
    [self addSubview:textLabel1];

    detailTextLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(110, 35, 300, 65)];
//    detailTextLabel1.backgroundColor = [UIColor lightGrayColor];
    detailTextLabel1.text = intro;
    detailTextLabel1.textAlignment = NSTextAlignmentLeft;
    detailTextLabel1.font = [UIFont systemFontOfSize:12.0];
    detailTextLabel1.textColor = [UIColor grayColor];
    detailTextLabel1.numberOfLines = 0;
    [self addSubview:detailTextLabel1];
}
@end
