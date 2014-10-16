//
//  ASOXScrollTableViewCell.m
//  XScrollExample
//
//  Created by Agus Soedibjo on 08/10/2014.
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

#import "ASOXScrollTableViewCell.h"

@interface ASOXScrollTableViewCell () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, readwrite) CGSize contentCellSize;

@end

@implementation ASOXScrollTableViewCell

+ (ASOXScrollTableViewCell *)tableView:(UITableView *)tableView cellForRowInTableViewIndexPath:(NSIndexPath *)tableViewIndexPath withReusableCellIdentifier:(NSString *)cellIdentifier delegate:(id)object {
    
    ASOXScrollTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:tableViewIndexPath];
    
    cell.delegate = object;
    cell.tableViewIndexPath = tableViewIndexPath;
    
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
    UICollectionViewCell *horizontalCollectionViewCell = [[[NSBundle mainBundle] loadNibNamed:self.contentCellClass owner:self options:nil] lastObject];
    
    self.contentCellSize = CGSizeMake(horizontalCollectionViewCell.frame.size.width, horizontalCollectionViewCell.frame.size.height);
    
    UICollectionViewFlowLayout *horizontalScrollLayout = [UICollectionViewFlowLayout new];
    horizontalScrollLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    horizontalScrollLayout.minimumLineSpacing = 0.0f;
    horizontalScrollLayout.itemSize = CGSizeMake(horizontalCollectionViewCell.frame.size.width, horizontalCollectionViewCell.frame.size.height);
    
    self.horizontalScrollContentsView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:horizontalScrollLayout];
    UINib *contentCellViewNib = [UINib nibWithNibName:self.contentCellClass bundle:nil];
    [self.horizontalScrollContentsView registerNib:contentCellViewNib forCellWithReuseIdentifier:self.contentCellClass];
    self.horizontalScrollContentsView.backgroundColor = [UIColor whiteColor];
    self.horizontalScrollContentsView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:self.horizontalScrollContentsView];
    
    self.horizontalScrollContentsView.dataSource = self;
    self.horizontalScrollContentsView.delegate = self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect horizontalScrollContentsViewFrameRect = CGRectMake(self.contentView.bounds.origin.x, self.contentView.bounds.origin.y, self.contentView.bounds.size.width, self.contentCellSize.height);
    self.horizontalScrollContentsView.frame = horizontalScrollContentsViewFrameRect;
}

#pragma mark - UICollectionView data source

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.delegate horizontalScrollContentsView:collectionView numberOfItemsInTableViewIndexPath:self.tableViewIndexPath];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return[self.delegate horizontalScrollContentsView:collectionView cellForItemAtContentIndexPath:indexPath inTableViewIndexPath:self.tableViewIndexPath];
}

#pragma mark - UICollectionView delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate horizontalScrollContentsView:collectionView didSelectItemAtContentIndexPath:indexPath inTableViewIndexPath:self.tableViewIndexPath];
}

@end
