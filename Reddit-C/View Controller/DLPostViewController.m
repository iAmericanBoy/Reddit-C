//
//  DLPostViewController.m
//  Reddit-C
//
//  Created by Dominic Lanzillotta on 2/13/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

#import "DLPostViewController.h"
#import "DLPostDetailTableViewCell.h"
#import "DLPostController.h"

@interface DLPostViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic,readwrite)NSMutableArray<DLPost *> *postArray;

@end

@implementation DLPostViewController

-(void)setPostArray:(NSMutableArray<DLPost *> *)postArray
{
    _postArray = postArray;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.searchBar.delegate = self;
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    DLPostDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"postCell" forIndexPath:indexPath];
    
    cell.post = [_postArray objectAtIndex:indexPath.row ];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self postArray] count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [DLPostController fetchPostForSearchTerm:searchText completion:^(NSMutableArray<DLPost *> * _Nullable post) {
        self.postArray = post;
    }];
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

@end
