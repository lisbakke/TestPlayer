//
//  PlayerLayerView.h
//  TestPlayer
//
//  Created by BENJAMIN LISBAKKEN on 8/6/14.
//  Copyright (c) 2014 BENJAMIN LISBAKKEN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface PlayerLayerView : UIView

@property (nonatomic, strong) AVPlayer *player;

- (void)setPlayer:(AVPlayer *)player;
- (void)setVideoFillMode:(NSString*)fillMode;

@end
