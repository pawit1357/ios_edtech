//
//  SubMenu_iPadViewController.m
//  edtech
//
//  Created by ShinPleZ on 11/3/2556 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import "SubMenu_iPadViewController.h"
#import "CustomIndex_iPadCell.h"
#import "subData.h"
#import "Details_iPadViewController.h"

@interface SubMenu_iPadViewController ()

@end

@implementation SubMenu_iPadViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)initData:(IndexData *)_data
{
    data = _data;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"titleContainer count = %d",[data.titleContainer count]);
    return [data.titleContainer count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"CustomIndex_iPadCell";
    
    CustomIndex_iPadCell *cell = (CustomIndex_iPadCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomIndex_iPadCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    subData *titleData = [data.titleContainer objectAtIndex:indexPath.row];
    [cell.issue setText:titleData.nameSub];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Details_iPadViewController *sView = [[Details_iPadViewController alloc] initWithNibName:@"Details_iPadViewController" bundle:nil];
    subData *titleData = [data.titleContainer objectAtIndex:indexPath.row];
    NSArray* foo = [titleData.contentSub componentsSeparatedByString: @".html"];
    NSString* name = [foo objectAtIndex: 0];
    NSLog(@"name = %@",name);
    [sView initFilename:name with:titleData.nameSub];
    [self.navigationController pushViewController:sView animated:YES];
}
-(IBAction)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
