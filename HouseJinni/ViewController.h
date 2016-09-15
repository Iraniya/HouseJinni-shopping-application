//
//  ViewController.h
//  HouseJinni
//
//  Created by agilemac-12 on 8/31/16.
//  Copyright (c) 2016 Iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
{
    
    
    BOOL isMainAdmin ;
    
    //IBoutlet
    IBOutlet UIScrollView *scrollViewObject;   //scroll view
    IBOutlet UIView *mainAdminView;             //main admin view
    
    IBOutlet UITextField *emailIdTextField;     //TextField
    IBOutlet UITextField *passwordTextField;
    
    IBOutlet UIButton *mainAdminButton;
    
    //main Admin
    IBOutlet UITextField *mainAdminEmailIdTextField; //mainadmin textfield
    IBOutlet UITextField *mainAdminPasswordTextField;
}

- (IBAction)mainAdminBtn:(id)sender;
- (IBAction)signInBtn:(id)sender;
- (IBAction)signUpbtn:(id)sender;

@end

