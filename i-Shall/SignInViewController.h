//
//  SignInViewController.h
//  i-Shall
//
//  Created by Amruth on 22/08/15.
//  Copyright (c) 2015 Amruth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataController.h"

@interface SignInViewController : UIViewController<UITextFieldDelegate>{
     IBOutlet UITextField *txt_username;
     IBOutlet UITextField *txt_password;
     IBOutlet UIButton *btn_signin;
     IBOutlet UIButton *btn_signup;
    CoreDataController * coreDataControll;
}

@end
