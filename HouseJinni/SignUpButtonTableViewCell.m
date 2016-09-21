//
//  SignUpButtonTableViewCell.m
//  HouseJinni
//
//  Created by agile on 08/09/16.
//  Copyright © 2016 Iraniya. All rights reserved.
//

#import "SignUpButtonTableViewCell.h"


@implementation SignUpButtonTableViewCell
@synthesize checkBoxButton;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

// when you setup your button, set an image for the selected and normal states


- (void)myCheckboxToggle:(id)sender
{
    checkBoxButton.selected = !checkBoxButton.selected; // toggle the selected property, just a simple BOOL
}

@end
