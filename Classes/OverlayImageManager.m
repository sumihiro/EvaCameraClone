//
//  OverlayImageManager.m
//  EvaCameraClone
//
//  Created by 上田 澄博 on 10/07/01.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "OverlayImageManager.h"

@interface OverlayImageManager (internal)

-(void)loadSets;

@end

@implementation OverlayImageManager

- (id) init
{
	self = [super init];
	if (self != nil) {
		{
			imageSets = [[NSMutableArray alloc] init];
			
			[self loadSets];
		}
	}
	return self;
}

- (void) dealloc
{
	[imageSets release];
	[super dealloc];
}

-(void)loadSets {
	OverlayImageSet *set;
	set = [[[OverlayImageSet alloc] init] autorelease];
	set.fullImage = [UIImage imageNamed:@"image0Full"];
	set.smallImage = [UIImage imageNamed:@"image0Small"];
	set.title = @"えば";
	[imageSets addObject:set];

	set = [[[OverlayImageSet alloc] init] autorelease];
	set.fullImage = [UIImage imageNamed:@"image1Full"];
	set.smallImage = [UIImage imageNamed:@"image1Small"];
	set.title = @"しんじ";
	[imageSets addObject:set];
}

-(NSArray*)allSets {
	return imageSets;
}

-(OverlayImageSet*)objectAtIndex:(NSInteger)index {
	return [imageSets objectAtIndex:index];
}


@end
