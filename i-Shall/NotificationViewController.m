//
//  NotificationViewController.m
//  i-Shall
//
//  Created by Amruth on 22/08/15.
//  Copyright (c) 2015 Amruth. All rights reserved.
//

#import "NotificationViewController.h"
#import "NotificatinCell.h"

@implementation NotificationViewController
-(void)viewDidLoad{
    [self fetchNotifications];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [tbl_notification reloadData];
    lbl_addNotification.hidden = NO;
    btn_addNotification.hidden = YES;
}
-(void)fetchNotifications{
    
    if (arrayNotification == nil) {
        arrayNotification = [[NSMutableArray alloc] init];
    }
    coreDataControll = [[CoreDataController alloc] init];
    [arrayNotification removeAllObjects];
    [arrayNotification addObjectsFromArray:[[coreDataControll fetchNotification] mutableCopy]] ;
}
#pragma mark - button actions
- (IBAction)showAddNotification:(id)sender {
    UIButton * btn = (UIButton*)sender;
    if (btn.tag == 0) {
        topConstraint.constant = 0;
        [self.view layoutIfNeeded];
        btn.tag = 1;
        lbl_addNotification.hidden = YES;
        btn_addNotification.hidden = NO;
    }else{
        topConstraint.constant = -200;
        [self.view layoutIfNeeded];
        btn.tag = 0;
        lbl_addNotification.hidden = NO;
        btn_addNotification.hidden = YES;
    }
    
}

- (IBAction)addNotificationAction:(id)sender {
    coreDataControll = [[CoreDataController alloc] init];
    Notification * notificationObj = [[Notification alloc] init];
    notificationObj.strPlace = txt_street.text;
    notificationObj.strCity = txt_city.text;
    notificationObj.strLocation = txt_location.text;
    if ([coreDataControll addNotification:notificationObj]) {
        
        UIAlertView * alert= [[UIAlertView alloc] initWithTitle:@"iShall" message:@"Notification Added successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil] ;
        alert.tag = 123;
        [alert show];
    }else{
        UIAlertView * alert= [[UIAlertView alloc] initWithTitle:@"iShall" message:@"Notification  Add failed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil] ;
        alert.tag = 124;
        [alert show];
    }
//    [self fetchNotifications];
//    [tbl_notification reloadData];
}

#pragma mark - UITableView Delagate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (arrayNotification == nil) {
        return 0;
    }
    return arrayNotification.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NotificatinCell * cell = [tableView dequeueReusableCellWithIdentifier:@"notificationCell" forIndexPath:indexPath];
    [cell setCellWithData:((Notification*)[arrayNotification objectAtIndex:indexPath.row])];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    if ([delegate respondsToSelector:@selector(changeTabbarIndexWithData:)]) {
//        [delegate changeTabbarIndexWithData:((Notification*)[arrayNotification objectAtIndex:indexPath.row])];
//    }
    self.tabBarController.selectedIndex = 1;
    
}

#pragma mark - UItextFielddelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 123) {
        
        txt_street.text = @"";
        txt_location.text = @"";
        txt_city.text = @"";
        topConstraint.constant = -200;
        [self.view layoutIfNeeded];
        btn_showNotificationPanel.tag = 0;
        lbl_addNotification.hidden = NO;
        btn_addNotification.hidden = YES;
        [self fetchNotifications];
        [tbl_notification reloadData];
    }else{
        
    }
}
@end
