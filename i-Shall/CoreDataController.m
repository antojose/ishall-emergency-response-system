//
//  CoreDataController.m
//  i-Shall
//
//  Created by Amruth on 22/08/15.
//  Copyright (c) 2015 Amruth. All rights reserved.
//

#import "CoreDataController.h"
#import "Notification.h"


@implementation CoreDataController
-(NSManagedObject*)coredataObjectContextForEntityName:(NSString*)entity{
    NSManagedObjectContext *context = [((AppDelegate*)[[UIApplication sharedApplication] delegate]) managedObjectContext];
    NSManagedObject *objectContext = [NSEntityDescription
                                       insertNewObjectForEntityForName:entity
                                       inManagedObjectContext:context];
    return objectContext;
}
#pragma mark - sign in / sign up
-(BOOL)signUpActionForUserName:(NSString*)username withMobile:(NSString*)mobile andPassword:(NSString*)password{
    
    NSManagedObjectContext *context = [((AppDelegate*)[[UIApplication sharedApplication] delegate]) managedObjectContext];
    NSManagedObject *ishallAccountInfo = [self coredataObjectContextForEntityName:@"AccountsInfo"];
    [ishallAccountInfo setValue:username forKey:@"username"];
    [ishallAccountInfo setValue:password forKey:@"password"];
    [ishallAccountInfo setValue:mobile forKey:@"mobile"];
    [ishallAccountInfo setValue:@"1" forKey:@"level"];
    [ishallAccountInfo setValue:@"25" forKey:@"points"];
//    NSManagedObject *failedBankDetails = [NSEntityDescription
//                                          insertNewObjectForEntityForName:@"FailedBankDetails"
//                                          inManagedObjectContext:context];
//    [failedBankDetails setValue:[NSDate date] forKey:@"closeDate"];
//    [failedBankDetails setValue:[NSDate date] forKey:@"updateDate"];
//    [failedBankDetails setValue:[NSNumber numberWithInt:12345] forKey:@"zip"];
//    [failedBankDetails setValue:failedBankInfo forKey:@"info"];
//    [failedBankInfo setValue:failedBankDetails forKey:@"details"];
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        return NO;
    }
    
    return YES;
}
-(BOOL)signInActionForUserName:(NSString*)username andPassword:(NSString*)password{

    NSManagedObjectContext *context = [((AppDelegate*)[[UIApplication sharedApplication] delegate]) managedObjectContext];
//    NSManagedObject *ishallAccountInfo = [self coredataObjectContext];
//    [ishallAccountInfo setValue:username forKey:@"username"];
//    [ishallAccountInfo setValue:password forKey:@"password"];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"AccountsInfo" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    BOOL valid = NO;
    for (NSManagedObject *info in fetchedObjects) {
       
        NSString *usernameCheck = [info valueForKey:@"username"];
        NSString *mobileCheck = [info valueForKey:@"mobile"];
        NSString *passwordCheck = [info valueForKey:@"password"];
        NSString *points = [info valueForKey:@"points"];
        NSString *level = [info valueForKey:@"level"];
        
        if ([usernameCheck isEqualToString:username]||[mobileCheck isEqualToString:username]) {
            
            if ([passwordCheck isEqualToString:password]) {
                valid = YES;
                
                [[NSUserDefaults standardUserDefaults] setObject:usernameCheck forKey:@"username"];
                [[NSUserDefaults standardUserDefaults] setObject:mobileCheck forKey:@"mobile"];
                [[NSUserDefaults standardUserDefaults] setObject:points forKey:@"points"];
                [[NSUserDefaults standardUserDefaults] setObject:level forKey:@"level"];
                [[NSUserDefaults standardUserDefaults] synchronize];
            }else{
                valid = NO;
            }
        }else{
            
            valid = NO;
        }
        
    }
    return valid;
}

#pragma mark - Notification
-(BOOL)addNotification:(Notification*)notificationObj{
    NSManagedObjectContext *context = [((AppDelegate*)[[UIApplication sharedApplication] delegate]) managedObjectContext];
//    NSManagedObject *ishallNotificationInfo = [self coredataObjectContextForEntityName:@"NotificationInfo"];
    NSManagedObject *ishallNotificationModel= [self coredataObjectContextForEntityName:@"NotificationModel"];
    [ishallNotificationModel setValue:notificationObj.strPlace forKey:@"place"];
    [ishallNotificationModel setValue:notificationObj.strCity forKey:@"city"];
    [ishallNotificationModel setValue:notificationObj.strLocation forKey:@"location"];
    
//    [ishallNotificationInfo setValue:ishallNotificationModel forKey:@"notification"];
    
    //    NSManagedObject *failedBankDetails = [NSEntityDescription
    //                                          insertNewObjectForEntityForName:@"FailedBankDetails"
    //                                          inManagedObjectContext:context];
    //    [failedBankDetails setValue:[NSDate date] forKey:@"closeDate"];
    //    [failedBankDetails setValue:[NSDate date] forKey:@"updateDate"];
    //    [failedBankDetails setValue:[NSNumber numberWithInt:12345] forKey:@"zip"];
    //    [failedBankDetails setValue:failedBankInfo forKey:@"info"];
    //    [failedBankInfo setValue:failedBankDetails forKey:@"details"];
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        return NO;
    }
    
    return YES;
}
-(NSMutableArray*)fetchNotification{
    
    NSManagedObjectContext *context = [((AppDelegate*)[[UIApplication sharedApplication] delegate]) managedObjectContext];
    //    NSManagedObject *ishallAccountInfo = [self coredataObjectContext];
    //    [ishallAccountInfo setValue:username forKey:@"username"];
    //    [ishallAccountInfo setValue:password forKey:@"password"];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"NotificationModel" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    NSMutableArray * arrayNoyifications = [[NSMutableArray alloc] init];
    
    for (NSManagedObject *info in fetchedObjects) {
        
//        NSString *usernameCheck = [info valueForKey:@"city"];
//        NSString *mobileCheck = [info valueForKey:@"place"];
//        NSDictionary

//        NSManagedObject *subinfo = [info valueForKey:@"notification"];
        Notification * notificationObj = [[Notification alloc] init];
        notificationObj.strPlace= [info valueForKey:@"place"];
        notificationObj.strCity= [info valueForKey:@"city"];
        notificationObj.strLocation= [info valueForKey:@"location"];
        [arrayNoyifications addObject:notificationObj];
        
//        NSDictionary *passwordCheck = [info valueForKey:@"location"];
        
        
    }
    return arrayNoyifications;
}
@end
