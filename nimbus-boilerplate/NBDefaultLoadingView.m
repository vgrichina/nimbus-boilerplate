//
//  NBDefaultLoadingView.m
//  zebra-fitness-iphone
//
//  Created by Yevhene Shemet on 22.02.12.
//  Copyright (c) 2012 Componentix. All rights reserved.
//

#import "NBDefaultLoadingView.h"


@implementation NBDefaultLoadingView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (id)init {
    return [self initWithFrame:CGRectZero];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    [self.loadingLabel sizeToFit];
    self.loadingLabel.center = CGPointMake(self.bounds.origin.x + self.bounds.size.width / 2,
                                           self.bounds.origin.y + self.bounds.size.height * 0.40);
}

- (UILabel *)loadingLabel {
    if (!_loadingLabel) {
        _loadingLabel = [[UILabel alloc] init];
        _loadingLabel.text = NSLocalizedString(@"Loading", @"");
        _loadingLabel.textAlignment = UITextAlignmentCenter;
        _loadingLabel.font = [UIFont boldSystemFontOfSize:20];
        _loadingLabel.textColor = [UIColor darkGrayColor];
        _loadingLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:_loadingLabel];
    }
    return _loadingLabel;
}

@end
