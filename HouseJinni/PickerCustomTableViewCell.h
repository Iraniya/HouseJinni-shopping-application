//
//  PickerCustomTableViewCell.h
//  HouseJinni
//
//  Created by agile on 9/15/16.
//  Copyright (c) 2016 Iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerCustomTableViewCell : UITableViewCell<UIPickerViewDataSource,UIPickerViewDelegate>
{
    
}
@property (nonatomic,strong)IBOutlet UIPickerView *pickerViewObject;
@end
