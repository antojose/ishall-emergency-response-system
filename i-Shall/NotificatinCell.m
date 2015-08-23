//
//  NotificatinCell.m
//  i-Shall
//
//  Created by Amruth on 23/08/15.
//  Copyright (c) 2015 Amruth. All rights reserved.
//

#import "NotificatinCell.h"

@implementation NotificatinCell
-(void)setCellWithData:(Notification*)notificationObj{
    self.lbl_place.text = notificationObj.strPlace;
    self.lbl_city.text = notificationObj.strCity;
}
@end
