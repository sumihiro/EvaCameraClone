//
//  EvaCameraCloneViewController.h
//  EvaCameraClone
//
//  Created by 上田 澄博 on 10/07/01.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CameraViewController.h"

@interface EvaCameraCloneViewController : UIViewController <CameraViewDelegate> {
	IBOutlet CameraViewController *cameraViewController;
}

-(IBAction)pushLaunch:(id)sender;
-(IBAction)pushButton1:(id)sender;
-(IBAction)pushButton2:(id)sender;

@end

