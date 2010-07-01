//
//  EvaCameraCloneViewController.m
//  EvaCameraClone
//
//  Created by 上田 澄博 on 10/07/01.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "EvaCameraCloneViewController.h"

@implementation EvaCameraCloneViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[cameraViewController release];
	
    [super dealloc];
}

#pragma mark -
-(IBAction)pushLaunch:(id)sender {
	
	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	cameraViewController.cameraController = picker;
	[self presentModalViewController:picker animated:YES];
}

-(IBAction)pushButton1:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://twitter.com/sumihiro"]];
}

-(IBAction)pushButton2:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://itunes.apple.com/jp/app/id367822050?mt=8"]];
}

#pragma mark -
-(void)cameraViewCancel {
	[self dismissModalViewControllerAnimated:YES];
}

@end
