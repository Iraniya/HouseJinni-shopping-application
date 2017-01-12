//
//  Products.h
//  HouseJinni
//
//  Created by Jaydeep Solanki on 08/01/17.
//  Copyright © 2017 Iraniya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Products : NSObject
@property (assign, nonatomic) int id;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *image;
@property (assign, nonatomic) double price;


- (id)initWithId:(int)productid name:(NSString *)name image:(NSString *)image andPrice:(double) price;
+ (NSMutableArray *)listProducts;

@end
