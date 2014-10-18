# XScroll

This App shows the implementation of ASOXScrollTableViewCell library.

## How To

### Integrate the library

Add these lines in the Podfile:

``` ruby
pod 'ASOXScrollTableViewCell'
```

### Content Cell
Create a subclass of UICollectionViewCell as your own customisable `Content Cell` and define its `Reusable Cell Identifier`.

![ASOXScrollTableViewCell `Content Cell` xib preview](https://raw.githubusercontent.com/wiki/agusso/ASOXScrollTableViewCell/Assets/ASOXScrollTableViewCell-contentcell-xib.png)

### Storyboard

#### Table View Cell
Define ASOXScrollTableViewCell as the Class of the intended Table View Cell and set the `contentCellClass’ key in the ‘User Defined Runtime Attributes’ to the name of `Content Cell` Class.

![ASOXScrollTableViewCell storyboard preview](https://raw.githubusercontent.com/wiki/agusso/ASOXScrollTableViewCell/Assets/ASOXScrollTableViewCell-tableviewcell-storyboard.png)

![ASOXScrollTableViewCell identifier storyboard preview](https://raw.githubusercontent.com/wiki/agusso/ASOXScrollTableViewCell/Assets/ASOXScrollTableViewCell-tableviewcell-identifier-storyboard.png)

### Implementation

Set the designated View Controller as the delegate of `ASOXScrollTableViewCell` class. If your View Controller is not a Subclass of UITableViewController, set it explicitly as the delegate of ‘UITableViewDelegate’ and UITableViewDataSource’ too.  

``` objectivec
#import <ASOXScrollTableViewCell.h>

@interface XScrollViewController : UITableViewController <ASOXScrollTableViewCellDelegate>

```

#### Implement the UITableViewDelegate and UITableViewDataSource delegate methods

* Instantiate and recycle an ASOXScrollTableViewCell object on each Table View row. Use the same ‘Reusable Cell Identifier’ defined on the Storyboard previously.

``` objectivec
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    
    _xScrollTableViewCell = [ASOXScrollTableViewCell tableView:tableView cellForRowInTableViewIndexPath:indexPath withReusableCellIdentifier:cellIdentifier delegate:self];
    
    return _xScrollTableViewCell;
}
```

Set below delegate methods accordingly.

``` objectivec
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
 
   // Return the number section in Table View
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
   // Return the number of rows in the section.
    
}
```

* Feed the ASOXScrollTableViewCell’s height with the height of `contentCellSize` of `Content Cell`. This way when we modify the `Content Cell’ height in its Xib, the height of the ASOXScrollTableViewCell row will follow dynamically.

``` objectivec
#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Synchronize the height of each table row which hold the ASOXScrollTableViewCell.
    CGFloat result = _xScrollTableViewCell.contentCellSize.height;
    
    return result;
}
```

#### Implement the ASOXScrollTableViewCell delegate methods in the designated View Controller.

* Set the number of `Content Cell` on each ASOXScrollTableViewCell object

``` objectivec
- (NSInteger)horizontalScrollContentsView:(UICollectionView *)horizontalScrollContentsView numberOfItemsInTableViewIndexPath:(NSIndexPath *)tableViewIndexPath {
    
    // Return the number of items/‘Content Cell’ in each ASOXScrollTableViewCell object

}
```

* Configure each item in `Content Cell` and use the same ‘Reusable Cell Identifier’ defined in the `Content Cell` xib previously.

``` objectivec
- (UICollectionViewCell *)horizontalScrollContentsView:(UICollectionView *)horizontalScrollContentsView cellForItemAtContentIndexPath:(NSIndexPath *)contentIndexPath inTableViewIndexPath:(NSIndexPath *)tableViewIndexPath {
    
    static NSString *cellIdentifier = @"XScrollViewCell";
    
    XScrollViewCell *cell = (XScrollViewCell *)[horizontalScrollContentsView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:contentIndexPath];
    
    // Configure the Content Cell

    return cell;
}
```

* Manage each selection of the `Content Cell`

``` objectivec
- (void)horizontalScrollContentsView:(UICollectionView *)horizontalScrollContentsView didSelectItemAtContentIndexPath:(NSIndexPath *)contentIndexPath inTableViewIndexPath:(NSIndexPath *)tableViewIndexPath {
    
    // Manage the ‘Content Cell’ selection
    NSLog(@"Section %ld Row %ld Item %ld is selected", (unsigned long)tableViewIndexPath.section, (unsigned long)tableViewIndexPath.row, (unsigned long)contentIndexPath.item);
}
```

## Getting Help

If you need help using `ASOXScrollTableViewCell`, please post a question on [StackOverflow with the “ASOXScrollTableViewCell” tag](http://stackoverflow.com/questions/ask?tags=asoxscrolltableviewcell).

If you think you found a problem with `ASOXScrollTableViewCell`, please [post an issue](https://github.com/agusso/ASOXScrollTableViewCell/issues). A sample project or fork of any of the examples demonstrating the problem will be helpful.

## Author
Agus Soedibjo. Copyright (c) 2014 Agus Soedibjo, contact@soedibjo.com

## License

`ASOXScrollTableViewCell` is available under the MIT license. See the LICENSE file for more info.
