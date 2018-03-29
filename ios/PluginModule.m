//
//  PluginModule.m
//  DynamicLoadDemo
//
//  Created by Hays on 29/03/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "PluginModule.h"
#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "RNFuncViewController.h"

@interface PluginModule()

@end

@implementation PluginModule

RCT_EXPORT_MODULE(PluginModule);

+ (BOOL)requiresMainQueueSetup
{
  return YES;
}

RCT_EXPORT_METHOD(openPlugin1) {
  NSLog(@"test by Hays open plugin 1.");
  RNFuncViewController *vc = [[RNFuncViewController alloc] initWithBundleJS:@"plugin1" module:@"plugin1"];
  UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
  UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(back:)];
  vc.navigationItem.leftBarButtonItem = backButton;
  [[(AppDelegate *)[UIApplication sharedApplication].delegate rootViewController] presentViewController:nav animated:YES completion:nil];
}

RCT_EXPORT_METHOD(openPlugin2) {
  NSLog(@"test by Hays open plugin 2.");
  RNFuncViewController *vc = [[RNFuncViewController alloc] initWithBundleJS:@"plugin2" module:@"plugin2"];
  UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
  UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(back:)];
  vc.navigationItem.leftBarButtonItem = backButton;
  [[(AppDelegate *)[UIApplication sharedApplication].delegate rootViewController] presentViewController:nav animated:YES completion:nil];
}

- (void)back:(id)sender
{
  [[(AppDelegate *)[UIApplication sharedApplication].delegate rootViewController] dismissViewControllerAnimated:YES completion:nil];
}

@end
