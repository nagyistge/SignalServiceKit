//
//  Copyright (c) 2017 Open Whisper Systems. All rights reserved.
//

#import "TSMessage.h"

NS_ASSUME_NONNULL_BEGIN

@interface TSInfoMessage : TSMessage

typedef NS_ENUM(NSInteger, TSInfoMessageType) {
    TSInfoMessageTypeSessionDidEnd,
    TSInfoMessageUserNotRegistered,
    TSInfoMessageTypeUnsupportedMessage,
    TSInfoMessageTypeGroupUpdate,
    TSInfoMessageTypeGroupQuit,
    TSInfoMessageTypeDisappearingMessagesUpdate
};

+ (instancetype)userNotRegisteredMessageInThread:(TSThread *)thread;

@property TSInfoMessageType messageType;
@property NSString *customMessage;

- (instancetype)initWithCoder:(NSCoder *)coder NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithTimestamp:(uint64_t)timestamp
                         inThread:(TSThread *)contact
                      messageType:(TSInfoMessageType)infoMessage NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithTimestamp:(uint64_t)timestamp
                         inThread:(TSThread *)thread
                      messageType:(TSInfoMessageType)infoMessage
                    customMessage:(NSString *)customMessage;

- (instancetype)initWithTimestamp:(uint64_t)timestamp
                         inThread:(nullable TSThread *)thread
                      messageBody:(nullable NSString *)body
                    attachmentIds:(NSArray<NSString *> *)attachmentIds
                 expiresInSeconds:(uint32_t)expiresInSeconds
                  expireStartedAt:(uint64_t)expireStartedAt NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
