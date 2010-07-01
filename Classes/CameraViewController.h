//
//  CameraViewController.h
//  EvaCameraClone
//
//  Created by 上田 澄博 on 10/07/01.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OverlayImageManager.h";
#import "PreviewViewController.h"

@protocol CameraViewDelegate;

@interface CameraViewController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate, UIActionSheetDelegate, PreviewViewDelegate> {
	IBOutlet UIImageView *overlayImageView;
	UIImagePickerController *cameraController;
	
	UIActionSheet *changeActionSheet;
	
	UIImage *overlayImage;
	
	OverlayImageManager *imageManager;
	
	IBOutlet PreviewViewController *previewController;
	
	IBOutlet UIActivityIndicatorView *activity;

	id<CameraViewDelegate> delegate;
}

@property (retain,nonatomic) UIImageView *overlayImageView;
@property (retain,nonatomic) UIImage *overlayImage;
@property (retain,nonatomic) UIImagePickerController *cameraController;

@property (assign,nonatomic) id<CameraViewDelegate> delegate;

-(IBAction)pushShutter:(id)sender;
-(IBAction)pushBack:(id)sender;
-(IBAction)pushChange:(id)sender;


@end

@protocol CameraViewDelegate

-(void)cameraViewCancel;

@end
