//
//  NBTableViewController.m
//  zebra-fitness-iphone
//
//  Created by Yevhene Shemet on 22.02.12.
//  Copyright (c) 2012 Componentix. All rights reserved.
//

#import "NBTableViewController.h"


@implementation NBTableViewController

- (id<UITableViewDataSource>)model {
    return _model;
}

- (void)setModel:(id<UITableViewDataSource>)model {
    if (_model != model) {
        [_model release];
        _model = [model retain];
        self.tableView.dataSource = self.model;
        [self.tableView reloadData];
    }
}

- (void)loadView {
    [super loadView];

    [self tableView];
}

- (void)viewDidUnload {
    [super viewDidUnload];

    _tableView = nil;
}

- (BOOL)modelIsEmpty {
    if (!self.model) {
        return NO;
    }
    NSUInteger sections = 1;
    if ([self.model respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
        sections = [self.model numberOfSectionsInTableView:self.tableView];
    }
    NSUInteger items = 0;
    for (NSUInteger i = 0; i < sections; ++i) {
        items += [self.model tableView:self.tableView numberOfRowsInSection:i];
    }
    return !items;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[[UITableView alloc] initWithFrame:self.view.bounds
                                                   style:UITableViewStylePlain] autorelease];
        _tableView.delegate = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

@end
