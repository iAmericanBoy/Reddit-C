//
//  DLPostDetailTableViewCell.m
//  Reddit-C
//
//  Created by Dominic Lanzillotta on 2/13/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

#import "DLPostDetailTableViewCell.h"
#import "DLPostController.h"

@implementation DLPostDetailTableViewCell

-(void)setPost:(DLPost *)post
{
    _post = post;
    [self updateViews];
}

-(void)updateViews
{

    if (self.post.SFW == true) {
        self.backgroundColor = UIColor.blackColor;
    } else {
        [DLPostController fetchImageForThumpnail:_post completion:^(UIImage * _Nullable pic) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = pic;
                self.upVaoteLabel.text = [NSString stringWithFormat: @" 👍🏻 %ld", self.post.upVotes];
                self.titleLabel.text = [NSString stringWithFormat: @"%@", self.post.title];
                self.commentNumberLabel.text = [NSString stringWithFormat: @" 🗣 %ld", self.post.numberOfComments ];
            });
        }];
    }
}

@end
