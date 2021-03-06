//
//  SignUpViewController.m
//  HouseJinni
//
//  Created by root1 on 9/1/16.
//  Copyright (c) 2016 Iraniya. All rights reserved.
//

#import "SignUpViewController.h"
#import "SignUpTableViewCell.h"
#import "SignUpButtonTableViewCell.h"
#import "UserDataModel.h"
#import "UIFont+Utility.h"

@interface SignUpViewController ()
@end
@implementation SignUpViewController
#pragma mark - object Creation
{
    //Custom button cell object
    SignUpButtonTableViewCell *buttonCell;
}

#pragma mark - Init
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - view Methods
-(void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    isMainAdmin = [userDefaults boolForKey:@"isMainAdmin"];
    
    //registration array to create signup form
    registrationArray = [self createArray];
    
    //all user details sotres in userDetails Dictionary
    userDetailsDictionary = [[NSMutableDictionary alloc]init];
    
    //here call funtion to fetch data from database
    //pending to be update by shilpriya
    [self fetchAllUserDetailsFromDataBase];
    [self navigationMethods];
}

//=============== Navigation Methods starts here ==============
#pragma mark - Navigation
-(void)navigationMethods
{
    self.navigationController.navigationBarHidden = false;
    self.navigationItem.title = @"SignUp";
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelPressed:)];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(donePressed:)];
    self.navigationItem.rightBarButtonItem = doneBtn;
    self.navigationItem.leftBarButtonItem  = cancelBtn;
}

-(void)cancelPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)donePressed:(id)sender
{
    //store current user signUp details in database
    //pending
   NSLog(@"user details %@",userDetailsDictionary);
}
//---------------- Navigation methods ends here ------------------

#pragma mark CreatArray
-(NSMutableArray*)createArray
{
    NSMutableArray *signUpRegisterArray = [NSMutableArray new];
    NSMutableDictionary *tempRegisterDictionary;
    
    //Id
    tempRegisterDictionary = [NSMutableDictionary new];
    [tempRegisterDictionary setObject:@"UserId" forKey:@"TextField"];
    [signUpRegisterArray addObject:tempRegisterDictionary];
    
    //UserName
    tempRegisterDictionary = [NSMutableDictionary new];
    [tempRegisterDictionary setObject:@"UserName" forKey:@"TextField"];
    [signUpRegisterArray addObject:tempRegisterDictionary];
    
    //First Name
    tempRegisterDictionary = [NSMutableDictionary new];
    [tempRegisterDictionary setObject:@"FirstName"forKey:@"TextField"];
    [signUpRegisterArray addObject:tempRegisterDictionary];
    
    //Last Name
    tempRegisterDictionary = [NSMutableDictionary new];
    [tempRegisterDictionary setObject:@"LastName" forKey:@"TextField"];
    [signUpRegisterArray addObject:tempRegisterDictionary];
    
    //Email ID
    tempRegisterDictionary =[NSMutableDictionary new];
    [tempRegisterDictionary setObject:@"EmailID" forKey:@"TextField"];
    [signUpRegisterArray addObject:tempRegisterDictionary];
    
    //Password
    tempRegisterDictionary =[NSMutableDictionary new];
    [tempRegisterDictionary setObject:@"Password" forKey:@"TextField"];
    [signUpRegisterArray addObject:tempRegisterDictionary];
    
    //Confirm password
    tempRegisterDictionary =[NSMutableDictionary new];
    [tempRegisterDictionary setObject:@"Confirm Password" forKey:@"TextField"];
    [signUpRegisterArray addObject:tempRegisterDictionary];
    
    //Mobile Number
    tempRegisterDictionary =[NSMutableDictionary new];
    [tempRegisterDictionary setObject:@"MobileNo" forKey:@"TextField"];
    [signUpRegisterArray addObject:tempRegisterDictionary];
    
    //Radio button 1 for Customer
    tempRegisterDictionary =[NSMutableDictionary new];
    [tempRegisterDictionary setObject:@"UserTypeCustomer" forKey:@"RadioButton"];
    [signUpRegisterArray addObject:tempRegisterDictionary];
    
    if(isMainAdmin){
    //Radio button 2 for Sub Admin
    tempRegisterDictionary = [NSMutableDictionary new];
    [tempRegisterDictionary setObject:@"UserTypeSubAdmin" forKey:@"RadioButton"];
    [signUpRegisterArray addObject:tempRegisterDictionary];
    }
    //submit
    return signUpRegisterArray;
}

//=============== Table View Methods starts here ===========
#pragma mark - table View Methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return registrationArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[registrationArray objectAtIndex:indexPath.row] objectForKey:@"TextField"]) {
        return 50.0;
    }
    else if ([[registrationArray objectAtIndex:indexPath.row] objectForKey:@"RadioButton"])
    {
        return 44.0;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int tagCount = (int)indexPath.row+1 ;
    
    
    //if cell is textfield
    if([[registrationArray objectAtIndex:indexPath.row] objectForKey:@"TextField"]){
       SignUpTableViewCell *textFieldCell=[tableView dequeueReusableCellWithIdentifier:@"TextFieldCell"];
        if (textFieldCell==nil) {
            NSArray *aryNib = [[NSBundle mainBundle]loadNibNamed:@"SignUpTableViewCell" owner:self options:nil];
            textFieldCell = (SignUpTableViewCell*)[aryNib firstObject];
        }
    
        textFieldCell.customTextField.delegate=self;
        textFieldCell.customTextField.tag = tagCount;
        //cell.backgroundColor = [UIColor grayColor];
        textFieldCell.customTextField.textAlignment = NSTextAlignmentCenter;
        textFieldCell.customTextField.placeholder = [[registrationArray objectAtIndex:indexPath.row] objectForKey:@"TextField"];
        textFieldCell.customTextField.font = [UIFont getDefaultTextFieldFont];
        
        return textFieldCell;
    }
    
    else if ([[registrationArray objectAtIndex:indexPath.row] objectForKey:@"RadioButton"]){
        
        buttonCell =[tableView dequeueReusableCellWithIdentifier:@"ButtonCell"];
        
        if(buttonCell==nil){
            NSArray *aryNib = [[NSBundle mainBundle]loadNibNamed:@"SignUpButtonTableViewCell" owner:self options:nil];
            buttonCell =(SignUpButtonTableViewCell*)[aryNib firstObject];
        }
        
        if([[[registrationArray objectAtIndex:indexPath.row]objectForKey:@"RadioButton"] isEqualToString:@"UserTypeSubAdmin"]){
            buttonCell.checkBoxButton.tag= tagCount;
            buttonCell.checkBoxTitleLabel.text =@"Sub Admin";
            [self setButtonState];
            return buttonCell;
            
        }
        buttonCell.checkBoxButton.tag = tagCount;
        buttonCell.checkBoxTitleLabel.text =@"Customer";
        [self setButtonState];
        return buttonCell;
    }
    return 0;
}
//-----------------  Table View Methods ends here ----------


//=========textfield methods start here=============///
#pragma mark - textfield methods
//textfield return
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//begin editing
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    //if text field is id user can't edit
    if (textField.tag == 1) {
        textField.enabled =NO;
        return NO;
    }
    return YES;
}

//when textfield end edditing
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    //username
    if (textField.tag ==2) {
        [userDetailsDictionary setObject:textField.text forKey:@"UserName"];
    }
    //first name
    else if (textField.tag==3){
        [userDetailsDictionary setObject:textField.text forKey:@"FirstName"];
    }
    //last Name
    else if (textField.tag==4){
        [userDetailsDictionary setObject:textField.text forKey:@"LastName"];
    }
    //Email Id
    else if (textField.tag==5){
        
        BOOL isEmailIdValid =YES;
        //if user Enter Invalide email Id alert msg will pop Up
        if (isEmailIdValid) {
            [userDetailsDictionary setObject:textField.text forKey:@"EmailId"];}
    }
    //password
    else if (textField.tag==6){
        
        
        BOOL isPasswordValid = YES;
        
        //If user Enter Invalid password
        
        if (isPasswordValid == YES) {
            [userDetailsDictionary setObject:textField.text forKey:@"Password"];
        }
    }
    //Phone Number
    else if(textField.tag==8){
        BOOL isPhoneNumberValid = YES;
        if (isPhoneNumberValid == YES){
            [userDetailsDictionary setObject:textField.text forKey:@"MobileNo"];
        }
    }
        

}
/////------------- TextField methods ends here -----------/////

#pragma mark - CheckBox methods
//Check box state change
-(void)setButtonState
{
    [buttonCell.checkBoxButton setImage:[UIImage imageNamed:@"unchecked_checkbox"] forState:UIControlStateNormal];
    [buttonCell.checkBoxButton setImage:[UIImage imageNamed:@"checked_checkbox"] forState:UIControlStateSelected];
    
    [buttonCell.checkBoxButton addTarget:self action:@selector(myCheckboxToggle:)forControlEvents:UIControlEventTouchUpInside];
    [buttonCell.checkBoxButton setShowsTouchWhenHighlighted:YES];
}

- (void)myCheckboxToggle:(id)sender
{
    
    buttonCell.checkBoxButton.selected = !buttonCell.checkBoxButton.selected;
}


/////=============  DateBase methods starts here ==========//////
#pragma mark - DataBase Methods

-(void)fetchAllUserDetailsFromDataBase
{
    //databse methods should be implimented here
}

-(void)updateAllUserDetailsToDataBase
{
    //current user deatils  are in userDetailsDictionary
    //store the current user deatails in database and update the database
}
//////------------- DataBase methods ends here --------------/////
@end
