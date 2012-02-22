//
//  NBModelViewController.h
//  zebra-fitness-iphone
//
//  Created by Yevhene Shemet on 22.02.12.
//  Copyright (c) 2012 Componentix. All rights reserved.
//

#import "NBStateViewController.h"

#import "NIOperations.h"


@interface NBModelViewController : NBStateViewController {
@protected
    id _model;
}

@property(nonatomic, retain) id model;

- (void)reload;

// Override point.
- (NIOperation *)createReloadOperation;

// Override point.
- (void)createModelWithOperationResults:(NIOperation *)operation;

// Override point.
- (BOOL)modelIsEmpty;

@end
