//
//  ViewController.h
//  printupStephen_example
//
//  Created by Stephen R Printup on 12/8/15.
//  Copyright (c) 2015 Stephen R Printup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) NSDictionary *responseDictionary;
@property (nonatomic, strong) NSMutableArray *photosArray;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

-(void) refresh;
-(void)downloadImageWithURL:(NSString *)url;


@end

