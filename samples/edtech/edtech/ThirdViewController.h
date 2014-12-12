//
//  ThirdViewController.h
//  edtech
//
//  Created by ShinPleZ on 10/4/56 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MediaParser.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface ThirdViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView *table;
    MediaParser *mediaParser;
}
@property(strong,nonatomic)MPMoviePlayerController *player;
@end
