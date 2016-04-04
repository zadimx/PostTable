//
//  TableViewController.h
//  PostTable
//
//  Created by Максим Зиноватный on 31.03.16.
//  Copyright © 2016 Максим Зиноватный. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TumblrPost.h"
@interface TableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray* array;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;


@end
