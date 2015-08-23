//
//  ProfileViewController.h
//  i-Shall
//
//  Created by Amruth on 22/08/15.
//  Copyright (c) 2015 Amruth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileCell.h"
@interface ProfileViewController: UIViewController<UITableViewDataSource,UITableViewDelegate> {
    NSUserDefaults * userDefaults;
}
@property (strong, nonatomic) IBOutlet UILabel *lblLevel;
@property (strong, nonatomic) IBOutlet UILabel *lbl_points;
@property (strong, nonatomic) IBOutlet UILabel *lbl_name;


@end
