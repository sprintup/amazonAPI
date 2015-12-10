//
//  ViewController.h
//  printupStephen_example
//
//  Created by Stephen R Printup on 12/8/15.
//  Copyright (c) 2015 Stephen R Printup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSDictionary *bookData;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

