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
    NSURL *booksURL = [NSURL URLWithString:@"http://de-coding-test.s3.amazonaws.com/books.json"];
    NSData *jsonData = [NSData dataWithContentsOfURL:booksURL];
    NSError *error = nil;
    self.bookData = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    //assigns title to cells text label
    NSMutableArray *titleArray = [self.bookData valueForKey:@"title"];
    NSString *title = [titleArray objectAtIndex:indexPath.row];
    cell.textLabel.text = title;
    
    //assigns image to cells image view
    NSMutableArray *imageUrlArray = [self.bookData valueForKey:@"imageURL"];
    NSString *imageURLString = [imageUrlArray objectAtIndex:indexPath.row];
    NSData *imageData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:imageURLString]];
    UIImage *image = [UIImage imageWithData:imageData];
    cell.imageView.image = image;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.bookData count];
}

@end







