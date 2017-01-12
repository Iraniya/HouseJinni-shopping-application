//
//  CheckoutHeaderView.h
//  HouseJinni
//
//  Created by Jaydeep Solanki on 09/01/17.
//  Copyright © 2017 Iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckoutHeaderView : UIView
@property (strong,nonatomic) IBOutlet UILabel *subtotal;
@property(strong,nonatomic) IBOutlet UILabel *total;
@property(strong,nonatomic) IBOutlet UIButton *checkButton;
@end
