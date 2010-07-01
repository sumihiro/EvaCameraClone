//
//  CameraViewController.m
//  EvaCameraClone
//
//  Created by 上田 澄博 on 10/07/01.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CameraViewController.h"

@interface CameraViewController (internal)

- (void)setOverlayImageSet:(OverlayImageSet*)set;
- (void)setupCamera;

@end


@implementation CameraViewController

@synthesize overlayImageView;
@synthesize overlayImage;
@synthesize cameraController;
@synthesize delegate;


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
 */

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}

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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	self.overlayImageView = nil;
	self.overlayImage = nil;
	self.delegate = nil;
	
	[previewController release];
	[activity release];
	[cameraController release];
	[imageManager release];
	
    [super dealloc];
}

#pragma mark -
- (void)setCameraController:(UIImagePickerController *)picker {
	if (cameraController != picker) {
		[cameraController release];
		cameraController = picker;
		
		[self setupCamera];
	}
}

#pragma mark -
- (void)setupCamera {
	cameraController.sourceType = UIImagePickerControllerSourceTypeCamera;
	cameraController.allowsEditing = NO;
	cameraController.showsCameraControls = NO;
	cameraController.delegate = self;

	cameraController.cameraOverlayView = self.view;

	imageManager = [[OverlayImageManager alloc] init];
	[self setOverlayImageSet:[imageManager objectAtIndex:0]];
	
	
}

#pragma mark -
#pragma mark UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	[activity startAnimating];
	
	UIImage *orgImage = [info objectForKey:UIImagePickerControllerOriginalImage];
	
	[self performSelector:@selector(showPreview:) withObject:orgImage afterDelay:0.01f];
}

#pragma mark -
#pragma mark UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	[self setOverlayImageSet:[imageManager objectAtIndex:buttonIndex]];

	[changeActionSheet release];
}

#pragma mark -
#pragma mark PreviewViewDelegate
-(void)previewViewDidSave {
	[self dismissModalViewControllerAnimated:YES];
}

-(void)previewViewDidCancel {
	[self dismissModalViewControllerAnimated:YES];
}


#pragma mark -
- (void)setOverlayImageSet:(OverlayImageSet*)set {
	self.overlayImageView.image = set.smallImage;
	self.overlayImage = set.fullImage;
}

- (void)showPreview:(UIImage*)orgImage {
	UIImage *resized = [ImageEditor image:orgImage resize:CGSizeMake(240, 320)];
	UIImage *preview = [ImageEditor image:resized overlay:overlayImageView.image];
	previewController.previewImage = preview;
	previewController.captureImage = orgImage;
	previewController.overlayImage = overlayImage;
	[self presentModalViewController:previewController animated:YES];
	[activity stopAnimating];
}

#pragma mark -

-(IBAction)pushShutter:(id)sender {
	[cameraController takePicture];
}

-(IBAction)pushBack:(id)sender {
	[delegate cameraViewCancel];
}

-(IBAction)pushChange:(id)sender {
	changeActionSheet = [[UIActionSheet alloc] init];
	changeActionSheet.delegate = self;
	NSArray *items = [imageManager allSets];
	for (OverlayImageSet *set in items) {
		[changeActionSheet addButtonWithTitle:[set title]];
	}
	
	[changeActionSheet showInView:self.view];
}


@end
