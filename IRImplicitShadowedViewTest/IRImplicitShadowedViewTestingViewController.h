//
//  IRViewController.h
//  IRImplicitShadowedViewTest
//
//  Created by Evadne Wu on 4/26/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IRImplicitShadowedView;

@interface IRImplicitShadowedViewTestingViewController : UIViewController

@property (weak, nonatomic) IBOutlet IRImplicitShadowedView *implicitShadowedView;

- (IBAction) handleShadowEnabledValueChanged:(UISwitch *)sender;

@end
