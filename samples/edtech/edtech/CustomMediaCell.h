//
//  CustomMediaCell.h
//  edtech
//
//  Created by ShinPleZ on 10/4/56 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomMediaCell : UITableViewCell
{
    IBOutlet UILabel *description;
    IBOutlet UIImageView *image;
}
@property(nonatomic , retain)IBOutlet UILabel *description;
@property(nonatomic , retain)IBOutlet UIImageView *image;

@end
