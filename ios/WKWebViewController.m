//
//  WKWebViewController.m
//  DynamicLoadDemo
//
//  Created by Hays on 2018/4/8.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "WKWebViewController.h"
#import <WebKit/WebKit.h>
#import "WebViewJavascriptBridge.h"

@interface WKWebViewController ()<WKNavigationDelegate>

@property(nonatomic, copy) NSString *path;
@property(nonatomic, strong) WebViewJavascriptBridge *bridge;

@end

@implementation WKWebViewController

- (instancetype)initWithPath:(NSString *)path
{
  self = [super init];
  if (self) {
    self.path = path;
  }
  return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"call" style:UIBarButtonItemStyleDone target:self action:@selector(callHandler:)];
  self.navigationItem.rightBarButtonItem = backButton;
  
  [WebViewJavascriptBridge enableLogging];
  WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
  webView.navigationDelegate = self;
  [self.view addSubview:webView];
  self.bridge = [WebViewJavascriptBridge bridgeForWebView:webView];
  [self.bridge setWebViewDelegate:self];
  
  [self.bridge registerHandler:@"testObjcCallback" handler:^(id data, WVJBResponseCallback responseCallback) {
    NSLog(@"testObjcCallback called: %@", data);
    responseCallback(@"Response from testObjcCallback");
  }];
  
  [self.bridge callHandler:@"testJavascriptHandler" data:@{ @"foo":@"before ready!!" }];
  
  NSString* appHtml = [NSString stringWithContentsOfFile:self.path encoding:NSUTF8StringEncoding error:nil];
  NSURL *baseURL = [NSURL fileURLWithPath:self.path];
  [webView loadHTMLString:appHtml baseURL:baseURL];
}

- (void)callHandler:(id)sender {
  id data = @{ @"greetingFromObjC": @"Hi there, JS!" };
  [self.bridge callHandler:@"testJavascriptHandler" data:data responseCallback:^(id response) {
    NSLog(@"testJavascriptHandler responded: %@", response);
  }];
}

#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
  NSLog(@"did start load webview.");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
  NSLog(@"did finish load webview.");
}

@end
