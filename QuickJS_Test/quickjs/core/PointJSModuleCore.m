//
//  PointJSModuleCore.m
//  Point
//
//  Created by matrixme on 2023/7/18.
//

#import "PointJSModuleCore.h"
#import "PointJSCallArgv.h"
#import "PointJSResponse.h"
#import "PointJSManager.h"
#import "PointJSProtocols.h"
#import <YYKit.h>

@implementation PointJSModuleCore

- (instancetype)initWithRuntime:(QJSRuntime *)rt andContext:(QJSContext *)ctx {
    PointJSModuleCore *mdl = [[PointJSModuleCore alloc] init];
    mdl->_runtime = rt;
    mdl->_context = ctx;
    return mdl;
}

- (NSString *)callSync:(NSString *)json {
    PointJSCallArgv *argv = [PointJSCallArgv modelWithJSON:json];
    if (!argv) {
        PointJSResponse *res = [PointJSResponse error:403 :@"argv error, permission denied."];
        return res.modelToJSONString;
    }
    NSObject<PointJSCharacterSync> *character = [PointJSManager.shared generateSyncCharacterBy:argv];
    PointJSResponse *res = [character jsResponse:self.context withArgv:argv];
    return res.modelToJSONString;
}

- (void)call:(NSString *)json {
    PointJSCallArgv *argv = [PointJSCallArgv modelWithJSON:json];
    if (!argv || argv.callbackId == 0) {
        return;
    }
    NSObject<PointJSCharacterAsync> *character = [PointJSManager.shared generateAsyncCharacterBy:argv];
    @weakify(self);
    [character jsResponse:self.context withArgv:argv callback:^(PointJSResponse *resp) {
        @strongify(self);
        [self callbackQuickJSWithResponse:resp forCallbackId:argv.callbackId];
    }];
}

- (void)callbackQuickJSWithResponse:(PointJSResponse *)resp forCallbackId:(NSInteger)cbid {
    NSString *respjson = resp.modelToJSONString;
    NSString *jsstr = [NSString stringWithFormat:@"_nativeCallback(%ld, %@)", cbid, respjson];
    [self.context eval:jsstr];
}

@end
