#import <Foundation/Foundation.h>
#import "HMHTTPRequest.h"

// placeholder to simulate server responses
// to be used in a HMHTTPRequestTestResponseQueue

typedef void(^FillResponseBlock)(HMHTTPRequest *r);

@interface HMHTTPRequestTestResponse : NSObject

@property (nonatomic, copy) FillResponseBlock block;

+ (HMHTTPRequestTestResponse *)testResponseWithBlock:(FillResponseBlock)block;

@end
