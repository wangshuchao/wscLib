//
//  MrWangUUID.m
//  Pods
//
//  Created by shuchao on 2019/10/25.
//

#import "MrWangUUID.h"
#import <SAMKeychain/SAMKeychain.h>


#define  KEY_USERNAME_PASSWORD @"com.wang.app.usernamepassword"
#define  Key_service @"com.wang.apple.uuid"
#define  KEY_USERNAME @"com.wang.app.uuid"
#define  KEY_PASSWORD @"com.wang.app.password"

@implementation MrWangUUID
+(NSString *)getUUID{
    ///从钥匙串获取
    NSString *uuidStr = [SAMKeychain passwordForService:Key_service account:KEY_USERNAME];
    
    if (!uuidStr || uuidStr.length < 1) {
        
        //生成一个uuid的方法
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        
        uuidStr = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
        CFRelease(uuidRef);
        ///保存到钥匙串
        [SAMKeychain setPassword:uuidStr forService:Key_service account:KEY_USERNAME];
    }
    return uuidStr;
}
@end
