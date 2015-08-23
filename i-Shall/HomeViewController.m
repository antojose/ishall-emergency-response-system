//
//  HomeViewController.m
//  i-Shall
//
//  Created by Amruth on 22/08/15.
//  Copyright (c) 2015 Amruth. All rights reserved.
//

#import "HomeViewController.h"

@implementation HomeViewController
-(void)viewDidLoad{
    self.searchBar.hidden = YES;
}
- (IBAction)actionSave:(id)sender {
    self.searchBar.hidden = NO;
    self.bottomContraint.constant = -250;
    [self.view layoutIfNeeded];
}

@end
