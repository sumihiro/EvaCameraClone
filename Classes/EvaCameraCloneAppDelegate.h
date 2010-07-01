//
//  EvaCameraCloneAppDelegate.h
//  EvaCameraClone
//
//  Created by 上田 澄博 on 10/07/01.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EvaCameraCloneViewController;

@interface EvaCameraCloneAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    EvaCameraCloneViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet EvaCameraCloneViewController *viewController;

@end

