//
//  ViewController.m
//  QuickJS_Test
//
//  Created by zhangjianming on 2023/7/18.
//

#import "ViewController.h"
#import "PointJSContainer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    PointJSContainer *jscontainer = [PointJSContainer new];
//    [jscontainer eval:@"console.log(WOSAI.system.env)"];
    [jscontainer eval:@"let result = WOSAI.system.env(console.log('******')); console.log('>>>>'+JSON.stringify(result))"];
    
//    [jscontainer eval:@"WOSAI.location.position((param) => {console.log(param)});"];
    
    [jscontainer eval:@"WOSAI.location.position(function(param){console.log('>>>>'+JSON.stringify(param));});"];//console.log(param);

    

//    {
//        Class class = NSClassFromString(@"QuickJS_Test.PointJSModuleSystem");
//        NSLog(@"%@",class);
//    }
//
//    {
//        Class class = NSClassFromString(@"PointJSResponse");
//        NSLog(@"%@",class);
//    }
}


@end
