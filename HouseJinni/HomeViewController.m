//
//  HomeViewController.m
//  HouseJinni
//
//  Created by root1 on 9/1/16.
//  Copyright (c) 2016 Iraniya. All rights reserved.
//

#import "HomeViewController.h"
#import "ProductTableViewCell.h"
#import "AppDelegate.h"
#import "CartViewController.h"
#import "Products.h"
#import "Cart.h"

@interface HomeViewController ()

@property (strong,nonatomic) NSMutableArray *products;

-(void)addToCart:(UIButton *)sender;
@end

@implementation HomeViewController
@synthesize productViewTable;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

#pragma mark - Table View data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.products count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifire = @"ProductCell";
    ProductTableViewCell *cell = (ProductTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifire];
    Products *product = [self.products objectAtIndex:indexPath.row];
    
    //config the cell..
    cell.productImage.image = [UIImage imageNamed:product.image];
    cell.productImage.contentMode = UIViewContentModeScaleAspectFit;
    cell.productTitle.text = product.name;
    
    NSNumberFormatter *formatter =[[NSNumberFormatter alloc]init];
    [formatter setMaximumFractionDigits:2];
    [formatter setRoundingMode:NSNumberFormatterRoundDown];
    cell.productPrice.text=[NSString stringWithFormat:@"₹%@",[formatter stringFromNumber:[NSNumber numberWithDouble:product.price]]];
    
    [cell.addToCartButton addTarget:self action:@selector(addToCart:) forControlEvents:UIControlEventTouchUpInside];
    cell.addToCartButton.tag = [indexPath row];
    
    return cell;
}

-(void)loadProducts
{
    self.products = [Products listProducts];
    [productViewTable reloadData];
}

-(void)addToCart:(UIButton *)button
{
    Products *product =[self.products objectAtIndex:button.tag];
    BOOL success = [Cart addProduct:product];
    
    if (success) {
        /*
        [(AppDelegate *)[[UIApplication sharedApplication]delegate]updateCartTabBadge]
         */
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Add Product" message:@"Product added to cart" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];

    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
