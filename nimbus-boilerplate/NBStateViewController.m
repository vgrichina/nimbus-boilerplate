//
//  NBStateViewController.m
//  zebra-fitness-iphone
//
//  Created by Yevhene Shemet on 22.02.12.
//  Copyright (c) 2012 Componentix. All rights reserved.
//

#import "NBStateViewController.h"

#import "NBDefaultLoadingView.h"
#import "NBDefaultEmptyView.h"
#import "NBDefaultErrorView.h"


@implementation NBStateViewController

@synthesize state = _state, error = _error;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.state = NBViewControllerStateNormal;
}

- (void)viewDidLoad {
    _loadingView = nil;
    _emptyView = nil;
    _errorView = nil;
}

- (void)setState:(NBViewControllerState)state {
    if (_state != state) {
        _state = state;
        switch (self.state) {
            case NBViewControllerStateNormal:
                self.loadingView.hidden = YES;
                self.emptyView.hidden = YES;
                self.errorView.hidden = YES;
                break;
            case NBViewControllerStateLoading:
                [self.view bringSubviewToFront:self.loadingView];
                self.loadingView.hidden = NO;
                self.emptyView.hidden = YES;
                self.errorView.hidden = YES;
                break;
            case NBViewControllerStateEmpty:
                [self.view bringSubviewToFront:self.emptyView];
                self.loadingView.hidden = YES;
                self.emptyView.hidden = NO;
                self.errorView.hidden = YES;
                break;
            case NBViewControllerStateError:
                [self.view bringSubviewToFront:self.errorView];
                self.loadingView.hidden = YES;
                self.emptyView.hidden = YES;
                self.errorView.hidden = NO;
                break;
        }
    }
}

- (void)setState:(NBViewControllerState)state animated:(BOOL)animated {
    if (animated) {
        [UIView beginAnimations:@"NBStateViewControllerChangeState" context:NULL];
        [UIView setAnimationDuration:0.5f];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [UIView setAnimationBeginsFromCurrentState:YES];
    }
    self.state = state;
    if (animated) {
        [UIView commitAnimations];
    }
}

- (void)setError:(NSError *)error {
    if (_error != error) {
        _error = error;
        [self.errorView setError:_error];
    }
}

- (UIView *)loadingView {
    if (!_loadingView) {
        _loadingView = [[[NBDefaultLoadingView alloc] initWithFrame:self.view.bounds] autorelease];
        _loadingView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_loadingView];
    }
    return _loadingView;
}

- (void)setLoadingView:(UIView *)loadingView {
    if (_loadingView != loadingView) {
        if (_loadingView) {
            [_loadingView removeFromSuperview];
        }
        _loadingView = loadingView;
        if (_loadingView) {
            [self.view addSubview:_loadingView];
        }
    }
}

- (UIView *)emptyView {
    if (!_emptyView) {
        _emptyView = [[[NBDefaultEmptyView alloc] initWithFrame:self.view.bounds] autorelease];
        _emptyView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_emptyView];
    }
    return _emptyView;
}

- (void)setEmptyView:(UIView *)emptyView {
    if (_emptyView != emptyView) {
        if (_emptyView) {
            [_emptyView removeFromSuperview];
        }
        _emptyView = emptyView;
        if (_emptyView) {
            [self.view addSubview:_emptyView];
        }
    }
}

- (UIView<NBErrorView> *)errorView {
    if (!_errorView) {
        _errorView = [[[NBDefaultErrorView alloc] initWithFrame:self.view.bounds] autorelease];
        _errorView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_errorView];
    }
    return _errorView;
}

- (void)setErrorView:(UIView<NBErrorView> *)errorView {
    if (_errorView != errorView) {
        if (_errorView) {
            [_errorView removeFromSuperview];
        }
        _errorView = errorView;
        if (_errorView) {
            [self.view addSubview:_errorView];
        }
    }
}

- (void)didStartLoading {
    self.state = NBViewControllerStateLoading;
}

- (void)didFinishLoading {
    self.state = NBViewControllerStateNormal;
}

- (void)didFinishLoadingAndEmpty {
    self.state = NBViewControllerStateEmpty;
}

- (void)didFailLoadingWithError {
    self.state = NBViewControllerStateError;
}

@end
