//
//  PostCell.m
//  PostTable
//
//  Created by Максим Зиноватный on 31.03.16.
//  Copyright © 2016 Максим Зиноватный. All rights reserved.
//

#import "PostCell.h"
#import "TableViewController.h"
@implementation PostCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


-(void)populateCellWithPost:(TumblrPost *)arrayElement
{
    

    
    self.postTextLabel.text = arrayElement.texts;

    NSURLSession *session = [NSURLSession sharedSession];
    self.dataTask = [session dataTaskWithURL:[NSURL URLWithString:arrayElement.myImage]
                                      completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
                                          
                                          UIImage* imageWithData = [UIImage imageWithData:data];
                                          
                                          dispatch_async(dispatch_get_main_queue(), ^{
                                            [self.activityIndicator startAnimating];
                                              
                                             self.postImageView.image = imageWithData;
                                              
                                              if (self.postImageView.image !=nil)
                                              {
                                                  [self.activityIndicator stopAnimating];
                                              }
                                          });

    }];
    
    [self.dataTask resume];
    
}

-(void) prepareForReuse
{
    [super prepareForReuse];
     self.postImageView.image = nil;
    [self.activityIndicator startAnimating];
    [self.dataTask cancel];
}
@end
