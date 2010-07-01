//
//  OverlayImageSet.h
//  EvaCameraClone
//
//  Created by 上田 澄博 on 10/07/01.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OverlayImageSet : NSObject {
	UIImage *fullImage;
	UIImage *smallImage;
	NSString *title;
}

@property (nonatomic,retain) UIImage *fullImage;
@property (nonatomic,retain) UIImage *smallImage;
@property (nonatomic,retain) NSString *title;

@end
