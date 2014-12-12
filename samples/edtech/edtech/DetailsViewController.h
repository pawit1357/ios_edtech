//
//  DetailsViewController.h
//  edtech
//
//  Created by ShinPleZ on 10/12/56 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsViewController : UIViewController<UIWebViewDelegate>
{
    IBOutlet UILabel *name1;
    IBOutlet UILabel *name2;
    IBOutlet UIWebView *webview;
    NSString *filename;
    NSString *chaptername;
}
-(IBAction)back:(id)sender;
-(IBAction)share:(id)sender;
-(void)initFilename:(NSString *)_filename with:(NSString *)_chaptername;
@end
