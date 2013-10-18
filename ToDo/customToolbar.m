//
//  customToolbar.m
//  ToDo
//
//  Created by Mac Tyler on 10/17/13.
//  Copyright (c) 2013 Mac Tyler. All rights reserved.
//

#import "customToolbar.h"

@implementation customToolbar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self.navigationBar setBackgroundImage:[UIImage new]
                                 forBarMetrics:UIBarMetricsDefault];
        self.navigationBar.shadowImage = [UIImage new];
        self.navigationBar.translucent = YES;
        
        UIColor *barColour = [UIColor colorWithRed:0.13f green:0.14f blue:0.15f alpha:1.00f];
        UIView *colourView = [[UIView alloc] initWithFrame:CGRectMake(0.f, -20.f, 320.f, 64.f)];
        colourView.opaque = NO;
        colourView.alpha = .7f;
        colourView.backgroundColor = barColour;
        
        self.navigationBar.barTintColor = barColour;
        
        [self.navigationBar.layer insertSublayer:colourView.layer atIndex:1];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
