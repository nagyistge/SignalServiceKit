//
//  Copyright (c) 2017 Open Whisper Systems. All rights reserved.
//

#import "OWSFakeContactsUpdater.h"
#import "SignalRecipient.h"

NS_ASSUME_NONNULL_BEGIN

@implementation OWSFakeContactsUpdater

- (nullable SignalRecipient *)synchronousLookup:(NSString *)identifier error:(NSError **)error
{
    NSLog(@"[OWSFakeContactsUpdater] Faking contact lookup.");
    return [[SignalRecipient alloc] initWithTextSecureIdentifier:@"fake-recipient-id"
                                                           relay:nil
                                                   supportsVoice:YES
                                                  supportsWebRTC:YES];
}

@end

NS_ASSUME_NONNULL_END
