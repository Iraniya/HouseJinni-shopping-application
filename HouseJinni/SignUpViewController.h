//
//  SignUpViewController.h
//  HouseJinni
//
//  Created by root1 on 9/1/16.
//  Copyright (c) 2016 Iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface SignUpViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    
    BOOL isMainAdmin;
    
    IBOutlet UITableView *signUpTableView;  //table view
    
    NSMutableDictionary *userDetailsDictionary; 
    
    NSMutableArray *userSignUpDetailsArray; //user array
    NSMutableArray *registrationArray;      //registration form
    //Objects For Database
    NSString *strDBBundlePath;
    NSString *strDBDirectoryPath;
    AppDelegate *appDelegateObject;
}

@property(nonatomic,strong)NSMutableDictionary *registerDictionary; // user details
@end
