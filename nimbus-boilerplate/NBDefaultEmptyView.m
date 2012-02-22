//
//  NBDefaultEmptyView.m
//  zebra-fitness-iphone
//
//  Created by Yevhene Shemet on 22.02.12.
//  Copyright (c) 2012 Componentix. All rights reserved.
//

#import "NBDefaultEmptyView.h"


@implementation NBDefaultEmptyView

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

    [self.emptyLabel sizeToFit];
    self.emptyLabel.center = CGPointMake(self.bounds.origin.x + self.bounds.size.width / 2,
                                         self.bounds.origin.y + self.bounds.size.height * 0.40);
}

- (UILabel *)emptyLabel {
    if (!_emptyLabel) {
        _emptyLabel = [[[UILabel alloc] init] autorelease];
        _emptyLabel.text = NSLocalizedString(@"Empty", @"");
        _emptyLabel.textAlignment = UITextAlignmentCenter;
        _emptyLabel.font = [UIFont boldSystemFontOfSize:20];
        _emptyLabel.textColor = [UIColor darkGrayColor];
        _emptyLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:_emptyLabel];
    }
    return _emptyLabel;
}

@end
