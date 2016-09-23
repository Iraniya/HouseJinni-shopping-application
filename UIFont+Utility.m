//
//  UIFont+Utility.m
//  HouseJinni
//
//  Created by agile on 07/09/16.
//  Copyright © 2016 Iraniya. All rights reserved.
//

#import "UIFont+Utility.h"

#define AppTextFieldFontSize 18.0

@implementation UIFont (Utility)


//default font for full application
+(UIFont*)setDefaultFontForAll
{
    return  [UIFont systemFontOfSize:AppTextFieldFontSize];
    // return  [UIFont systemFontOfSize:size];
}

+(UIFont*)getTextFieldFont:(CGFloat)size
{
    if (size == 0)
    {
        return [self getDefaultTextFieldFont];
    }
    return  [UIFont fontWithName:@"Arial" size:size];
}

+(UIFont*)getDefaultTextFieldFont
{
    return [UIFont systemFontOfSize:AppTextFieldFontSize];
}

+(UIFont*)getFontForLable:(CGFloat)size
{
    return [UIFont systemFontOfSize:AppTextFieldFontSize ];
}

@end
