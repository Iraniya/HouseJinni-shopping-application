//
//  CartItem.m
//  HouseJinni
//
//  Created by Jaydeep Solanki on 09/01/17.
//  Copyright © 2017 Iraniya. All rights reserved.
//

#import "CartItem.h"

@implementation CartItem

-(id)initWithProduct:(Products *)product
{
    return [self initWithProduct:product andQuantity:1];
}

-(id)initWithProduct:(Products *)product andQuantity:(int)quantity
{
    self = [super init];
    
    if (self) {
        self.product = product;
        self.quantity = quantity;
    }
    
    return self;
}
@end
