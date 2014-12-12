//
//  FirstViewiPadController.m
//  edtech
//
//  Created by ShinPleZ on 11/3/2556 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import "FirstViewiPadController.h"

@interface FirstViewiPadController ()

@end

@implementation FirstViewiPadController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"home_iPad.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"home_r_iPad.png"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
