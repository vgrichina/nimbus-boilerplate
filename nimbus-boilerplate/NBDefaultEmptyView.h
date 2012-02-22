//
//  NBDefaultEmptyView.h
//  zebra-fitness-iphone
//
//  Created by Yevhene Shemet on 22.02.12.
//  Copyright (c) 2012 Componentix. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NBDefaultEmptyView : UIView {
@protected
    UILabel *_emptyLabel;
}

@property (nonatomic, assign, readonly) UILabel *emptyLabel;

@end
