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
    IBOutlet UITextField *passwordTextField;    //TextField
    
    IBOutlet UIButton *mainAdminButton;
    
    //main Admin
    IBOutlet UITextField *mainAdminEmailIdTextField; //mainadmin textfield
    IBOutlet UITextField *mainAdminPasswordTextField;
    
    //temp home button
    IBOutlet UIButton *tempHome;
}

- (IBAction)mainAdminBtn:(id)sender;
- (IBAction)signInBtn:(id)sender;
- (IBAction)signUpbtn:(id)sender;
- (IBAction)tempBtn:(id)sender;
- (IBAction)CollectionVIew:(id)sender;
@end

