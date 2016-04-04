//
//  PostCell.h
//  PostTable
//
//  Created by Максим Зиноватный on 31.03.16.
//  Copyright © 2016 Максим Зиноватный. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TumblrPost.h"

@interface PostCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
@property (weak, nonatomic) IBOutlet UILabel *postTextLabel;
@property (nonatomic, strong) NSURLSessionDataTask * dataTask;
- (void) populateCellWithPost: (TumblrPost*) arrayElement;

@end
