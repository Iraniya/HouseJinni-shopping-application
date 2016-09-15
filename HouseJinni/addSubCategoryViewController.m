//
//  addSubCategoryViewController.m
//  HouseJinni
//
//  Created by agile on 9/15/16.
//  Copyright (c) 2016 Iraniya. All rights reserved.
//

#import "addSubCategoryViewController.h"
#import "PickerCustomTableViewCell.h"

@interface addSubCategoryViewController ()

@end

@implementation addSubCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    numberOfRows = 5;
    
    [self NavigationMethods];
}


#pragma mark - Navigation Methods

-(void)NavigationMethods
{
    self.navigationController.navigationBarHidden = false;
    self.navigationItem.title = @"Add Sub Category";
    
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
    //add new sub category
}

//------------------ Navigation ends Here  ----------------///

#pragma mark -table View Methods


//============== Table View Methods starts here =============
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return numberOfRows;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PickerCustomTableViewCell *pickerCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (pickerCell==nil) {
        NSArray *arryNib = [[NSBundle mainBundle]loadNibNamed:@"PickerCustomTableViewCell" owner:self options:nil];
        pickerCell = (PickerCustomTableViewCell*)[arryNib firstObject];
    }
    NSLog(@"pickerok%@",pickerCell);
    return pickerCell;
                                             
}

//--------------- Table View methods ends here -------------
@end
