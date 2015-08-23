//
//  NotificationViewController.h
//  i-Shall
//
//  Created by Amruth on 22/08/15.
//  Copyright (c) 2015 Amruth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataController.h"
#import "Notification.h"
@protocol NotificationPageDelegate <NSObject>
-(void)changeTabbarIndexWithData:(Notification*)nofificationObject;
@end
@interface NotificationViewController : UIViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>{
    
    IBOutlet UITextField *txt_city;
    IBOutlet UITextField *txt_street;
    IBOutlet UITextField *txt_location;
    IBOutlet UILabel *lbl_addNotification;
    IBOutlet UIButton *btn_addNotification;
    
    IBOutlet UIButton *btn_showNotificationPanel;
    
    IBOutlet UITableView *tbl_notification;
    NSMutableArray * arrayNotification;
    CoreDataController * coreDataControll;
    IBOutlet NSLayoutConstraint *topConstraint;
    
}
@property (nonatomic, strong) id <NotificationPageDelegate> delegate;
@end
