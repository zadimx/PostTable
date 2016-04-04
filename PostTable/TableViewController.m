//
//  TableViewController.m
//  PostTable
//
//  Created by Максим Зиноватный on 31.03.16.
//  Copyright © 2016 Максим Зиноватный. All rights reserved.
//

#import "TableViewController.h"
#import "TumblrPost.h"
#import "PostCell.h"
@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)barButton:(id)sender {
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://api.tumblr.com/v2/blog/patrik-star.tumblr.com/posts/photo?api_key=fuiKNFp9vQFvjLNvx4sUwti4Yb5yGutBN4Xh10LXZhhRKjWlV4&limit=20"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        
        NSDictionary *skillData = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSDictionary* response1 = skillData[@"response"];
        NSArray* posts = response1[@"posts"];
        
        self.array = [[NSMutableArray alloc] init];
        
        for (NSDictionary* onePost in posts)
        {
            NSString* summary = onePost[@"summary"];
            NSArray* photos = onePost[@"photos"];
            NSDictionary* photosOne = photos[0];
            NSArray* alt_sizes = photosOne[@"alt_sizes"];
            NSDictionary* alt_sezesOne = alt_sizes[0];
            NSString* url = alt_sezesOne[@"url"];
            
            TumblrPost* post = [[TumblrPost alloc] init];
            post.texts = summary;
            post.myImage = url;
            
            [self.array addObject:post];
        }
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.myTableView reloadData];
        });
        
        
        
    }];
    [dataTask resume];
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.array count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *simpleTableIdentifier = @"Cells";

    PostCell* cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    
    TumblrPost* arrayElement= [self.array objectAtIndex: indexPath.row];
    
    [cell populateCellWithPost:(TumblrPost *) arrayElement];
    
    
    return cell;
    
}




@end
