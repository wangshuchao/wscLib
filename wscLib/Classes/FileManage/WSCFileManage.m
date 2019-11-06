//
//  WSCFileManage.m
//  Pods-wscLib_Example
//
//  Created by shuchao on 2019/11/6.
//

#import "WSCFileManage.h"
#define kNSFileManager [NSFileManager defaultManager]
@implementation WSCFileManage

#define InvitePath @"com.wsc.WSCFileManage"
+(UIImage *)getImageWithName:(NSString *)imgName{
    ///存在document目录下
    [self creatFolderWithAppendingPathComponent:InvitePath];
    NSString *filePath = [InvitePath stringByAppendingPathComponent:imgName];
    BOOL isHave = [self fileExistsAtPath:filePath];
    if (isHave) {
        NSData *imgData = [self readDataFromFileWithAppendingPathComponent:filePath];
        return [UIImage imageWithData:imgData];
    }
    return nil;
}
+(BOOL)writeInviteImage:(UIImage *)img name:(NSString *)nameStr{
    
    NSString *tempFolderPathString = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:InvitePath];
    NSString *filePath = [tempFolderPathString stringByAppendingPathComponent:nameStr];
    BOOL isSuc = [UIImageJPEGRepresentation(img, 1)writeToFile:filePath atomically:YES];
    return isSuc;
}


+ (BOOL)creatFolderWithAppendingPathComponent:(NSString *)appendingPathComponent {
    
    // 1. 指定要创建的文件夹的路径, 如果已存在则不会重复创建, 不存在则会创建
    NSString *tempFolderPathString = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:appendingPathComponent];
    // 2. 创建文件夹
    if ([kNSFileManager createDirectoryAtPath:tempFolderPathString withIntermediateDirectories:YES attributes:nil error:nil]) {
        
        return YES;
    }else {
        
        return NO;
    }
}

+ (BOOL)creatFileWithAppendingPathComponent:(NSString *)appendingPathComponent {
    
    // 1. 指定要创建的文件的路径, 如果已存在则不会重复创建, 不存在则会创建
    NSString *tempFilePathString = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:appendingPathComponent];
    // 2. 创建文件
    if ([kNSFileManager createFileAtPath:tempFilePathString contents:nil attributes:nil]) {
        
        return YES;
    }else {
        
        return NO;
    }
}

+ (BOOL)writeToFileWithSourceData:(id)sourceData
           AppendingPathComponent:(NSString *)appendingPathComponent {
    
    // 1. 指定要写入的文件的路径, 如果已存在则不会重复创建, 不存在则会创建
    NSString *tempFilePathString = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:appendingPathComponent];
    
    // 2. 数据写入文件
    if ([sourceData writeToFile:tempFilePathString atomically:YES]) {
        
        return YES;
    }else {
        
        return NO;
    }
}

+ (NSString *)readStringFromFileWithAppendingPathComponent:(NSString *)appendingPathComponent {
    
    // 1. 指定要读取的文件的路径
    NSString *tempFilePathString = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:appendingPathComponent];
    // 2. 读取文件
    NSError *error ;
    NSString *str = [NSString stringWithContentsOfFile:tempFilePathString encoding:NSUTF8StringEncoding error:&error];
    if (error == nil) {
        return str;
    }
    return @"";
}

+ (NSArray *)readArrayFromFileWithAppendingPathComponent:(NSString *)appendingPathComponent {
    
    // 1. 指定要读取的文件的路径
    NSString *tempFilePathString = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:appendingPathComponent];
    // 2. 读取文件
    return [NSArray arrayWithContentsOfFile:tempFilePathString];
    
}

+ (NSDictionary *)readDictionaryFromFileWithAppendingPathComponent:(NSString *)appendingPathComponent {
    
    // 1. 指定要读取的文件的路径
    NSString *tempFilePathString = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:appendingPathComponent];
    // 2. 读取文件
    return [NSDictionary dictionaryWithContentsOfFile:tempFilePathString];
}

+ (NSData *)readDataFromFileWithAppendingPathComponent:(NSString *)appendingPathComponent {
    
    // 1. 指定要读取的文件的路径
    NSString *tempFilePathString = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:appendingPathComponent];
    // 2. 读取文件
    return [NSData dataWithContentsOfFile:tempFilePathString];
}

+ (BOOL)fileExistsAtPath:(NSString *)appendingPathComponent {
    
    // 1. 指定要查询的文件的路径
    NSString *tempFilePathString = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:appendingPathComponent];
    // 2. 查询
    if ([kNSFileManager fileExistsAtPath:tempFilePathString]) {
        
        return YES;
    }else {
        
        return NO;
    }
}

+ (unsigned long long)fileSizeAtPath:(NSString *)appendingPathComponent {
    
    // 1. 指定要查询的文件的路径
    NSString *tempFilePathString = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:appendingPathComponent];
    // 2. 计算文件大小
    if ([self fileExistsAtPath:appendingPathComponent]) {
        
        return [[kNSFileManager attributesOfItemAtPath:tempFilePathString error:nil] fileSize];
    }else {
        
        return 0;
    }
}

+ (unsigned long long)folderSizeAtPath:(NSString *)appendingPathComponent {
    
    // 1. 指定要查询的文件夹的路径
    NSString *tempFilePathString = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:appendingPathComponent];
    // 2. 遍历文件夹下所有文件, 计算整个文件夹的大小
    if ([self fileExistsAtPath:appendingPathComponent]) {
        
        NSArray *fileNamesArray = [kNSFileManager subpathsAtPath:tempFilePathString];
        
        unsigned long long folderSize = 0;
        for (NSString *fileName in fileNamesArray) {
    
            NSString *filePath = [appendingPathComponent stringByAppendingPathComponent:fileName];
            folderSize += [self fileSizeAtPath:filePath];
        }
        
        return folderSize;
    }else {
        
        return 0;
    }
}

+ (BOOL)deleteFileAtPath:(NSString *)appendingPathComponent {
    
    // 1. 指定要删除的文件的路径
    NSString *tempFilePathString = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:appendingPathComponent];
    // 2. 删除
    if ([kNSFileManager removeItemAtPath:tempFilePathString error:nil]) {
        
        return YES;
    }else {
        
        return NO;
    }
}

+ (BOOL)moveFileAtPath:(NSString *)sourceAppendingPathComponent
                ToPath:(NSString *)targetAppendingPathComponent {
    
    // 1. 指定要移动文件的源路径和目标路径
    NSString *tempFilePathString = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:sourceAppendingPathComponent];
    NSString *tempFilePathString1 = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:targetAppendingPathComponent];
    
    // 2. 移动
    if ([kNSFileManager moveItemAtPath:tempFilePathString toPath:tempFilePathString1 error:nil]) {
        
        return YES;
    }else {
        
        return NO;
    }
}

+ (BOOL)renameFileAtPath:(NSString *)sourceAppendingPathComponent
                  ToPath:(NSString *)targetAppendingPathComponent {
    
    // 调用移动的方法实现文件重命名
    if ([self moveFileAtPath:sourceAppendingPathComponent ToPath:targetAppendingPathComponent]) {
        
        return YES;
    }else {
        
        return NO;
    }
    
}

@end
