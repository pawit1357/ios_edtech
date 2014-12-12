//
//  CustomMedia_iPadCell.h
//  edtech
//
//  Created by ShinPleZ on 11/3/2556 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomMedia_iPadCell : UITableViewCell
{
    IBOutlet UILabel *description;
    IBOutlet UIImageView *image;
}
@property(nonatomic , retain)IBOutlet UILabel *description;
@property(nonatomic , retain)IBOutlet UIImageView *image;

@end
