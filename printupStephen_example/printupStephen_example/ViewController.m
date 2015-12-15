//
//  ViewController.m
//  printupStephen_example
//
//  Created by Stephen R Printup on 12/8/15.
//  Copyright (c) 2015 Stephen R Printup. All rights reserved.
//

#import "ViewController.h"
#import "Books.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refresh];
    
}

-(void) refresh
{
    NSURLSession *session  = [NSURLSession sharedSession];
    NSURL *url = [[NSURL alloc] initWithString:@"http://de-coding-test.s3.amazonaws.com/books.json"];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSData *data = [[NSData alloc]initWithContentsOfURL:location];
        self.responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        NSInteger count = [[self.responseDictionary valueForKeyPath:@"title"] count];
        for (NSInteger i = 0 ; i < count; i++) {
            NSString *bookTitle = [self.responseDictionary valueForKeyPath:@"title"][i];
            NSString *bookAuthor = [self.responseDictionary valueForKeyPath:@"author"][i];
            NSString *bookImageURL = [self.responseDictionary valueForKeyPath:@"imageURL"][i];

            Books *book = [[Books alloc] initWithTitle:bookTitle author:bookAuthor imageURL:bookImageURL];
            [self.booksArray addObject:book];
        }
//        NSLog(@"%lu",[[self.responseDictionary valueForKeyPath:@"title"] count]); //number of titles
//        NSLog(@"%@",[self.responseDictionary valueForKeyPath:@"title"]); //titles
//        NSLog(@"%@",[self.responseDictionary valueForKeyPath:@"author"]);
//        NSLog(@"%@",[self.responseDictionary valueForKeyPath:@"imageURL"]);
    }];
    
    [task resume];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = self.booksArray[indexPath.row];
//    cell.imageView.image = ?;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
@end







