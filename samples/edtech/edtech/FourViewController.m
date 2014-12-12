//
//  FourViewController.m
//  edtech
//
//  Created by ShinPleZ on 10/4/56 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import "FourViewController.h"
#import "CustomARCell.h"
@interface FourViewController ()

@end

@implementation FourViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"ar.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"ar_r.png"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (void)viewDidAppear:(BOOL)animated
{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"VideoPlay://"]]) {
        // Safe to launch the facebook app
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"VideoPlay://"]];
    }
    else
    {
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Augmented Reality" message:@"You need to download MUICVideoPlay application to use this feature" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
        [alertview show];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"CustomCell";
    
    CustomARCell *cell = (CustomARCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomARCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"VideoPlay://"]];
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tech://"]];
}

@end
