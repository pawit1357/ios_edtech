//
//  FourViewiPadController.m
//  edtech
//
//  Created by ShinPleZ on 11/3/2556 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import "FourViewiPadController.h"
#import "CustomAR_iPadCell.h"

@interface FourViewiPadController ()

@end

@implementation FourViewiPadController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"ar_iPad.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"ar_r_iPad.png"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}
- (void)viewDidAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"VideoPlay://"]];
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
    
    CustomAR_iPadCell *cell = (CustomAR_iPadCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomAR_iPadCell" owner:self options:nil];
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
