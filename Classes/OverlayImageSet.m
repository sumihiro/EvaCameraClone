//
//  OverlayImageSet.m
//  EvaCameraClone
//
//  Created by 上田 澄博 on 10/07/01.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "OverlayImageSet.h"


@implementation OverlayImageSet

@synthesize fullImage;
@synthesize smallImage;
@synthesize title;


- (void) dealloc
{
	self.fullImage = nil;
	self.smallImage = nil;
	self.title = nil;
	
	[super dealloc];
}


@end
