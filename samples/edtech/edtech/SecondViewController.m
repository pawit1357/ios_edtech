//
//  SecondViewController.m
//  edtech
//
//  Created by ShinPleZ on 10/4/56 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import "SecondViewController.h"
#import "CustomCell.h"
#import "DetailsViewController.h"
#import "IndexData.h"
#import "SubMenuViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"index.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"index_r.png"]];
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
    
    CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    IndexData *indexData = [parser.dataContainer objectAtIndex:indexPath.row];
    [cell.name setText:indexData.name];
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
        SubMenuViewController *sMenu = [[SubMenuViewController alloc] initWithNibName:@"SubMenuViewController" bundle:nil];
        [sMenu initData:indexData];
        [self.navigationController pushViewController:sMenu animated:YES];
    }
    else
    {
        DetailsViewController *sView = [[DetailsViewController alloc] initWithNibName:@"DetailsViewController" bundle:nil];
        NSLog(@"content = %@",indexData.content);
        NSArray* foo = [indexData.content componentsSeparatedByString: @".html"];
        NSString* name = [foo objectAtIndex: 0];
        NSLog(@"name = %@",name);
        [sView initFilename:name with:indexData.name];
        [self.navigationController pushViewController:sView animated:YES];
    }
}
@end
