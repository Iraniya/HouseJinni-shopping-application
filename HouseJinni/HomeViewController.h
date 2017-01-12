//
//  HomeViewController.h
//  HouseJinni
//
//  Created by root1 on 9/1/16.
//  Copyright (c) 2016 Iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) IBOutlet UITableView *productViewTable;
-(void)loadProducts;

@end
