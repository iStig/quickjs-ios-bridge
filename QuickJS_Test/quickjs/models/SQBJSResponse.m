//
//  SQBJSResponse.m
//  SQB
//
//  Created by matrixme on 2023/7/17.
//

#import "SQBJSResponse.h"

@implementation SQBJSResponse

- (instancetype)init
{
    self = [super init];
    if (self) {
        _code = 200;
    }
    return self;
}

+ (instancetype)error:(NSInteger)code :(NSString *)message {
    SQBJSResponse *res = [[SQBJSResponse alloc] init];
    res.code = code;
    res.message = message;
    return res;
}

+ (instancetype)ok:(NSObject *)data {
    SQBJSResponse *res = [[SQBJSResponse alloc] init];
    res.data = data;
    return res;
}

@end
