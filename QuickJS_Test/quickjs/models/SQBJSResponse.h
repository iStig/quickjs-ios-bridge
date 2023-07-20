//
//  SQBJSResponse.h
//  SQB
//
//  Created by matrixme on 2023/7/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SQBJSResponse : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, strong) NSObject *data;

+ (instancetype)error:(NSInteger)code :(NSString *)message;
+ (instancetype)ok:(NSObject *)data;

@end

NS_ASSUME_NONNULL_END
