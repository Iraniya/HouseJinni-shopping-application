//
//  CartItem.h
//  HouseJinni
//
//  Created by Jaydeep Solanki on 09/01/17.
//  Copyright © 2017 Iraniya. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Products;

@interface CartItem : NSObject

@property (strong,nonatomic)Products *product;
@property (assign,nonatomic)int quantity ;

-(id)initWithProduct:(Products *)product;
-(id)initWithProduct:(Products*)product andQuantity:(int)quantity;
@end
