//
//  WCYSystemSound.m
//  MyCategories
//
//  Created by wcy on 2018/9/12.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import "WCYSystemSound.h"

@implementation WCYSystemSound

+ (void)playSystemSound:(AudioID)audioID {
    AudioServicesPlaySystemSound((SystemSoundID)audioID);
}

+ (void)playSystemSoundVibrate {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

+ (SystemSoundID)playCustomSound:(NSURL * _Nonnull)soundURL {
    SystemSoundID soundID;
    
    OSStatus error = AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundURL), &soundID);
    if (error != kAudioServicesNoError) {
        NSLog(@"Could not load %@", soundURL);
    }
    return soundID;
}

+ (BOOL)disposeSound:(SystemSoundID)soundID {
    OSStatus error = AudioServicesDisposeSystemSoundID(soundID);
    if (error != kAudioServicesNoError) {
        NSLog(@"Error while disposing sound %i", (unsigned int)soundID);
        return NO;
    }
    
    return YES;
}

@end
