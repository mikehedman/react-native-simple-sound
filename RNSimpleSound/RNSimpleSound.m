//
//  RNSimpleSound.m
//  RNSimpleSound
//
//  Copyright © 2015 mikehedman. All rights reserved.
//

#import "RNSimpleSound.h"
#import <AVFoundation/AVFoundation.h>

@implementation RNSimpleSound {
  BOOL _enabled;
  AVAudioPlayer* player;
}

-(NSURL*) soundURL:(NSString*)fileName {
  return [[NSBundle mainBundle] URLForResource:[[fileName lastPathComponent]stringByDeletingPathExtension]
                                 withExtension:[fileName pathExtension]];
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(enable:(BOOL)enabled) {
  _enabled = enabled;
  AVAudioSession *session = [AVAudioSession sharedInstance];
  [session setCategory: AVAudioSessionCategoryAmbient error: nil];
  [session setActive: enabled error: nil];
}

RCT_EXPORT_METHOD(prepare:(NSString *)fileName) {
  player = [[AVAudioPlayer alloc] initWithContentsOfURL:[self soundURL:fileName] error:nil];
  [player prepareToPlay];
}

RCT_EXPORT_METHOD(play) {
  if (!_enabled || !player.url) {
    return;
  }

  [player play];
}

RCT_EXPORT_METHOD(pause) {
  if (!_enabled) {
    return;
  }
  [player pause];
}

RCT_EXPORT_METHOD(stop) {
    if (!_enabled) {
        return;
    }
    [player stop];
    //stop does not reset the player, so force it
    [player prepareToPlay];
}

@end