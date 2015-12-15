//
//  Books.m
//  printupStephen_example
//
//  Created by Stephen R Printup on 12/15/15.
//  Copyright © 2015 Stephen R Printup. All rights reserved.
//

#import "Books.h"

@implementation Books

-(Books *)initWithTitle:(NSString *)title author:(NSString *)author imageURL:(NSString *)imageURL
{
    Books *bookToReturn;
    
    self.bookTitle = title;
    self.bookAuthor = author;
    self.imageURL = imageURL;
    
    return bookToReturn;
}

@end
