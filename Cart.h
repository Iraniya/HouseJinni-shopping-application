//
//  Cart.h
//  HouseJinni
//
//  Created by Jaydeep Solanki on 09/01/17.
//  Copyright © 2017 Iraniya. All rights reserved.
//

#import "Products.h"

@class CartItem;

@interface Cart : NSObject

+(double)totalAmount;
+(int)totalProducts;
+(NSMutableArray *)contents;
+(CartItem *)getProduct:(int)productId;
+(BOOL)removeProduct:(Products*)product;
+(BOOL)addProduct:(Products*)product;
+(BOOL)addProduct:(Products *)product quantity:(int)quantity;
+(BOOL)exists:(Products*)product;
+(BOOL)isEmpty;
+(BOOL)clearCart;
@end
