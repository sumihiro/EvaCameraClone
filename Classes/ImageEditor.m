//
//  ImageEditor.m
//  EvaCameraClone
//
//  Created by 上田 澄博 on 10/07/01.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ImageEditor.h"


@implementation ImageEditor

+(UIImage*)image:(UIImage*)base overlay:(UIImage*)overlay {
	CGSize size = base.size;
	UIGraphicsBeginImageContext(size);
	[base drawInRect:CGRectMake(0, 0, size.width, size.height)];
	[overlay drawInRect:CGRectMake(0, 0, size.width, size.height)];
	UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return newImage;
}

+(UIImage*)image:(UIImage*)base resize:(CGSize)size {
	UIGraphicsBeginImageContext(size);
	[base drawInRect:CGRectMake(0, 0, size.width, size.height)];
	UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return newImage;
}

@end
