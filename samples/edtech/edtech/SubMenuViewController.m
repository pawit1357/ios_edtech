//
//  SubMenuViewController.m
//  edtech
//
//  Created by ShinPleZ on 10/12/56 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import "SubMenuViewController.h"
#import "CustomCell.h"
#import "subData.h"
#import "DetailsViewController.h"

@interface SubMenuViewController ()

@end

@implementation SubMenuViewController

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
    static NSString *simpleTableIdentifier = @"CustomCell";
    
    CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    subData *titleData = [data.titleContainer objectAtIndex:indexPath.row];
    [cell.name setText:titleData.nameSub];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailsViewController *sView = [[DetailsViewController alloc] initWithNibName:@"DetailsViewController" bundle:nil];
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
