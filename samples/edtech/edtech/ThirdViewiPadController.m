//
//  ThirdViewiPadController.m
//  edtech
//
//  Created by ShinPleZ on 11/3/2556 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import "ThirdViewiPadController.h"
#import "CustomMedia_iPadCell.h"
#import "MediaParser.h"
#import "MediaData.h"

@interface ThirdViewiPadController ()

@end

@implementation ThirdViewiPadController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"media_iPad.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"media_r_iPad.png"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    mediaParser = [[MediaParser alloc] initMediaParserXML:@"media"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [mediaParser.dataContainer count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"CustomCell";
    
    CustomMedia_iPadCell *cell = (CustomMedia_iPadCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomMedia_iPadCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    MediaData *mediaData = [mediaParser.dataContainer objectAtIndex:indexPath.row];
    [cell.description setText:mediaData.mediaDescription];
    [cell.image setImage:[UIImage imageNamed:mediaData.mediaImage]];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MediaData *mediaData = [mediaParser.dataContainer objectAtIndex:indexPath.row];
    NSArray* foo = [mediaData.mediaSource componentsSeparatedByString: @".mp4"];
    NSString* filename = [foo objectAtIndex: 0];
    NSLog(@"filename = %@",filename);
    
    NSString *videoPath = [[NSBundle mainBundle] pathForResource:filename ofType:@"mp4"];
    NSURL *streamURL = [NSURL fileURLWithPath:videoPath];
    NSLog(@"streamURL = %@",streamURL);
    self.player = [[MPMoviePlayerController alloc] initWithContentURL: streamURL];
    [self.player prepareToPlay];
    [self.view addSubview: self.player.view];
    [self.player setFullscreen:YES animated:YES];
    
}

@end
