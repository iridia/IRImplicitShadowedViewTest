//
//  IRImplicitShadowedView.m
//  IRImplicitShadowedViewTest
//
//  Created by Evadne Wu on 4/26/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "IRImplicitShadowedView.h"

@implementation IRImplicitShadowedView

- (void) setBounds:(CGRect)bounds {

	[super setBounds:bounds];
	
	self.layer.shadowPath = CGPathCreateWithRect(bounds, NULL);

}

- (id<CAAction>) actionForLayer:(CALayer *)layer forKey:(NSString *)key {

	if (layer == self.layer) {
	
		if ([key isEqualToString:@"shadowPath"])
			return [CABasicAnimation animationWithKeyPath:key];

		if ([key isEqualToString:@"shadowOpacity"])
			return [CABasicAnimation animationWithKeyPath:key];
	
		if ([key isEqualToString:@"shadowOffset"])
			return [CABasicAnimation animationWithKeyPath:key];
		
	}
		
	return [super actionForLayer:layer forKey:key];

}


@end
