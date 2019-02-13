//
//  Post.m
//  Reddit-C
//
//  Created by Dominic Lanzillotta on 2/13/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

#import "DLPost.h"

@implementation DLPost
- (instancetype)initWithTitle:(NSString *)title upVotes:(NSInteger)ups downVotes:(NSInteger)downs numberOfComments:(NSInteger)numberOfComments
{
    self = [super init];
    if(self) {
        _title = title;
        _upVotes = ups;
        _downVotes = downs;
        _numberOfComments = numberOfComments;
    }
    return self;
}
@end

@implementation DLPost  (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
//    NSArray *childArray = dictionary[@"data"][@"children"];
    
    NSString *title = dictionary[@"title"];
    NSInteger ups = [dictionary[@"ups"] integerValue];
    NSInteger downs = [dictionary[@"downs"] integerValue];
    NSInteger comments = [dictionary[@"num_comments"] integerValue];
    
    return [self initWithTitle:title upVotes:ups downVotes:downs numberOfComments:comments];
}

@end
