//
//  ApiManager.h
//  printupStephen_example
//
//  Created by Stephen Printup on 12/16/15.
//  Copyright © 2015 Stephen R Printup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiManager : NSObject

+(instancetype) getInstance;
-(instancetype)initWithBaseURL:(NSString *)baseURL;
-(void) callApi;


@end
