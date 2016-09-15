//
//  InventoryViewController.m
//  HouseJinni
//
//  Created by agile on 9/13/16.
//  Copyright (c) 2016 Iraniya. All rights reserved.
//

#import "InventoryViewController.h"
#import "AddMainCategoryViewController.h"
#import "SubCategoryViewController.h"

@interface InventoryViewController ()

@end

@implementation InventoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    mainCategory = [[NSMutableArray alloc]init];
    //fetch data from data base pending
    mainCategory = [[NSMutableArray alloc]initWithObjects:@"food",@"goods",@"Electronics", nil];
    [self NavigationMethods];
    NSLog(@"main category%@",mainCategory);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - navigation Methods
-(void)NavigationMethods
{
    self.navigationController.navigationBarHidden =false;
    self.navigationItem.title = @"Main Category";
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelBtnPressed:)];
    //UIBarButtonItem *addBtn = [[UIBarButtonItem alloc]initWithTitle:@"add" style:UIBarButtonItemStylePlain target:self action:@selector(addBtnPressed:)];
    UIImage *addImage = [UIImage imageNamed:@"AddButton.png"];
    CGRect frameing  = CGRectMake(0, 0, addImage.size.width -100, addImage.size.height-100);
    UIButton *addButton = [[UIButton alloc]initWithFrame:frameing];
    [addButton setBackgroundImage:addImage forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addBtnPressed:)
         forControlEvents:UIControlEventTouchUpInside];
    [addButton setShowsTouchWhenHighlighted:YES];
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc]initWithCustomView:addButton];
    self.navigationItem.leftBarButtonItem  = cancelBtn;
    self.navigationItem.rightBarButtonItem = addBtn;
}

-(void)cancelBtnPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)addBtnPressed:(id)sender
{
    AddMainCategoryViewController *addMainCategoryViewController = [[ AddMainCategoryViewController alloc]initWithNibName:@"AddMainCategoryViewController" bundle:nil];
    [self.navigationController pushViewController:addMainCategoryViewController animated:YES];
}

//--------navigation Methods ends here--------

#pragma mark - TableView methods

//=============== Table View Methods starts here ================//

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mainCategory.count;
}

//cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = [mainCategory objectAtIndex:indexPath.row];
    return cell;
    
}
//when user select any main category
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SubCategoryViewController *subCategoryObject = [[SubCategoryViewController alloc]initWithNibName:@"SubCategoryViewController" bundle:nil];
    [self.navigationController pushViewController:subCategoryObject animated:YES];
    NSLog(@"%@",indexPath);
}

//------------Table View methods ends here ----------
@end
