//
//  ThirdViewController.m
//  edtech
//
//  Created by ShinPleZ on 10/4/56 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import "ThirdViewController.h"
#import "CustomMediaCell.h"
#import "MediaParser.h"
#import "MediaData.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"media.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"media_r.png"]];
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
    
    CustomMediaCell *cell = (CustomMediaCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomMediaCell" owner:self options:nil];
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
    return 200;
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
