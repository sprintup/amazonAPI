//
//  Books.h
//  printupStephen_example
//
//  Created by Stephen R Printup on 12/15/15.
//  Copyright © 2015 Stephen R Printup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Books : NSObject

@property (strong, nonatomic) NSString *bookTitle;
@property (strong, nonatomic) NSString *bookAuthor;
@property (strong, nonatomic) NSString *imageURL;

-(Books *)initWithTitle:(NSString *)title author:(NSString *)author imageURL:(NSString *)imageURL;


@end
