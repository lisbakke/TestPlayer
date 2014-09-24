//
//  PlayerLayerView.m
//  TestPlayer
//
//  Created by BENJAMIN LISBAKKEN on 8/6/14.
//  Copyright (c) 2014 BENJAMIN LISBAKKEN. All rights reserved.
//

#import "PlayerLayerView.h"

@implementation PlayerLayerView


+ (Class)layerClass {
  return [AVPlayerLayer class];
}

- (void)setPlayer:(AVPlayer *)player {
  [(AVPlayerLayer*)[self layer] setPlayer:player];
}

- (AVPlayer*)player {
  return [(AVPlayerLayer*)[self layer] player];
}

- (void)setVideoFillMode:(NSString *)fillMode {
  AVPlayerLayer *playerLayer = (AVPlayerLayer*)[self layer];
  playerLayer.videoGravity = fillMode;
}

@end
