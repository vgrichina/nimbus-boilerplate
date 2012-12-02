//
//  NBNetworkRequestOperation.m
//  zebra-fitness-iphone
//
//  Created by Yevhene Shemet on 19.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NBNetworkRequestOperation.h"


@implementation NBNetworkRequestOperation

@synthesize response = _response;

- (id)init {
    self = [super init];
    if (self) {
        _isExecuting = NO;
        _isFinished = NO;
    }
    return self;
}

- (void)dealloc {
    [_request release];
    [_response release];
    [_data release];

    [super dealloc];
}

- (void)finish {
    [_connection release];
    _connection = nil;
    
    [self willChangeValueForKey:@"isExecuting"];
    [self willChangeValueForKey:@"isFinished"];

    _isExecuting = NO;
    _isFinished = YES;

    [self didChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isFinished"];
}

- (void)start {
    if (![NSThread isMainThread]) {
        [self performSelectorOnMainThread:@selector(start) withObject:nil waitUntilDone:NO];
        return;
    }

    [self willChangeValueForKey:@"isExecuting"];
    _isExecuting = YES;
    [self didChangeValueForKey:@"isExecuting"];

    [self didStart];

    _connection = [[NSURLConnection alloc] initWithRequest:self.request
                                                  delegate:self];
    if (_connection == nil) {
        [self finish];
    }
}

#pragma mark - properties

- (NSMutableURLRequest *)request {
    if (!_request) {
        _request = [[NSMutableURLRequest alloc] init];
    }
    return _request;
}

- (NSData *)data {
    return [NSData dataWithData:_data];
}

- (BOOL)isExecuting {
    return _isExecuting;
}

- (BOOL)isFinished {
    return _isFinished;
}

#pragma mark - NSURLConnectionDelegate

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error {
    [self finish];
    [self didFailWithError:error];
}

#pragma  mark - NSURLConnectionDataDelegate

- (void)connection:(NSURLConnection *)connection
didReceiveResponse:(NSURLResponse *)response {
    [_data release];
    _data = [[NSMutableData alloc] init];

    [_response release];
    _response = [(NSHTTPURLResponse *)response retain];
}

- (void)connection:(NSURLConnection *)connection
    didReceiveData:(NSData *)data {
    [_data appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [self finish];
    [self willFinish];
    [self didFinish];
}

@end
