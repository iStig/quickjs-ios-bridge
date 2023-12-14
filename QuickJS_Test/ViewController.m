//
//  ViewController.m
//  QuickJS_Test
//
//  Created by zhangjianming on 2023/7/18.
//

#import "ViewController.h"
#import "SQBJSContainer.h"

@interface ViewController ()
@property (nonatomic, strong)  SQBJSContainer *jscontainer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.jscontainer = [SQBJSContainer new];
    [self setupSubviews];
}


- (void)action1 {
    [self.jscontainer eval:@"console.log('>>>>'+WOSAI.system.env)"];
}

- (void)action2 {
    [self.jscontainer eval:@"console.log('>>>>' + WOSAI.system.env())"];
}

- (void)action3 {
    [self.jscontainer eval:@"console.log('>>>>' + JSON.stringify(WOSAI.system.env()))"];
}

- (void)action4 {
    [self.jscontainer eval:@"let result = WOSAI.system.env(console.log('>>>>WOSAI.system.env_result');); console.log('>>>>' + JSON.stringify(result));"];
}

- (void)action5 { //异步回调
//    [self.jscontainer eval:@"WOSAI.location.position({ a: 1 },(param) => {console.log('>>>>' + JSON.stringify(param));});"];
    [self.jscontainer eval:@"WOSAI.location.position({ a: 1 },function(param){console.log('>>>>' + JSON.stringify(param));});"];
}

- (void)action6 { //同步 无入餐
    [self.jscontainer eval:@"WOSAI.web.callSync(function(param){console.log('>>>>' + JSON.stringify(param));});"];
}

- (void)action7 { //同步 有入参
    [self.jscontainer eval:@"let result = WOSAI.web.callSync({module:'aaa',method:'bbb',params:{cccc:'dddd'}}); console.log('>>>>' + JSON.stringify(result));"];
}

- (void)action8 { //异步 有入参 有回调
    [self.jscontainer eval:@"WOSAI.web.callAsync({module:'aaa',method:'bbb',params:{cccc:'dddd'}},(param) => {console.log('>>>>' + JSON.stringify(param));});"];
}


- (void)setupSubviews {
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat x = 100/2;
    CGFloat y = 100;
    CGFloat h = 40;
    CGFloat space = 20;
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(x , y, screenW - x*2, h);
        btn.backgroundColor = UIColor.redColor;
        [btn setTitle:@"打印js方法名" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(action1) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    
    {
        y = y + h + space;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(x , y, screenW - x*2, h);
        btn.backgroundColor = UIColor.redColor;
        [btn setTitle:@"js方法回调后信息结果" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(action2) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    
    {
        y = y + h + space;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(x , y, screenW - x*2, h);
        btn.backgroundColor = UIColor.redColor;
        [btn setTitle:@"js方法回调信息结果字符串化" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(action3) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    
    {
        y = y + h + space;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(x , y, screenW - x*2, h);
        btn.backgroundColor = UIColor.redColor;
        [btn setTitle:@"js方法回调信息结果字符串化" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(action4) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    {
        y = y + h + space;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(x , y, screenW - x*2, h);
        btn.backgroundColor = UIColor.redColor;
        [btn setTitle:@"异步js方法回调结果字符串化" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(action5) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    {
        y = y + h + space;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(x , y, screenW - x*2, h);
        btn.backgroundColor = UIColor.redColor;
        [btn setTitle:@"直接使用callSync" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(action6) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    {
        y = y + h + space;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(x , y, screenW - x*2, h);
        btn.backgroundColor = UIColor.redColor;
        [btn setTitle:@"直接使用callSync 带入参" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(action7) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    
    {
        y = y + h + space;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(x , y, screenW - x*2, h);
        btn.backgroundColor = UIColor.redColor;
        [btn setTitle:@"直接使用callASync 带入参" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(action8) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    
}



@end


//native传参数给jsenv
//    [self.jscontainer eval:@"console.log(JSON.stringify(WOSAI.query));" :@{@"HELLO":@"world"}];
//    [self.jscontainer eval:@"console.log(JSON.stringify(WOSAI.query));" :@[@"1",@"2"]];
//    [self.jscontainer eval:@"console.log(JSON.stringify(WOSAI.query));" :@"test"];
  

//    {
//        Class class = NSClassFromString(@"QuickJS_Test.SQBJSModuleSystem");
//        NSLog(@"%@",class);
//    }

//    {
//        Class class = NSClassFromString(@"SQBJSResponse");
//        NSLog(@"%@",class);
//    }
