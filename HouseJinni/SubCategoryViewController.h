//
//  SubCategoryViewController.h
//  HouseJinni
//
//  Created by agile on 9/15/16.
//  Copyright (c) 2016 Iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubCategoryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    //table view
    IBOutlet UITableView *tableViewObject;
    
    //array for subCategory
    NSMutableArray *subCategoryArray;
}
@end
