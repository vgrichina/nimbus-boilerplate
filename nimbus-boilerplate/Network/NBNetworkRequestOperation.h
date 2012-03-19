//
//  NBNetworkRequestOperation.h
//  zebra-fitness-iphone
//
//  Created by Yevhene Shemet on 19.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NIOperations.h"


@interface NBNetworkRequestOperation : NIOperation<NSURLConnectionDataDelegate> {
@protected
    NSMutableURLRequest *_request;

    NSHTTPURLResponse *_response;
    NSMutableData *_data;

    NSURLConnection *_connection;
    BOOL _isExecuting;
    BOOL _isFinished;
}

@property (nonatomic, retain, readonly) NSMutableURLRequest *request;

@property (nonatomic, retain, readonly) NSHTTPURLResponse *response;
@property (nonatomic, retain, readonly) NSData *data;

@end
