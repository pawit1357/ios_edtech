//
//  ThirdViewiPadController.h
//  edtech
//
//  Created by ShinPleZ on 11/3/2556 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MediaParser.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface ThirdViewiPadController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView *table;
    MediaParser *mediaParser;
}
@property(strong,nonatomic)MPMoviePlayerController *player;

@end
