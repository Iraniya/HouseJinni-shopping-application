//
//  HomeCollectionViewController.h
//  HouseJinni
//
//  Created by Jaydeep Solanki on 22/01/17.
//  Copyright © 2017 Iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCollectionViewController : UICollectionViewController<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSArray *recipePhotos;
}
@property (nonatomic,strong) NSMutableArray* displayImages;

@end
