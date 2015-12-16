//
//  ApiManager.h
//  printupStephen_example
//
//  Created by Stephen Printup on 12/16/15.
//  Copyright © 2015 Stephen R Printup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiManager : NSObject

@property (readonly, strong, nonatomic) NSString *URL;
@property (nonatomic) NSDictionary *responseDictionary;
@property (strong, nonatomic) NSString *bookTitle;
@property (strong, nonatomic) NSString *bookAuthor;
@property (strong, nonatomic) NSString *bookImageURL;
@property (nonatomic, strong) NSMutableArray *booksArray;

+(instancetype) getInstance;
-(instancetype)initWithBaseURL:(NSString *)baseURL;
-(void) callApi;

@end
