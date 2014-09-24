//
//  AppDelegate.m
//  TestPlayer
//
//  Created by BENJAMIN LISBAKKEN on 8/6/14.
//  Copyright (c) 2014 BENJAMIN LISBAKKEN. All rights reserved.
//

#import "AppDelegate.h"
#import "TestPlayerViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  // Override point for customization after application launch.
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  self.window.rootViewController = [[TestPlayerViewController alloc] init];
  return YES;
}

@end
