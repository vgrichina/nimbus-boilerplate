//
//  NBDefaultLoadingView.h
//  zebra-fitness-iphone
//
//  Created by Yevhene Shemet on 22.02.12.
//  Copyright (c) 2012 Componentix. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NBDefaultLoadingView : UIView {
@protected
    UILabel *_loadingLabel;
}

@property (nonatomic, assign, readonly) UILabel *loadingLabel;

@end
