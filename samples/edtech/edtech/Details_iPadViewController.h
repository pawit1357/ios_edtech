//
//  Details_iPadViewController.h
//  edtech
//
//  Created by ShinPleZ on 11/3/2556 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Details_iPadViewController : UIViewController<UIWebViewDelegate>
{
    IBOutlet UILabel *name1;
    IBOutlet UILabel *name2;
    IBOutlet UIWebView *webview;
    NSString *filename;
    NSString *chaptername;
}
-(IBAction)back:(id)sender;
-(void)initFilename:(NSString *)_filename with:(NSString *)_chaptername;
@end
