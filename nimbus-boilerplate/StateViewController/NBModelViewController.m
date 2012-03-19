//
//  NBModelViewController.m
//  zebra-fitness-iphone
//
//  Created by Yevhene Shemet on 22.02.12.
//  Copyright (c) 2012 Componentix. All rights reserved.
//

#import "NBModelViewController.h"


@implementation NBModelViewController

@synthesize model = _model;

- (void)viewDidLoad {
    [super viewDidLoad];

    [self reload];
}

- (void)reload {
    if (self.state == NBViewControllerStateLoading) {
        return;
    }
    self.error = nil;
    [self didStartLoading];

    NBModelViewController *viewController = self;
    NIOperation *reloadOperation = [self createReloadOperation];
    reloadOperation.didFinishBlock = ^void(NIOperation *operation) {
        [viewController createModelWithOperationResults:operation];
        if (viewController.error) {
            [viewController didFailLoadingWithError];
        } else if ([self modelIsEmpty]) {
            [viewController didFinishLoadingAndEmpty];
        } else {
            [viewController didFinishLoading];
        }
    };
    reloadOperation.didFailWithErrorBlock = ^void(NIOperation *operation, NSError *error) {
        viewController.error = error;
        NSLog(@"%@", error);
        [viewController didFailLoadingWithError];
    };
    [reloadOperation performSelectorInBackground:@selector(start) withObject:nil];
}

- (NIOperation *)createReloadOperation {
    // Override point.
    return nil;
}

- (void)createModelWithOperationResults:(NIOperation *)operation {
    // Override point.
}

- (BOOL)modelIsEmpty {
    // Override point.
    return NO;
}

@end
