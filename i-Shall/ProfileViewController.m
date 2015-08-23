//
//  ProfileViewController.m
//  i-Shall
//
//  Created by Amruth on 22/08/15.
//  Copyright (c) 2015 Amruth. All rights reserved.
//

#import "ProfileViewController.h"

@implementation ProfileViewController
-(void)viewDidLoad{
    self.lblLevel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"level"];
    self.lbl_points.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"points"];
}
-(void)viewDidAppear:(BOOL)animated{
    
}
#pragma mark - UITableView Delagate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    int count = 0;
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"username"] isKindOfClass:[NSString class]]) {
        count +=1;
    }
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"mobile"] isKindOfClass:[NSString class]]) {
        count +=1;
    }
    
    return count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    ProfileCell * cell = [tableView dequeueReusableCellWithIdentifier:@"profileCell" forIndexPath:indexPath];
    if (indexPath.row ==0) {
        cell.lbl_item.text = @"Username";
        cell.lbl_text.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    }
    if (indexPath.row ==1) {
        cell.lbl_item.text = @"Mobile";
        cell.lbl_text.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"mobile"];
    }
    
    
    return cell;
}
@end
