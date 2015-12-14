//
//  ViewController.m
//  printupStephen_example
//
//  Created by Stephen R Printup on 12/8/15.
//  Copyright (c) 2015 Stephen R Printup. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refresh];
    NSLog(@"%@",self.responseDictionary);
}

-(void) refresh
{
    NSURLSession *session  = [NSURLSession sharedSession];
    NSURL *url = [[NSURL alloc] initWithString:@"http://de-coding-test.s3.amazonaws.com/books.json"];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSData *data = [[NSData alloc]initWithContentsOfURL:location];
        self.responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        self.photosArray = [self.responseDictionary valueForKeyPath:@"imageURL"];

        NSLog(@"%@",self.photosArray);
        
    }];
    
    [task resume];
}

//-(UIImage *)downloadImageWithURL:(NSString *)url
//{
//    UIImage *image;
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURL *urlFromString = [[NSURL alloc] initWithString:url];
//    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:urlFromString];
//    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        image = [[UIImage alloc] initWithContentsOfFile:[location path]];
//    }
//    return image;
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
//    cell.textLabel.text = ?;
//    cell.imageView.image = ?;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
@end







