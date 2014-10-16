//
//  ASOXScrollTableViewCellDelegate.h
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

#import <Foundation/Foundation.h>

/**
 The delegate of ASOXScrollTableViewCell object should adopt the ASOXScrollTableViewCellDelegate protocol. The delegate methods are set to optional but they are needed to manage the content item selections and configure the content item cell.
 */

@protocol ASOXScrollTableViewCellDelegate <NSObject>

@optional

/**
 Set the number of items in each horizontally scrolled row.
 
 @param horizontalScrollContentsView The Collection View of all Content Cells in each horizontally scrolled row.
 @param tableViewIndexPath The index path of ASOXScrollTableViewCell object related to its position in the tableView.
 
 @return Returns the number of item in the specified tableViewIndexPath.
 
 */
- (NSInteger)horizontalScrollContentsView:(UICollectionView *)horizontalScrollContentsView numberOfItemsInTableViewIndexPath:(NSIndexPath *)tableViewIndexPath;

/**
 Configure each item in the content-cell.
 
 @param horizontalScrollContentsView The Collection View of all Content Cells in each horizontally scrolled row.
 @param contentIndexPath The index path of content-cell object related to its position in the horizontalScrollContentsView.
 @param tableViewIndexPath The index path of ASOXScrollTableViewCell object related to its position in the tableView.
 
 @return Content-cell object
 */
- (UICollectionViewCell *)horizontalScrollContentsView:(UICollectionView *)horizontalScrollContentsView cellForItemAtContentIndexPath:(NSIndexPath *)contentIndexPath inTableViewIndexPath:(NSIndexPath *)tableViewIndexPath;

/**
 Manage the item selection.
 
 @param horizontalScrollContentsView The Collection View of all Content Cells in each horizontally scrolled row.
 @param contentIndexPath The index path of content-cell object related to its position in the horizontalScrollContentsView.
 @param tableViewIndexPath The index path of ASOXScrollTableViewCell object related to its position in the tableView.
 */
- (void)horizontalScrollContentsView:(UICollectionView *)horizontalScrollContentsView didSelectItemAtContentIndexPath:(NSIndexPath *)contentIndexPath inTableViewIndexPath:(NSIndexPath *)tableViewIndexPath;

@end
