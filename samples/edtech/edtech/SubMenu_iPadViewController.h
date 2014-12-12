//
//  SubMenu_iPadViewController.h
//  edtech
//
//  Created by ShinPleZ on 11/3/2556 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IndexData.h"

@interface SubMenu_iPadViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *table;
    IBOutlet UILabel *name1;
    IBOutlet UILabel *name2;
    IndexData *data;
}
-(IBAction)back:(id)sender;
-(void)initData:(IndexData *)_data;
@end
