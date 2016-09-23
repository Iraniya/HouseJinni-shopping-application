//
//  UserDataModel.h
//  HouseJinni
//
//  Created by agile on 06/09/16.
//  Copyright © 2016 Iraniya. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum UserType:NSInteger
{
    UserTypeCustomer = 0, // default customer
    UserTypeSubAdmin = 1, // subAdmin
    UserTypeAdmin    = 2, // admin
}UserType;

@interface UserDataModel : NSObject
{
    NSMutableDictionary *userDetailsDictionary;
}
@property(nonatomic)UserType userType;
@property (nonatomic,strong) NSString *userName;
@property (nonatomic,strong) NSString *userId;
@property (nonatomic,strong) NSString *firstName;
@property (nonatomic,strong) NSString *lastName;
@property (nonatomic,strong) NSString *emailId;
@property (nonatomic,strong) NSString *password;
@property (nonatomic) NSInteger mobileNumber;

-(id)initWithData:(NSMutableDictionary*)userDictionary;
@end
