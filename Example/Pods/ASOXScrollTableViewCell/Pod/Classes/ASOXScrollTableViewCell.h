//
//  ASOXScrollTableViewCell.h
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

#import <UIKit/UIKit.h>
#import "ASOXScrollTableViewCellDelegate.h"
/**
 The ASOXScrollTableViewCell class provides itself as the container of those contents/cells to be shown and horizontally scrolled in single row
 */

@protocol ASOXScrollTableViewCellDelegate;

@interface ASOXScrollTableViewCell : UITableViewCell

/**
 ASOXScrollTableViewCell delegate accessor.
 It is to invoke delegation methods defined in ASOXScrollTableViewCellDelegate
 */
@property (weak, nonatomic) id <ASOXScrollTableViewCellDelegate> delegate;

/**
 Control the Collection View of all Content Cells in each horizontally scrolled row
 */
@property (strong, nonatomic) UICollectionView *horizontalScrollContentsView;

/**
 Set the content cell Class Name
 */
@property (weak, nonatomic) NSString *contentCellClass;

/**
 Tell the size of Content Cell frame.
 Read-only property.
 */
@property (nonatomic, readonly) CGSize contentCellSize;

/**
 Store the table-view index path where each ASOXScrollTableViewCell object is attached to.
 */
@property (strong, nonatomic) NSIndexPath *tableViewIndexPath;

/**
 Instantiate and recycle the horizontalScrollContentView property as the container of all Content Cells in each single row
 
 @param tableView A table-view object where ASOXScrollTableViewCell object is attached to.
 @param tableViewIndexPath Set the index path of ASOXScrollTableViewCell object related to its position in the tableView.
 @param cellIdentifier Identify which cell to be reused. It must refer to the designated ASOXScrollTableViewCell with the same identifier.
 @param object Delegate object which will implement the ASOXScrollTableViewCell delegate methods.
 
 @return ASOXScrollTableViewCell object to be managed by its delegate class
 */
+ (ASOXScrollTableViewCell *)tableView:(UITableView *)tableView cellForRowInTableViewIndexPath:(NSIndexPath *)tableViewIndexPath withReusableCellIdentifier:(NSString *)cellIdentifier delegate:(id)object;

@end
