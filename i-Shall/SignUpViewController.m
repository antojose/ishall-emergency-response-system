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
    coreDataControll = [[CoreDataController alloc] init];
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
#pragma mark - UITextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
#pragma mark - UIAlertView Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 123) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)alertViewCancel:(UIAlertView *)alertView{
    
}
@end
