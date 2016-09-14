//
//  AddMainCategoryViewController.h
//  HouseJinni
//
//  Created by agile on 9/13/16.
//  Copyright (c) 2016 Iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddMainCategoryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

{
    IBOutlet UITableView *mainTableView;
    
    NSInteger numberOfRows;
}
@end
