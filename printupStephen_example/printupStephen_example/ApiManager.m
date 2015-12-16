//
//  ApiManager.m
//  printupStephen_example
//
//  Created by Stephen Printup on 12/16/15.
//  Copyright © 2015 Stephen R Printup. All rights reserved.
//

#import "ApiManager.h"
#import "Books.h"

NSString *BASE_URL = @"http://de-coding-test.s3.amazonaws.com/books.json";

@interface ApiManager ()

@property (readonly, strong, nonatomic) NSString *URL;
@property (nonatomic) NSDictionary *responseDictionary;
@property (strong, nonatomic) NSString *bookTitle;
@property (strong, nonatomic) NSString *bookAuthor;
@property (strong, nonatomic) NSString *bookImageURL;
@property (nonatomic, strong) NSMutableArray *booksArray;

@end

@implementation ApiManager

+(instancetype) getInstance {
    static ApiManager *instance = nil;
    if (!instance) {
        NSLog(@"initializing ApiManager");
        instance = [[ApiManager alloc]initWithBaseURL:BASE_URL];
    }
    return instance;
}

-(instancetype)initWithBaseURL:(NSString *)baseURL {
    self = [super init];
    
    _URL = baseURL;
    
    return self;
}

-(void) callApi
{
/*
This method calls the API and puts the JSON into a dictionary, enumerates through the dictionary creating book objects to store in a array of books.
*/
    NSURLSession *session  = [NSURLSession sharedSession];
    NSURL *url = [[NSURL alloc] initWithString:@"http://de-coding-test.s3.amazonaws.com/books.json"];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSData *data = [[NSData alloc]initWithContentsOfURL:location];
        _responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        NSInteger count = [[_responseDictionary valueForKeyPath:@"title"] count];
        for (NSInteger i = 0 ; i < count; i++) {
            _bookTitle = [_responseDictionary valueForKeyPath:@"title"][i];
            _bookAuthor = [_responseDictionary valueForKeyPath:@"author"][i];
            _bookImageURL = [_responseDictionary valueForKeyPath:@"imageURL"][i];
            
            Books *book = [[Books alloc] initWithTitle:_bookTitle author:_bookAuthor imageURL:_bookImageURL];
            [_booksArray addObject:book];
        }
        NSLog(@"It's working %@",_bookTitle);
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"bookDataRecieved"
         object:self];
    }];
    
    [task resume];
}

@end
