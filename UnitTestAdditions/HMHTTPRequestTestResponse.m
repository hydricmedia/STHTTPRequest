#import "HMHTTPRequestTestResponse.h"

@implementation HMHTTPRequestTestResponse

@synthesize block;

+ (HMHTTPRequestTestResponse *)testResponseWithBlock:(FillResponseBlock)block {
    HMHTTPRequestTestResponse *tr = [[HMHTTPRequestTestResponse alloc] init];
    tr.block = block;
    return tr;
}

@end
