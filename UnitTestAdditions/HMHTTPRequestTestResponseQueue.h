#import <Foundation/Foundation.h>

@class HMHTTPRequestTestResponse;

@interface HMHTTPRequestTestResponseQueue : NSObject

@property (nonatomic, retain) NSMutableArray *responses;

+ (instancetype)sharedInstance;

- (void)enqueue:(HMHTTPRequestTestResponse *)response;
- (HMHTTPRequestTestResponse *)dequeue;

@end
