//
//  DLPostController.h
//  Reddit-C
//
//  Created by Dominic Lanzillotta on 2/13/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DLPost.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLPostController : NSObject

+(void)fetchPostForSearchTerm:(NSString *)serchTerm
                 completion:(void (^_Nullable) (NSMutableArray<DLPost *> *_Nullable card))completion;
+(void)fetchImageForThumpnail:(DLPost *)post
              completion:(void (^_Nullable) (UIImage *_Nullable pic))completion;

@end

NS_ASSUME_NONNULL_END
