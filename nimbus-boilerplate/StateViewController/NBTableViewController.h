//
//  NBTableViewController.h
//  zebra-fitness-iphone
//
//  Created by Yevhene Shemet on 22.02.12.
//  Copyright (c) 2012 Componentix. All rights reserved.
//

#import "NBModelViewController.h"


@interface NBTableViewController : NBModelViewController <UITableViewDelegate> {
@protected
    UITableView *_tableView;
}

@property(nonatomic, retain) id<UITableViewDataSource> model;

@property(nonatomic, retain, readonly) UITableView *tableView;

@end
