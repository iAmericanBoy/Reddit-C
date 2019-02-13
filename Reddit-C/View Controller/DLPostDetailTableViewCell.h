//
//  DLPostDetailTableViewCell.h
//  Reddit-C
//
//  Created by Dominic Lanzillotta on 2/13/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLPost.h"

NS_ASSUME_NONNULL_BEGIN

@interface DLPostDetailTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *upVaoteLabel;

@property (nonatomic,readwrite)DLPost *post;


@end

NS_ASSUME_NONNULL_END
