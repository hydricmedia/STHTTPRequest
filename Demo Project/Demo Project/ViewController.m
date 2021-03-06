//
//  ViewController.m
//  HMHTTPRequestDemo
//
//  Created by Nicolas Seriot on 8/10/12.
//  Copyright (c) 2012 Nicolas Seriot. All rights reserved.
//

#import "ViewController.h"
#import "HMHTTPRequest.h"

@implementation ViewController

- (IBAction)buttonClicked:(id)sender {
    
    [_activityIndicator startAnimating];
    
    _fetchButton.enabled = NO;
    _statusLabel.text = @"";
    _headersTextView.text = @"";
    _imageView.image = nil;
    
    __block HMHTTPRequest *r = [HMHTTPRequest requestWithURLString:@"https://raw.github.com/github/media/master/octocats/octocat.png"];

//    r.GETDictionary = @{@"a":@"1", @"b":@"x/x?!=&x"};
    
    __weak HMHTTPRequest *wr = r; // so that we can access the request from within the callback blocks but without creating a retain cycle
    
    r.completionBlock = ^(NSDictionary *headers, NSString *body) {
        
        _imageView.image = [UIImage imageWithData:wr.responseData];
        _statusLabel.text = [NSString stringWithFormat:@"HTTP status %@", @(wr.responseStatus)];
        _headersTextView.text = [headers description];
        
        _fetchButton.enabled = YES;
        [_activityIndicator stopAnimating];
    };
    
    r.errorBlock = ^(NSError *error) {
        _statusLabel.text = [error localizedDescription];
        
        NSLog(@"-- isCancellationError: %d", [error hm_isCancellationError]);
        
        _fetchButton.enabled = YES;
        [_activityIndicator stopAnimating];
    };
    
    [r startAsynchronous];
    //    [r cancel];
}

@end
