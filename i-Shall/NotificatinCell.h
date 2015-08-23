//
//  NotificatinCell.h
//  i-Shall
//
//  Created by Amruth on 23/08/15.
//  Copyright (c) 2015 Amruth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Notification.h"
@interface NotificatinCell : UITableViewCell
-(void)setCellWithData:(Notification*)notificationObj;
@property (nonatomic, strong) IBOutlet UILabel * lbl_place;
@property (nonatomic, strong) IBOutlet UILabel * lbl_city;
@end
