//
//  PreviewViewController.h
//  EvaCameraClone
//
//  Created by 上田 澄博 on 10/07/01.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageEditor.h"

@protocol PreviewViewDelegate;


@interface PreviewViewController : UIViewController {
	IBOutlet UIImageView *imageView;
	IBOutlet UIActivityIndicatorView *activity;

	UIImage *captureImage;
	UIImage *overlayImage;
	UIImage *previewImage;
	
	id<PreviewViewDelegate> delegate;
}

@property (nonatomic,retain) UIImage *captureImage;
@property (nonatomic,retain) UIImage *overlayImage;
@property (nonatomic,retain) UIImage *previewImage;
@property (nonatomic,assign) id<PreviewViewDelegate> delegate;

-(IBAction)pushSave:(id)sender;
-(IBAction)pushCancel:(id)sender;

@end

@protocol PreviewViewDelegate

-(void)previewViewDidSave;
-(void)previewViewDidCancel;

@end
