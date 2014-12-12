//
//  SecondViewiPadController.m
//  edtech
//
//  Created by ShinPleZ on 11/3/2556 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import "SecondViewiPadController.h"
#import "CustomIndex_iPadCell.h"
#import "Details_iPadViewController.h"
#import "IndexData.h"
#import "SubMenu_iPadViewController.h"


@interface SecondViewiPadController ()

@end

@implementation SecondViewiPadController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"index_iPad.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"index_r_iPad.png"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    parser = [[XMLParser alloc] initParserXML:@"index"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [parser.dataContainer count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"CustomCell";
    
    CustomIndex_iPadCell *cell = (CustomIndex_iPadCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomIndex_iPadCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    IndexData *indexData = [parser.dataContainer objectAtIndex:indexPath.row];
    [cell.issue setText:indexData.name];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    IndexData *indexData = [parser.dataContainer objectAtIndex:indexPath.row];
    if([indexData.titleContainer count] != 0)
    {
        SubMenu_iPadViewController *sMenu = [[SubMenu_iPadViewController alloc] initWithNibName:@"SubMenu_iPadViewController" bundle:nil];
        [sMenu initData:indexData];
        [self.navigationController pushViewController:sMenu animated:YES];
    }
    else
    {
        Details_iPadViewController *sView = [[Details_iPadViewController alloc] initWithNibName:@"Details_iPadViewController" bundle:nil];
        NSLog(@"content = %@",indexData.content);
        NSArray* foo = [indexData.content componentsSeparatedByString: @".html"];
        NSString* name = [foo objectAtIndex: 0];
        NSLog(@"name = %@",name);
        [sView initFilename:name with:indexData.name];
        [self.navigationController pushViewController:sView animated:YES];
    }
}
@end
