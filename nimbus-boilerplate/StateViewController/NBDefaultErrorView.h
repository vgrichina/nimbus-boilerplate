//
//  NBDefaultErrorView.h
//  zebra-fitness-iphone
//
//  Created by Yevhene Shemet on 22.02.12.
//  Copyright (c) 2012 Componentix. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NBStateViewController.h"


@interface NBDefaultErrorView : UIView <NBErrorView> {
@protected
    NSError *_error;

    UILabel *_errorTitle;
    UILabel *_errorDescription;
}

@property (nonatomic, retain) NSError *error;

@property (nonatomic, assign, readonly) UILabel *errorTitle;
@property (nonatomic, assign, readonly) UILabel *errorDescription;

@end
