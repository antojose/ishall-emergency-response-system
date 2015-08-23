//
//  HomeTabBarController.m
//  i-Shall
//
//  Created by Amruth on 22/08/15.
//  Copyright (c) 2015 Amruth. All rights reserved.
//

#import "HomeTabBarController.h"

@implementation HomeTabBarController
-(void)viewDidLoad{
    [self.navigationItem setHidesBackButton:YES animated:YES];
}
-(void)changeTabbarIndexWithData:(Notification*)nofificationObject{
    self.selectedIndex = 1;
}
@end
