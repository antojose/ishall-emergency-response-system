//
//  CoreDataController.h
//  i-Shall
//
//  Created by Amruth on 22/08/15.
//  Copyright (c) 2015 Amruth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "Notification.h"
#import "User.h"
@interface CoreDataController : NSObject{
    
    
}
-(BOOL)signInActionForUserName:(NSString*)username andPassword:(NSString*)password;
-(BOOL)signUpActionForUserName:(NSString*)username withMobile:(NSString*)mobile andPassword:(NSString*)password;
-(BOOL)addNotification:(Notification*)notificationObj;
-(NSArray*)fetchNotification;
@end
