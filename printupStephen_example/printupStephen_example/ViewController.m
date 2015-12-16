//
//  ViewController.m
//  printupStephen_example
//
//  Created by Stephen R Printup on 12/8/15.
//  Copyright (c) 2015 Stephen R Printup. All rights reserved.
//

#import "ViewController.h"
#import "ApiManager.h"
#import "Books.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//Calls API and stores results in singleton
    [[ApiManager getInstance] callApi];
    
//Triggers reloadTable method when books are returned from API
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTable:) name:@"bookDataRecieved" object:nil];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSLog(@"Table Loaded");
    
    ApiManager *instance = [ApiManager getInstance];
    NSLog(@"Instance: %@",instance);
    Books *book = [instance.booksArray objectAtIndex:indexPath.row];
    NSLog(@"Book: %@",[instance.booksArray objectAtIndex:1]);
    NSString *title = book.bookTitle;
    NSLog(@"Title: %@",title);
    cell.textLabel.text = title;
//    cell.imageView.image = ?;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(void)reloadTable:(NSNotificationCenter *) notification
{
    NSLog(@"reloadTable");
    [self.tableView reloadData];
}

@end







