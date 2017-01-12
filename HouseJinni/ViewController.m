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
#import "HomeViewController.h"
@interface ViewController ()

@end

@implementation ViewController
{
    UserDataModel *userDataModelObject ;
}

#pragma mark - Init
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    isMainAdmin = [[self funtionToGetUserDefaultData] boolForKey:@"isMainAdmin"];
    
    NSLog(@"%d",isMainAdmin);
    
    if (isMainAdmin == true) {
        mainAdminButton.hidden =true;
    }
    
    //create textField and add property
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

#pragma mark -TextField init Methods
-(void)CreateTextField
{
    /*
    //create TextFiled programmetically
    NSArray *loginForm = [[NSArray alloc]initWithObjects:@"emailId",@"password", nil];
    
    for (int i =0 ; i<2; i++) {
        
        //creating string for nameing textfield
        NSString *textFieldName = [NSString stringWithFormat:@"%@TextField",[loginForm objectAtIndex:i]];
        
        CGRect frame = CGRectMake(70, 96, 182, 30);
        UITextField *textfield = [[UITextField alloc]initWithFrame:frame];
        
    }
    
    
    
    ///CGRect frame = CGRectMake(70, 96, 182, 30);
    emailIdTextField.frame = frame;
    
    //emailIdTextField.textAlignment = UITextAlignmentCenter;
    */
    
    emailIdTextField.font = [UIFont getDefaultTextFieldFont] ;
    emailIdTextField.placeholder = @"Email Id";
    passwordTextField.placeholder = @"Password";
    //tag
    emailIdTextField.tag = 1;
    passwordTextField.tag = 2;
    
    mainAdminEmailIdTextField.tag = 11;
    mainAdminPasswordTextField.tag= 22;
    //PlaceHolder
    mainAdminEmailIdTextField.placeholder =@"Email Id";
    mainAdminPasswordTextField.placeholder = @"Password";
    //delegate
    emailIdTextField.delegate = self;
    passwordTextField.delegate =self;
    mainAdminEmailIdTextField.delegate =self;
    mainAdminPasswordTextField.delegate=self;
}

#pragma mark - TextField Delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    //function to scroll
    [self functionToScrollTextField:textField];
   
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
            
            NSUserDefaults *houseJinniUserDefaults = [NSUserDefaults standardUserDefaults];
            [houseJinniUserDefaults setBool:YES forKey:@"isMainAdmin"];
            [houseJinniUserDefaults synchronize];
            mainAdminView.hidden = true;
            
            [self viewDidLoad];
        }
    }
    else{
        UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Alert View"message:@"Please enter valid username or Password" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alt show];
    }
}
-(void)tempBtn:(id)sender
{
    HomeViewController *home = [[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
    [self.navigationController pushViewController:home animated:YES];
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

#pragma mark - functions

-(void)functionToScrollTextField:(UITextField*)textField
{
    if (textField.tag>0){
        [scrollViewObject scrollRectToVisible:CGRectMake(textField.frame.origin.x, textField.frame.origin.y+380, textField.frame.size.width, textField.frame.size.height) animated:YES];
    }

}

-(NSUserDefaults*)funtionToGetUserDefaultData
{
    NSUserDefaults *houseJinniUserDefaults = [NSUserDefaults standardUserDefaults];
    return houseJinniUserDefaults;
}


-(void)funtionToSetUserDefaultValues
{
    NSUserDefaults *houseJinniUserDefaults = [NSUserDefaults standardUserDefaults];
    [houseJinniUserDefaults setBool:YES forKey:@"isMainAdmin"];
    [houseJinniUserDefaults synchronize];
}

@end
