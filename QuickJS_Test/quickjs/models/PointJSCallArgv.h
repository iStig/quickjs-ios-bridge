//
//  PointJSCallArgv.h
//  Point
//
//  Created by matrixme on 2023/7/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, PointJSCallType) {
    PointJSCallTypeAsync,
    PointJSCallTypeSync,
};

@interface PointJSCallArgv : NSObject

@property (nonatomic, assign) PointJSCallType type;
@property (nonatomic, copy) NSString *module;
@property (nonatomic, copy) NSString *method;
@property (nonatomic, copy) NSDictionary *params;
@property (nonatomic, assign) NSInteger callbackId;

@end

NS_ASSUME_NONNULL_END
