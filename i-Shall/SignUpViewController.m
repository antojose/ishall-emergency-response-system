//
//  SignUpViewController.m
//  i-Shall
//
//  Created by Amruth on 22/08/15.
//  Copyright (c) 2015 Amruth. All rights reserved.
//

#import "SignUpViewController.h"

@implementation SignUpViewController
-(IBAction)signupAction:(id)sender{
    if ([coreDataControll signUpActionForUserName:txt_username.text withMobile:txt_mobile.text andPassword:txt_password.text]) {
        UIAlertView * alert=
        [[UIAlertView alloc] initWithTitle:@"iShall" message:@"Sign up success" delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil] ;
        alert.tag = 123;
        [alert show];
        
    }else{
        UIAlertView * alert=
        [[UIAlertView alloc] initWithTitle:@"iShall" message:@"Sign up Failed. Username already exist." delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil] ;
        alert.tag = 124;
        [alert show];
    }
}
#pragma mark - UIAlertView Delegate
- (void)alertViewCancel:(UIAlertView *)alertView{
    if (alertView.tag == 123) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
