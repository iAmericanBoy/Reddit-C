//
//  Post.h
//  Reddit-C
//
//  Created by Dominic Lanzillotta on 2/13/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLPost : NSObject

@property(nonatomic,readonly,copy)NSString *title;
@property(nonatomic,readonly)NSInteger upVotes;
@property(nonatomic,readonly)NSInteger downVotes;
@property(nonatomic,readonly)NSInteger numberOfComments;

-(instancetype)initWithTitle:(NSString *)title
                     upVotes:(NSInteger )ups
                   downVotes:(NSInteger )downs
            numberOfComments:(NSInteger )numberOfComments;
@end

@interface DLPost  (JSONConvertable)

-(instancetype) initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end
NS_ASSUME_NONNULL_END
