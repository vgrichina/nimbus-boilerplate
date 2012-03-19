//
//  NBStateViewController.h
//  zebra-fitness-iphone
//
//  Created by Yevhene Shemet on 22.02.12.
//  Copyright (c) 2012 Componentix. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    NBViewControllerStateNormal,
    NBViewControllerStateLoading,
    NBViewControllerStateEmpty,
    NBViewControllerStateError
} NBViewControllerState;


@protocol NBErrorView<NSObject>

- (NSError *)error;
- (void)setError:(NSError *)error;

@end


@interface NBStateViewController : UIViewController {
@protected
    NBViewControllerState _state;
    NSError *_error;

    UIView *_loadingView;
    UIView *_emptyView;
    UIView<NBErrorView> *_errorView;
}

@property(nonatomic, retain) NSError *error;

@property(nonatomic, assign) NBViewControllerState state;

- (void)setState:(NBViewControllerState)state animated:(BOOL)animated;

@property(nonatomic, retain) UIView *loadingView;
@property(nonatomic, retain) UIView *emptyView;
@property(nonatomic, retain) UIView<NBErrorView> *errorView;

//
- (void)didStartLoading;
- (void)didFinishLoading;
- (void)didFinishLoadingAndEmpty;
- (void)didFailLoadingWithError;

@end
