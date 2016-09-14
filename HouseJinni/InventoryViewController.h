//
//  InventoryViewController.h
//  HouseJinni
//
//  Created by agile on 9/13/16.
//  Copyright (c) 2016 Iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InventoryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

{
    
    IBOutlet UITableView *mainCatogoryTableView;     //table View
    
    //array
    NSMutableArray *mainCategory;
}
@end
