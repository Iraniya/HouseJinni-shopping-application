//
//  UserDataModel.m
//  HouseJinni
//
//  Created by agile on 06/09/16.
//  Copyright © 2016 Iraniya. All rights reserved.
//

#import "UserDataModel.h"

@implementation UserDataModel

-(id)initWithData:(NSMutableDictionary*)userDictionary
{
    self=[super init];
    
    if (self) {
      self.userType  = [[userDictionary valueForKey:@"userType"] integerValue];
        self.userId    = [userDictionary valueForKey:@"userId"];
        self.userName  = [userDictionary valueForKey:@"userName"];
        self.firstName = [userDictionary valueForKey:@"firstName"];
        self.lastName  = [userDictionary valueForKey:@"lastName"];
        self.emailId   = [userDictionary valueForKey:@"emailId"];
        self.password  = [userDictionary valueForKey:@"password"];
    }
    
    return self;
}

@end
