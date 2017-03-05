//
//  Copyright (c) 2017 Open Whisper Systems. All rights reserved.
//

#import "NSDate+millisecondTimeStamp.h"
#import "TSInfoMessage.h"

NS_ASSUME_NONNULL_BEGIN

@implementation TSInfoMessage

- (instancetype)initWithCoder:(NSCoder *)coder
{
    return [super initWithCoder:coder];
}

- (instancetype)initWithTimestamp:(uint64_t)timestamp
                         inThread:(TSThread *)thread
                      messageType:(TSInfoMessageType)infoMessage
{
    self = [super initWithTimestamp:timestamp
                           inThread:thread
                        messageBody:nil
                      attachmentIds:@[]
                   expiresInSeconds:0
                    expireStartedAt:0];

    if (!self) {
        return self;
    }

    _messageType = infoMessage;

    return self;
}

- (instancetype)initWithTimestamp:(uint64_t)timestamp
                         inThread:(TSThread *)thread
                      messageType:(TSInfoMessageType)infoMessage
                    customMessage:(NSString *)customMessage {
    self = [self initWithTimestamp:timestamp inThread:thread messageType:infoMessage];
    if (self) {
        _customMessage = customMessage;
    }
    return self;
}

+ (instancetype)userNotRegisteredMessageInThread:(TSThread *)thread {
    return [[self alloc] initWithTimestamp:[NSDate ows_millisecondTimeStamp]
                                  inThread:thread
                               messageType:TSInfoMessageUserNotRegistered];
}

- (NSString *)description {
    switch (_messageType) {
        case TSInfoMessageTypeSessionDidEnd:
            return NSLocalizedString(@"SECURE_SESSION_RESET", nil);
        case TSInfoMessageTypeUnsupportedMessage:
            return NSLocalizedString(@"UNSUPPORTED_ATTACHMENT", nil);
        case TSInfoMessageUserNotRegistered:
            return NSLocalizedString(@"CONTACT_DETAIL_COMM_TYPE_INSECURE", nil);
        case TSInfoMessageTypeGroupQuit:
            return NSLocalizedString(@"GROUP_YOU_LEFT", nil);
        case TSInfoMessageTypeGroupUpdate:
            return _customMessage != nil ? _customMessage : NSLocalizedString(@"GROUP_UPDATED", nil);
        default:
            break;
    }

    return @"Unknown Info Message Type";
}

@end

NS_ASSUME_NONNULL_END
