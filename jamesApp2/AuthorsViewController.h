//
//  AuthorsViewController.h
//  jamesApp2
//
//  Created by james kasinger on 7/5/16.
//  Copyright © 2016 kasingj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuthorsViewController : UITableViewController <UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) NSArray *authors;

@end
