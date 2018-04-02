//
//  RNFuncViewController.m
//  DynamicLoadDemo
//
//  Created by Hays on 29/03/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "RNFuncViewController.h"
#import <React/RCTRootView.h>

@interface RNFuncViewController ()<RCTBridgeDelegate>

@property(nonatomic, copy) NSString *bundleJS;
@property(nonatomic, copy) NSString *module;

@end

@implementation RNFuncViewController

- (instancetype)initWithBundleJS:(NSString *)bundleJS module:(NSString *)module
{
  self = [super init];
  if (self) {
    self.bundleJS = bundleJS;
    self.module = module;
  }
  return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:nil];
  NSDictionary *dict = @{@"param1": @"test by Hays !!!", @"param2": @"123"};
  RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge moduleName:self.module initialProperties:dict];
  self.view = rootView;
}

#pragma mark - RCTBridgeDelegate

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
//  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//  NSString *docDir = [paths objectAtIndex:0];
  NSString *path = [[NSBundle mainBundle] pathForResource:self.bundleJS ofType:@"jsbundle"];
//  NSLog(@"path : %@", path);
  return [NSURL URLWithString:path];
//  return [NSURL fileURLWithPath:[docDir stringByAppendingFormat:@"/%@.jsbundle", self.bundleJS]];
}

@end
