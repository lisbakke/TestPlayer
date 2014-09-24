//
//  TestPlayerViewController.m
//  TestPlayer
//
//  Created by BENJAMIN LISBAKKEN on 8/6/14.
//  Copyright (c) 2014 BENJAMIN LISBAKKEN. All rights reserved.
//

#import "TestPlayerViewController.h"

#import "PlayerLayerView.h"

@interface TestPlayerViewController ()
@property (strong, nonatomic) AVQueuePlayer *avPlayer;
@property (strong, nonatomic) NSArray *playerUrls;
@property (weak, nonatomic) IBOutlet PlayerLayerView *playerView;
@property (weak, nonatomic) IBOutlet UILabel *curTimeLabel;
@property (weak, nonatomic) NSString *curPlayerUrl;
@end

@implementation TestPlayerViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.playerUrls = [NSArray arrayWithObjects:
                     @"http://content.kamcord.com/stream/v4/iqIkOQnkvae/ios_playlist.m3u8",
                     @"http://content.kamcord.com/stream/v4/1XdQMxEsjGg/ios_playlist.m3u8",
                     @"http://content.kamcord.com/stream/v4/ioVyC7LHZWK/ios_playlist.m3u8",
                     nil];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  self.view = nil;
}

- (void)viewDidAppear:(BOOL)animated {
  if (!self.curPlayerUrl) {
    self.curPlayerUrl = self.playerUrls.firstObject;
  } else {
    for (NSInteger i = 0; i <= [self.playerUrls count]; i++) {
      if (self.curPlayerUrl == self.playerUrls[i]) {
        self.curPlayerUrl = self.playerUrls[i + 1];
      }
    }
  }
  NSURL *url = [NSURL URLWithString:self.curPlayerUrl];
  self.avPlayer = [AVQueuePlayer playerWithURL:url];
  self.playerView.player = self.avPlayer;
  [self.playerView.player play];
  [self.avPlayer addPeriodicTimeObserverForInterval:CMTimeMakeWithSeconds(0.01f, NSEC_PER_SEC) queue:NULL usingBlock:^(CMTime time) {
    self.curTimeLabel.text = [NSString stringWithFormat:@"%.f", CMTimeGetSeconds(self.avPlayer.currentItem.currentTime)];
  }];
  [[NSNotificationCenter defaultCenter] addObserverForName:AVPlayerItemDidPlayToEndTimeNotification
                                                    object:self.avPlayer.currentItem
                                                     queue:nil
                                                usingBlock:^(NSNotification *note) {
    [self viewDidAppear:NO];
  }];
}

@end
