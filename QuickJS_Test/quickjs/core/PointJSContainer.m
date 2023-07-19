//
//  PointJSContainer.m
//  Point
//
//  Created by matrixme on 2023/7/17.
//

#import "PointJSContainer.h"
#import "PointJSModuleCore.h"
#import "PointJSProtocols.h"
#import "PointJSManager.h"
#import "PointJSInject.h"

#import <YYKit/YYKit.h>

@interface PointJSContainer ()

@property (nonatomic, strong) PointJSModuleCore *coreModule;

@end

@implementation PointJSContainer

- (instancetype)init {
    self = [super init];
    if (self) {
        _runtime = PointJSManager.shared.runtime;
        _context = [_runtime newContext];
        [self prepareCoreModule];
        [self prepareInjections];
    }
    return self;
}

- (void)prepareCoreModule {
    QJSValue *global = [_context getGlobalValue];
    _coreModule = [[PointJSModuleCore alloc] initWithRuntime:_runtime andContext:_context];
    [global setObject:_coreModule forKey:@"PointJSCore"];
}

- (void)prepareInjections {
    NSArray<PointJSInject *> *injections = PointJSManager.shared.injections;
    for (PointJSInject *inj in injections) {
        NSError *error2;
        NSURL *jsurl = [NSBundle.mainBundle URLForResource:inj.file withExtension:@"js"];
        NSString *jsstr = [NSString stringWithContentsOfURL:jsurl encoding:NSUTF8StringEncoding error:&error2];
        if (error2) {
            continue;
        }
        [self.context eval:jsstr];
    }
}

- (QJSValue *)eval:(NSString *)script {
    return [_context eval:script];;
}

- (QJSValue *)eval:(NSString *)script :(NSDictionary *)params {
    QJSValue *global = [_context getGlobalValue];
    [global setObject:params forKey:@"__query__"];
    [self eval:@"WOSAI.query=__query__;delete __query__;"];
    return  [self eval:script];
}

@end
