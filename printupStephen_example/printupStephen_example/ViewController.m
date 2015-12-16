//
//  ViewController.m
//  printupStephen_example
//
//  Created by Stephen R Printup on 12/8/15.
//  Copyright (c) 2015 Stephen R Printup. All rights reserved.
//

#import "ViewController.h"
#import "ApiManager.h"

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
    cell.textLabel.text = @"Hello";
//    cell.imageView.image = ?;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(void)reloadTable:(NSNotificationCenter *) notification
{
    ApiManager *instance = [ApiManager getInstance];
    
    NSLog(@"Instance: %@",instance);
//Why are there no properties on my instance? My plan is to set properties in this class to the properties in the ApiSingleton and then reload the table.
    
    NSLog(@"reloadTable called");
    [self.tableView reloadData];
}

@end







