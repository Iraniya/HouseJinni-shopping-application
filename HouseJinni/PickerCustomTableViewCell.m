//
//  PickerCustomTableViewCell.m
//  HouseJinni
//
//  Created by agile on 9/15/16.
//  Copyright (c) 2016 Iraniya. All rights reserved.
//

#import "PickerCustomTableViewCell.h"

@implementation PickerCustomTableViewCell
@synthesize pickerViewObject;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - picker View Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    return 5;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{/*
    int i;
    NSString *str;
    for(i=0;i<5;i++){
         str= @"ok";
        return str;
    }
  */
    return @"null";
}

@end

