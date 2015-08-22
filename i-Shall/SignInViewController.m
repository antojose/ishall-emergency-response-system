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
    HomeTabBarController * tabbar = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"HomeTabbar"];
    tabbar.selectedIndex = 0;
    [self.navigationController pushViewController:tabbar animated:YES];
    
}
@end
