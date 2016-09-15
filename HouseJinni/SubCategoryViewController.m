//
//  SubCategoryViewController.m
//  HouseJinni
//
//  Created by agile on 9/15/16.
//  Copyright (c) 2016 Iraniya. All rights reserved.
//

#import "SubCategoryViewController.h"
#import "PickerCustomTableViewCell.h"
#import "addCatagoryTextFieldTableViewCell.h"
#import "addSubCategoryViewController.h"

@interface SubCategoryViewController ()

@end

@implementation SubCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    subCategoryArray = [[NSMutableArray alloc]initWithObjects:@"gun",@"fun",@"sun",@"done", nil];
    
    //navigation methods
    [self NavigationMethods];
}

#pragma mark - navigation Methods
-(void)NavigationMethods
{
    self.navigationController.navigationBarHidden =false;
    self.navigationItem.title = @"Sub Category";
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backBtnPressed:)];
    
    UIImage *addImage = [UIImage imageNamed:@"AddButton.png"];
    CGRect frameing  = CGRectMake(0, 0, addImage.size.width -100, addImage.size.height-100);
    UIButton *addButton = [[UIButton alloc]initWithFrame:frameing];
    [addButton setBackgroundImage:addImage forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addBtnPressed:)
        forControlEvents:UIControlEventTouchUpInside];
    [addButton setShowsTouchWhenHighlighted:YES];
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc]initWithCustomView:addButton];
    self.navigationItem.leftBarButtonItem  = backBtn;
    self.navigationItem.rightBarButtonItem = addBtn;
}

-(void)backBtnPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)addBtnPressed:(id)sender
{
    addSubCategoryViewController *addSubCategoryViewControllerObject=[[addSubCategoryViewController alloc]initWithNibName:@"addSubCategoryViewController" bundle:nil];
    [self.navigationController pushViewController:addSubCategoryViewControllerObject animated:YES];
}

#pragma mark - TableView Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return subCategoryArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = [subCategoryArray objectAtIndex:indexPath.row];
    return cell;
    
    //temp code to user in add sub category class
    /*
   // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
   // if(indexPath.row == 0){
        PickerCustomTableViewCell *pickerCustomCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (pickerCustomCell==nil) {
            NSArray *aryNib = [[NSBundle mainBundle]loadNibNamed:@"PickerCustomTableViewCell" owner:self options:nil];
            pickerCustomCell = (PickerCustomTableViewCell*)[aryNib firstObject];
        }
    
        return pickerCustomCell;
    }
    if (indexPath.row==1) {
        addCatagoryTextFieldTableViewCell *textFieldCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (textFieldCell==nil) {
            NSArray *aryNib = [[NSBundle mainBundle]loadNibNamed:@"addCatagoryTextFieldTableViewCell" owner:self options:nil];
            textFieldCell = (addCatagoryTextFieldTableViewCell*)[aryNib firstObject];
        }
        return textFieldCell;
    }
    return cell;
    */
}
@end
