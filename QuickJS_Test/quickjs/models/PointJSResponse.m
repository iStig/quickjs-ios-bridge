//
//  PointJSResponse.m
//  Point
//
//  Created by matrixme on 2023/7/17.
//

#import "PointJSResponse.h"

@implementation PointJSResponse

- (instancetype)init
{
    self = [super init];
    if (self) {
        _code = 200;
    }
    return self;
}

+ (instancetype)error:(NSInteger)code :(NSString *)message {
    PointJSResponse *res = [[PointJSResponse alloc] init];
    res.code = code;
    res.message = message;
    return res;
}

+ (instancetype)ok:(NSObject *)data {
    PointJSResponse *res = [[PointJSResponse alloc] init];
    res.data = data;
    return res;
}

@end
