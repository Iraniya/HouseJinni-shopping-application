//
//  AppDelegate.h
//  HouseJinni
//
//  Created by agilemac-12 on 8/31/16.
//  Copyright (c) 2016 Iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDB.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,strong)FMDatabase *dataBaseObject;

@end

