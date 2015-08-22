//
//  CoreDataController.m
//  i-Shall
//
//  Created by Amruth on 22/08/15.
//  Copyright (c) 2015 Amruth. All rights reserved.
//

#import "CoreDataController.h"


@implementation CoreDataController
-(NSManagedObject*)coredataObjectContext{
    NSManagedObjectContext *context = [((AppDelegate*)[[UIApplication sharedApplication] delegate]) managedObjectContext];
    NSManagedObject *objectContext = [NSEntityDescription
                                       insertNewObjectForEntityForName:@"AccountsInfo"
                                       inManagedObjectContext:context];
    return objectContext;
}
-(BOOL)signUpActionForUserName:(NSString*)username withMobile:(NSString*)mobile andPassword:(NSString*)password{
    
    NSManagedObjectContext *context = [((AppDelegate*)[[UIApplication sharedApplication] delegate]) managedObjectContext];
    NSManagedObject *ishallAccountInfo = [self coredataObjectContext];
    [ishallAccountInfo setValue:username forKey:@"username"];
    [ishallAccountInfo setValue:password forKey:@"password"];
    [ishallAccountInfo setValue:mobile forKey:@"mobile"];
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
    NSManagedObject *ishallAccountInfo = [self coredataObjectContext];
    [ishallAccountInfo setValue:username forKey:@"username"];
    [ishallAccountInfo setValue:password forKey:@"password"];
    
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
        if ([usernameCheck isEqualToString:username]||[mobileCheck isEqualToString:username]) {
            
            if ([passwordCheck isEqualToString:password]) {
                valid = YES;
            }else{
                valid = NO;
            }
        }else{
            
            valid = NO;
        }
        
    }
    return valid;
}
@end
