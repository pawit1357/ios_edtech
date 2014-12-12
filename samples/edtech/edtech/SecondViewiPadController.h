//
//  SecondViewiPadController.h
//  edtech
//
//  Created by ShinPleZ on 11/3/2556 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLParser.h"

@interface SecondViewiPadController : UIViewController
{
    IBOutlet UITableView *table;
    XMLParser *parser;
}

@end
