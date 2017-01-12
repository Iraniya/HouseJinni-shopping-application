//
//  ProductCartCell.h
//  HouseJinni
//
//  Created by Jaydeep Solanki on 08/01/17.
//  Copyright © 2017 Iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductCartCell : UITableViewCell
@property (strong,nonatomic) IBOutlet UIImageView *productImage;
@property (strong,nonatomic) IBOutlet UILabel *productTitle;
@property (strong,nonatomic) IBOutlet UILabel *productPrice;
@property (strong,nonatomic) IBOutlet UILabel *quantity;
@property (strong,nonatomic) IBOutlet UIButton *deleteButton;

@end
