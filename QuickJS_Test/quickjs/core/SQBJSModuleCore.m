//
//  SQBJSModuleCore.m
//  SQB
//
//  Created by matrixme on 2023/7/18.
//

#import "SQBJSModuleCore.h"
#import "SQBJSCallArgv.h"
#import "SQBJSResponse.h"
#import "SQBJSManager.h"
#import "SQBJSProtocols.h"
#import <YYKit/YYKit.h>

@implementation SQBJSModuleCore

- (instancetype)initWithRuntime:(QJSRuntime *)rt andContext:(QJSContext *)ctx {
    SQBJSModuleCore *mdl = [[SQBJSModuleCore alloc] init];
    mdl->_runtime = rt;
    mdl->_context = ctx;
    return mdl;
}

- (NSString *)callSync:(NSString *)json {
    SQBJSCallArgv *argv = [SQBJSCallArgv modelWithJSON:json];
    if (!argv) {
        SQBJSResponse *res = [SQBJSResponse error:403 :@"argv error, permission denied."];
        return res.modelToJSONString;
    }
    NSObject<SQBJSCharacterSync> *character = [SQBJSManager.shared generateSyncCharacterBy:argv];
    SQBJSResponse *res = [character jsResponse:self.context withArgv:argv];
    return res.modelToJSONString;
}

- (void)call:(NSString *)json {
    SQBJSCallArgv *argv = [SQBJSCallArgv modelWithJSON:json];
    if (!argv || argv.callbackId == 0) {
        return;
    }
    NSObject<SQBJSCharacterAsync> *character = [SQBJSManager.shared generateAsyncCharacterBy:argv];
    @weakify(self);
    [character jsResponse:self.context withArgv:argv callback:^(SQBJSResponse *resp) {
        @strongify(self);
        [self callbackQuickJSWithResponse:resp forCallbackId:argv.callbackId];
    }];
}

- (void)callbackQuickJSWithResponse:(SQBJSResponse *)resp forCallbackId:(NSInteger)cbid {
    NSString *respjson = resp.modelToJSONString;
    NSString *jsstr = [NSString stringWithFormat:@"_nativeCallback(%ld, %@)", cbid, respjson];
    NSLog(@"%@",jsstr);
    [self.context eval:jsstr];
}

@end
