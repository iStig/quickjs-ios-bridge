//
//  SQBJSContainer.m
//  SQB
//
//  Created by matrixme on 2023/7/17.
//

#import "SQBJSContainer.h"
#import "SQBJSModuleCore.h"
#import "SQBJSProtocols.h"
#import "SQBJSManager.h"
#import "SQBJSInject.h"

//#import <YYKit/YYKit.h>

@interface SQBJSContainer ()

@property (nonatomic, strong) SQBJSModuleCore *coreModule;

@end

@implementation SQBJSContainer

- (instancetype)init {
    self = [super init];
    if (self) {
        _runtime = SQBJSManager.shared.runtime;
        _context = [_runtime newContext];
        [self prepareCoreModule];
        [self prepareInjections];
    }
    return self;
}

- (void)prepareCoreModule {
    QJSValue *global = [_context getGlobalValue];
    _coreModule = [[SQBJSModuleCore alloc] initWithRuntime:_runtime andContext:_context];
    [global setObject:_coreModule forKey:@"SQBJSCore"];
}

- (void)prepareInjections {
    NSArray<SQBJSInject *> *injections = SQBJSManager.shared.injections;
    for (SQBJSInject *inj in injections) {
        NSError *error2;
        NSURL *jsurl = [NSBundle.mainBundle URLForResource:inj.file withExtension:@"js"];
        NSString *jsstr = [NSString stringWithContentsOfURL:jsurl encoding:NSUTF8StringEncoding error:&error2];
        if (error2) {
            continue;
        }
        [_context eval:jsstr];
    }
}

- (QJSValue *)eval:(NSString *)script {
    return [self.context eval:script];;
}

- (QJSValue *)eval:(NSString *)script :(NSDictionary *)params {
    QJSValue *global = [_context getGlobalValue];
    [global setObject:params forKey:@"__query__"];
    [self eval:@"WOSAI.query=__query__;delete __query__;"];
    return  [self eval:script];
}

@end
