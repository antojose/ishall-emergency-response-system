//
//  SignInViewController.m
//  i-Shall
//
//  Created by Amruth on 22/08/15.
//  Copyright (c) 2015 Amruth. All rights reserved.
//

#import "SignInViewController.h"
#import "HomeTabBarController.h"


@implementation SignInViewController
-(IBAction)signInAction:(id)sender{
    if ([coreDataControll signInActionForUserName:txt_username.text andPassword:txt_password.text]) {
        HomeTabBarController * tabbar = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"HomeTabbar"];
        tabbar.selectedIndex = 0;
        [self.navigationController pushViewController:tabbar animated:YES];
        
        
    }else{
        [[[UIAlertView alloc] initWithTitle:@"iShall" message:@"Username or password incorrect." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
    }
    
    
}
@end
