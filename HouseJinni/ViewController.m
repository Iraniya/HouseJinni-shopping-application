//
//  ViewController.m
//  HouseJinni
//
//  Created by agilemac-12 on 8/31/16.
//  Copyright (c) 2016 Iraniya. All rights reserved.
//

#import "ViewController.h"
#import "SignUpViewController.h"
#import "UserDataModel.h"
#import "UIFont+Utility.h"
#import "InventoryViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UserDataModel *userDataModelObject ;
}

#pragma mark - Init
-(void)viewDidLoad
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    isMainAdmin = [userDefaults boolForKey:@"isMainAdmin"];
    if (isMainAdmin == true) {
        mainAdminButton.hidden =true;
    }
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //textField Related things Eg. placeholder
    [self CreateTextField];
    mainAdminView.hidden = true;
    
    [self navigationMethods];
    [self ScrollViewMethods];
    
}

#pragma mark - Navigation Methods
-(void)navigationMethods
{
    self.navigationController.navigationBarHidden =true;
}

#pragma mark -TextField Methods
-(void)CreateTextField
{
    emailIdTextField.font = [UIFont getDefaultTextFieldFont] ;
    emailIdTextField.placeholder = @"Email Id";
    passwordTextField.placeholder = @"Password";
    
    //tag
    emailIdTextField.tag = 1;
    passwordTextField.tag = 2;
    
    //PlaceHolder
    mainAdminEmailIdTextField.placeholder =@"Email Id";
    mainAdminPasswordTextField.placeholder = @"Password";
    
}


#pragma mark - Main Admin
- (IBAction)mainAdminBtn:(id)sender {
    
    mainAdminView.hidden =false;
    
}

#pragma mark - Sign In
- (IBAction)signInBtn:(id)sender {
    
    NSString *emailId = emailIdTextField.text;
    NSString *password = passwordTextField.text;
    
    BOOL isDataMatch = [self checkEmailPassword:emailId AndPasswordIs:password];
    isDataMatch = true;
    if (isDataMatch) {
        InventoryViewController *inventoryViewControllerObject = [[InventoryViewController alloc]initWithNibName:@"InventoryViewController" bundle:nil];
        [self.navigationController pushViewController:inventoryViewControllerObject animated:YES];
    }
    else
    {
        UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Alert View"message:@"Please enter valid username or Password" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alt show];
    }
}

-(BOOL)checkEmailPassword:(NSString*)emailId AndPasswordIs :(NSString*)password
{
    //get data than check
    if ([emailId isEqualToString:emailId]) {
        if ([password isEqualToString:password]) {
            return true;
        }
        return false;
    }
    else
        return false;
}

#pragma mark - Sign Up
- (IBAction)signUpbtn:(id)sender {
    
    SignUpViewController *signUpViewControllerObject = [[SignUpViewController alloc]initWithNibName:@"SignUpViewController" bundle:nil];
    
   [self.navigationController pushViewController:signUpViewControllerObject animated:YES];
}

#pragma mark - MainAdmin View
-(IBAction)cancelBtn:(id)sender
{
    mainAdminView.hidden =true;
}

-(IBAction)okBtn:(id)sender
{
    NSString *mainEmailId = mainAdminEmailIdTextField.text;
    NSString *mainPassword = mainAdminPasswordTextField.text;
    
    if ([mainEmailId isEqualToString:@"admin@gmail.com"]) {
        if ([mainPassword isEqualToString:@"123"]) {
            isMainAdmin = true;
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setBool:YES forKey:@"isMainAdmin"];
            [userDefaults synchronize];
            mainAdminView.hidden = true;
            
            [self viewDidLoad];
        }
    }
    else{
        UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Alert View"message:@"Please enter valid username or Password" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alt show];
    }
}

#pragma mark - ScrollView Methods
-(void)ScrollViewMethods
{
    //setting context size for sroll view
    [scrollViewObject setContentSize:CGSizeMake(320, 650)];
    [self.view addSubview:scrollViewObject];
    
    //Not Working
    //scrollViewObject.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    //scrollViewObject.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;    
}

#pragma mark - TextField Delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ([textField.placeholder isEqualToString:@"Password"]) {
        if (textField.tag>0){
            [scrollViewObject scrollRectToVisible:CGRectMake(textField.frame.origin.x, textField.frame.origin.y+310, textField.frame.size.width, textField.frame.size.height) animated:YES];
        }
    }
}
@end
