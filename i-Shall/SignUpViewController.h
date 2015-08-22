//
//  SignUpViewController.h
//  i-Shall
//
//  Created by Amruth on 22/08/15.
//  Copyright (c) 2015 Amruth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataController.h"

@interface SignUpViewController : UIViewController<UIAlertViewDelegate>{
    
    IBOutlet UITextField *txt_username;
    IBOutlet UITextField *txt_password;
    IBOutlet UITextField *txt_mobile;
    IBOutlet UIButton * btn_signup;
    CoreDataController * coreDataControll;
}

@end
