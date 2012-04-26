//
//  IRViewController.m
//  IRImplicitShadowedViewTest
//
//  Created by Evadne Wu on 4/26/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "IRImplicitShadowedViewTestingViewController.h"
#import "IRImplicitShadowedView.h"

@interface IRImplicitShadowedViewTestingViewController ()

@property (strong, nonatomic) NSTimer *resizeTimer;

@end

@implementation IRImplicitShadowedViewTestingViewController
@synthesize resizeTimer, implicitShadowedView;

- (void) viewDidLoad {
	
	[super viewDidLoad];
	
	IRImplicitShadowedView *isv = self.implicitShadowedView;
	isv.layer.shadowOpacity = 1;
	
	[self resizeTimer];
	
}

- (void) viewDidUnload {

	[resizeTimer invalidate];
	
	self.implicitShadowedView = nil;
	self.resizeTimer = nil;
	
	[super viewDidUnload];
	
}

- (NSTimer *) resizeTimer {

	if (resizeTimer)
		return resizeTimer;
	
	resizeTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(handleResizeTimerFired:) userInfo:nil repeats:YES];
	return resizeTimer;

}

- (void) handleResizeTimerFired:(NSTimer *)timer {

	IRImplicitShadowedView *isv = self.implicitShadowedView;
	CGRect fromBounds = isv.bounds;
	CGRect toBounds = (CGRect){ CGPointZero, (CGSize){ CGRectGetHeight(fromBounds), CGRectGetWidth(fromBounds) }};
	
	[UIView animateWithDuration:0.3 animations:^{

		[CATransaction setAnimationDuration:0.3];
		[CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
		
		isv.bounds = toBounds;
	
	}];
	
}

- (void) dealloc {

	[resizeTimer invalidate];

}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {

	return YES;

}

- (IBAction) handleShadowEnabledValueChanged:(UISwitch *)sender {

	self.implicitShadowedView.layer.shadowOpacity = sender.on ? 1 : 0;

}

@end
