//
//  Cart.m
//  HouseJinni
//
//  Created by Jaydeep Solanki on 09/01/17.
//  Copyright © 2017 Iraniya. All rights reserved.
//

#import "Cart.h"
#import "CartItem.h"


@implementation Cart

+(double)totalAmount
{
    double total = 0;
    NSMutableArray *contents = [self contents];
    
    for (CartItem *item in contents) {
        total += (item.product.price * item.quantity);
    }

    return total;
}

+(int)totalProducts
{
    int total = 0;
    
    NSMutableArray *contents = [self contents];
    
    for (CartItem *item in contents) {
        total += item.quantity;
    }
    
    return total;
}


/*
+(NSMutableArray *)contents
{
    NSMutableArray *content = [[NSMutableArray alloc]init];
    
    
}
 */

+(BOOL)exists:(Products *)product
{
    CartItem *item = [self getProduct:product.id];
    return item !=nil;
}

+(BOOL)isEmpty
{
    return [self totalProducts]==0;
}

+(BOOL)clearCart
{
    BOOL success  = NO;
    return success;
}

+(BOOL)addProduct:(Products *)product
{
    return [self addProduct:product quantity:1];
}

+(BOOL)addProduct:(Products *)product quantity:(int)quantity
{
    BOOL success = NO;
    
    return success;
}
@end
