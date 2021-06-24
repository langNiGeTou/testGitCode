//
//  DetailTabCellVC.m
//  gitTest
//
//  Created by 17090416 on 2021/4/11.
//

#import "DetailTabVC.h"
#import <WebKit/WebKit.h>
@interface DetailTabVC () <WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *myWebView;
@property (nonatomic, strong) UIProgressView *progressView;
@end

@implementation DetailTabVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:({
        self.myWebView = [[WKWebView alloc]initWithFrame:self.view.bounds];
        [self.myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.jianshu.com/p/ed876eed04f0"]]];
        self.myWebView.navigationDelegate = self;
        self.myWebView;
    })];
    
    [self.myWebView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 88, self.view.bounds.size.width, 20)];
        self.progressView;
    })];
    
  
    
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    decisionHandler(WKNavigationActionPolicyAllow);
    
      
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation
{
    NSLog(@"加载完毕");
}

#pragma mark - kvo
- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context{
    self.progressView.progress = [change[@"new"] intValue];
}

- (void)dealloc
{
    [self.myWebView removeObserver:self forKeyPath:@"estimatedProgress"];
}


@end
