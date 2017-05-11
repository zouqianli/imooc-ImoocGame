//
//  MyTableViewCell.h
//  ImoocGame
//
//  Created by 邹前立 on 2017/5/9.
//  Copyright © 2017年 邹前立. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
+ (instancetype) createCellWithTableView:(UITableView *) tableView ;
- (void) loadImage:(NSString*)image name:(NSString*)name intro:(NSString*)intro;

@end
