//
//  DLPostController.m
//  Reddit-C
//
//  Created by Dominic Lanzillotta on 2/13/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

#import "DLPostController.h"

@implementation DLPostController

static NSString * const baseURlString = @"https://www.reddit.com/r/";

+ (void)fetchPostForSearchTerm:(NSString *)serchTerm completion:(void (^)(NSMutableArray<DLPost *> * _Nullable))completion
{
    NSURL *baseURL = [[NSURL alloc]initWithString:baseURlString];
    
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:[serchTerm lowercaseString]];
    
    NSURL *searchURLWithFileExtension = [searchURL URLByAppendingPathExtension:@"json"];
    
    NSLog(@"%@", searchURLWithFileExtension);
    
    NSMutableArray<DLPost *> *emptyArray = [NSMutableArray<DLPost *> new];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:searchURLWithFileExtension completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an Error in %s :%@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(emptyArray);
            return ;
        }
        if (response) {
            NSLog(@"%@",response);
        }
        
        if (data) {
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options: 0 error:&error];
            if (!topLevelDictionary) {
                NSLog(@"error parsing the JSON %@", error);
                completion(emptyArray);
                return;
            }
            
            NSArray *childArray = topLevelDictionary[@"data"][@"children"];
            
            NSMutableArray<DLPost *> *array = [NSMutableArray<DLPost *> new];

            for (NSDictionary* dicionary in childArray) {
                DLPost *newPost = [[DLPost alloc] initWithDictionary:dicionary[@"data"]];
                [array addObject:newPost];
            }
            completion(array);


        }
    }] resume];
}


+ (void)fetchImageForThumpnail:(DLPost *)post completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:post.thumbnailURLAsString];
    NSLog(@"%@",baseURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:baseURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an Error in %s :%@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(nil);
            return ;
        }
        if (response) {
            NSLog(@"%@",response);
        }
        
        if (data) {
            UIImage *cardpic = [[UIImage alloc] initWithData:data scale:1];
            completion(cardpic);
        }
    }] resume];
}
@end
