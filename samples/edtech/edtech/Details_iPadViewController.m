//
//  Details_iPadViewController.m
//  edtech
//
//  Created by ShinPleZ on 11/3/2556 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import "Details_iPadViewController.h"

@interface Details_iPadViewController ()

@end

@implementation Details_iPadViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    webview.delegate = self;
    NSString *urlStr = [[NSBundle mainBundle] pathForResource:filename ofType:@"html"];
    NSLog(@"urlStr = %@",urlStr);
    NSURL *url = [NSURL fileURLWithPath:urlStr];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [webview loadRequest:request];
    [name1 setText:chaptername];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)initFilename:(NSString *)_filename with:(NSString *)_chaptername
{
    filename = _filename;
    chaptername = _chaptername;
}
@end
