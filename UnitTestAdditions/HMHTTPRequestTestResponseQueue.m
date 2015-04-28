#import "HMHTTPRequestTestResponseQueue.h"
#import "HMHTTPRequestTestResponse.h"

static HMHTTPRequestTestResponseQueue *sharedInstance = nil;

@implementation HMHTTPRequestTestResponseQueue

+ (instancetype)sharedInstance {
    static HMHTTPRequestTestResponseQueue *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    self = [super init];
    self.responses = [NSMutableArray array];
    return self;
}

/**/

- (void)enqueue:(HMHTTPRequestTestResponse *)response {
    NSAssert(response != nil, @"can't enqueue nil");

    [_responses insertObject:response atIndex:0];
}

- (HMHTTPRequestTestResponse *)dequeue {
    
    if([_responses count] == 0) {
        NSLog(@"Cannot dequeue response");
        return nil;
    }
    
    NSUInteger lastIndex = [_responses count] - 1;
    
    HMHTTPRequestTestResponse *response = [_responses objectAtIndex:lastIndex];
    
    [_responses removeObjectAtIndex:lastIndex];
    
    return response;
}

@end
