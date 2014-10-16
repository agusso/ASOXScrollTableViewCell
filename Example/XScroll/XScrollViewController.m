//
//  XScrollViewController.m
//  XScrollExample
//
//  Created by Agus Soedibjo on 02/10/2014.
//  Copyright (c) 2014 Agus Soedibjo. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "XScrollViewController.h"
#import "XScrollDataSourceAccess.h"
#import "XScrollItemsByCategory.h"
#import "XScrollViewCell.h"
#import "ASOXScrollTableViewCell.h"

@interface XScrollViewController () <ASOXScrollTableViewCellDelegate>

@end

@implementation XScrollViewController {
    
    NSArray *_xScrollDataSource;
    ASOXScrollTableViewCell *_xScrollTableViewCell;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Populate data source
    XScrollDataSourceMapping *itemsByCategoryKeys = [[XScrollDataSourceMapping alloc] initWithClassName:@"XScrollItemsByCategory" forKeys:@[@"category", @"xScrollItems"]];
    _xScrollDataSource = [NSArray arrayWithArray:[XScrollDataSourceAccess retrieveObjectsFromPath:@"xscrolldata" ofType:@"json" atRootKeyPath:@"result" forDataSourceMapping:itemsByCategoryKeys]];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Synchronize the height of each table row which hold the ASOXScrollTableViewCell.
    CGFloat result = _xScrollTableViewCell.contentCellSize.height;
    
    return result;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of category in the Data Source
    return [_xScrollDataSource count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return 1; // In this example only one row of horizontal scrolled contents view for each section.
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [[_xScrollDataSource objectAtIndex:section] category];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    
    _xScrollTableViewCell = [ASOXScrollTableViewCell tableView:tableView cellForRowInTableViewIndexPath:indexPath withReusableCellIdentifier:cellIdentifier delegate:self];
    
    return _xScrollTableViewCell;
}

#pragma mark - ASOXScrollTableViewCellDelegate

- (NSInteger)horizontalScrollContentsView:(UICollectionView *)horizontalScrollContentsView numberOfItemsInTableViewIndexPath:(NSIndexPath *)tableViewIndexPath {
    
    // Return the number of items in each category to be displayed on each ASOXScrollTableViewCell object
    return [[[_xScrollDataSource objectAtIndex:tableViewIndexPath.section] xScrollItems] count];
}

- (UICollectionViewCell *)horizontalScrollContentsView:(UICollectionView *)horizontalScrollContentsView cellForItemAtContentIndexPath:(NSIndexPath *)contentIndexPath inTableViewIndexPath:(NSIndexPath *)tableViewIndexPath {
    
    static NSString *cellIdentifier = @"XScrollViewCell";
    
    XScrollViewCell *cell = (XScrollViewCell *)[horizontalScrollContentsView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:contentIndexPath];
    
    UIImage *articleImageName = [UIImage imageNamed:[[[_xScrollDataSource objectAtIndex:tableViewIndexPath.section] xScrollItems] objectAtIndex:contentIndexPath.item]];
    
    cell.articleImage.image = articleImageName;

    return cell;
}

- (void)horizontalScrollContentsView:(UICollectionView *)horizontalScrollContentsView didSelectItemAtContentIndexPath:(NSIndexPath *)contentIndexPath inTableViewIndexPath:(NSIndexPath *)tableViewIndexPath {
    
    [horizontalScrollContentsView deselectItemAtIndexPath:contentIndexPath animated:YES]; // A custom behaviour in this example for removing highlight from the cell immediately after it had been selected
    
    NSLog(@"Section %ld Row %ld Item %ld is selected", (unsigned long)tableViewIndexPath.section, (unsigned long)tableViewIndexPath.row, (unsigned long)contentIndexPath.item);
}

@end
