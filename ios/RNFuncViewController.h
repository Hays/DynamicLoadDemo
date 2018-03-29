//
//  RNFuncViewController.h
//  DynamicLoadDemo
//
//  Created by Hays on 29/03/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RNFuncViewController : UIViewController

- (instancetype)initWithBundleJS:(NSString *)bundleJS module:(NSString *)module;

@end
