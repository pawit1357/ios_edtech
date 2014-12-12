//
//  SubMenuViewController.h
//  edtech
//
//  Created by ShinPleZ on 10/12/56 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IndexData.h"

@interface SubMenuViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView *table;
    IBOutlet UILabel *name1;
    IBOutlet UILabel *name2;
    IndexData *data;
}
-(IBAction)back:(id)sender;
-(void)initData:(IndexData *)_data;
@end
