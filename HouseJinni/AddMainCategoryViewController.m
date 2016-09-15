//
//  AddMainCategoryViewController.m
//  HouseJinni
//
//  Created by agile on 9/13/16.
//  Copyright (c) 2016 Iraniya. All rights reserved.
//

#import "AddMainCategoryViewController.h"
#import "addCatagoryTextFieldTableViewCell.h"
#import "SubCategoryViewController.h"

@interface AddMainCategoryViewController ()

@end

@implementation AddMainCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self NavigationMethods];
    numberOfRows = 10;
}


#pragma mark - Navigation Methods

-(void)NavigationMethods
{
    self.navigationController.navigationBarHidden = false;
    self.navigationItem.title = @"Add Main Category";
    
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelBtnPressed:)];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(doneBtnPressed:)];
    self.navigationItem.rightBarButtonItem = doneBtn;
    self.navigationItem.leftBarButtonItem  = cancelBtn;
}
-(void)cancelBtnPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)doneBtnPressed:(id)sender
{
    //add new category
}

#pragma mark - Table View Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return numberOfRows;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        addCatagoryTextFieldTableViewCell *textFieldCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (textFieldCell==nil) {
            NSArray *aryNib = [[NSBundle mainBundle]loadNibNamed:@"addCatagoryTextFieldTableViewCell" owner:self options:nil];
            textFieldCell = (addCatagoryTextFieldTableViewCell*)[aryNib firstObject];
        }
        return textFieldCell;
}


@end
