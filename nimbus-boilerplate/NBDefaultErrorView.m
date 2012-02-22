//
//  NBDefaultErrorView.m
//  zebra-fitness-iphone
//
//  Created by Yevhene Shemet on 22.02.12.
//  Copyright (c) 2012 Componentix. All rights reserved.
//

#import "NBDefaultErrorView.h"


@implementation NBDefaultErrorView

@synthesize error = _error;

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

- (void)dealloc {
    [_error release];

    [super dealloc];
}

- (void)setError:(NSError *)error {
    if (_error != error) {
        [_error release];
        _error = [error retain];
        self.errorDescription.text = [error localizedDescription];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat kMargin = 8;

    [self.errorTitle sizeToFit];
    self.errorTitle.center = CGPointMake(self.bounds.origin.x + self.bounds.size.width / 2,
                                         self.bounds.origin.y + self.bounds.size.height / 3);

    CGSize size = [self.errorDescription.text sizeWithFont:self.errorDescription.font
                                         constrainedToSize:CGSizeMake(self.bounds.size.width - kMargin * 2,
                                                                      INFINITY)
                                             lineBreakMode:self.errorDescription.lineBreakMode];
    self.errorDescription.frame = CGRectMake(kMargin,
                                             self.errorTitle.frame.origin.y + self.errorTitle.frame.size.height,
                                             self.bounds.size.width - kMargin * 2,
                                             size.height);
}

- (UILabel *)errorTitle {
    if (!_errorTitle) {
        _errorTitle = [[[UILabel alloc] init] autorelease];
        _errorTitle.text = NSLocalizedString(@"Error", @"");
        _errorTitle.textAlignment = UITextAlignmentCenter;
        _errorTitle.font = [UIFont boldSystemFontOfSize:20];
        _errorTitle.textColor = [UIColor darkGrayColor];
        _errorTitle.backgroundColor = [UIColor clearColor];
        [self addSubview:_errorTitle];
    }
    return _errorTitle;
}

- (UILabel *)errorDescription {
    if (!_errorDescription) {
        _errorDescription = [[[UILabel alloc] init] autorelease];
        _errorDescription.textAlignment = UITextAlignmentCenter;
        _errorDescription.font = [UIFont boldSystemFontOfSize:16];
        _errorDescription.textColor = [UIColor darkGrayColor];
        _errorDescription.backgroundColor = [UIColor clearColor];
        _errorDescription.numberOfLines = 0;
        _errorDescription.lineBreakMode = UILineBreakModeWordWrap;
        [self addSubview:_errorDescription];
    }
    return _errorDescription;
}

@end
