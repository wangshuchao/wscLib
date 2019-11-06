//
//  WSCFileManage.h
//  Pods-wscLib_Example
//
//  Created by shuchao on 2019/11/6.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WSCFileManage : NSObject

// 沙盒的一些常用操作 : 这里所有方法要传递的路径都是对于 Documents 文件夹的相对路径
///获取本地邀请图片
+(UIImage *)getImageWithName:(NSString *)imgName;


+(BOOL )writeInviteImage:(UIImage *)img name:(NSString *)nameStr;

/**
 *  1. 创建文件夹
 *
 *  @param  appendingPathComponent  要创建的文件夹的相对路径
 *
 *  @return 文件夹是否创建成功
 */
+ (BOOL)creatFolderWithAppendingPathComponent:(NSString *)appendingPathComponent;


/**
 *  2. 创建文件
 *
 *  @param  appendingPathComponent  要创建的文件的相对路径
 *
 *  @return 文件是否创建成功
 */
+ (BOOL)creatFileWithAppendingPathComponent:(NSString *)appendingPathComponent;


/**
 *  3. 数据写入文件
 *
 *  @param  sourceData              要写入文件的数据
 *  @param  appendingPathComponent  要写入到的文件的相对路径
 *
 *  @return 数据是否写入成功
 */
+ (BOOL)writeToFileWithSourceData:(id)sourceData
           AppendingPathComponent:(NSString *)appendingPathComponent;


/**
 *  4. 读取文件数据
 *
 *  @param  appendingPathComponent  要读取的文件的相对路径
 *
 *  @return 读取到的文件
 */
+ (NSString *)readStringFromFileWithAppendingPathComponent:(NSString *)appendingPathComponent;
+ (NSArray *)readArrayFromFileWithAppendingPathComponent:(NSString *)appendingPathComponent;
+ (NSDictionary *)readDictionaryFromFileWithAppendingPathComponent:(NSString *)appendingPathComponent;
+ (NSData *)readDataFromFileWithAppendingPathComponent:(NSString *)appendingPathComponent;


/**
 *  5. 查询文件是否存在
 *
 *  @param  appendingPathComponent  要查询的文件的相对路径
 *
 *  @return 查询结果
 */
+ (BOOL)fileExistsAtPath:(NSString *)appendingPathComponent;


/**
 *  6. 计算单个文件的大小
 *
 *  @param  appendingPathComponent  要查询的文件的相对路径
 *
 *  @return 计算结果, 字节为单位
 */
+ (unsigned long long)fileSizeAtPath:(NSString *)appendingPathComponent;


/**
 *  7. 计算整个文件夹的大小
 *
 *  @param  appendingPathComponent  要查询的文件夹的相对路径
 *
 *  @return 计算结果, 字节为单位
 */
+ (unsigned long long)folderSizeAtPath:(NSString *)appendingPathComponent;


/**
 *  8. 删除文件
 *
 *  @param  appendingPathComponent  要删除的文件的相对路径
 *
 *  @return 删除结果
 */
+ (BOOL)deleteFileAtPath:(NSString *)appendingPathComponent;


/**
 *  9. 移动文件
 *
 *  @param  sourceAppendingPathComponent  要移动的文件的源相对路径
 *  @param  targetAppendingPathComponent  要移动的文件的目标相对路径
 *
 *  @return 移动结果
 */
+ (BOOL)moveFileAtPath:(NSString *)sourceAppendingPathComponent
                ToPath:(NSString *)targetAppendingPathComponent;


/**
 *  10. 文件重命名 : 本质是通过移动文件实现的
 *
 *  @param  sourceAppendingPathComponent  要重命名的文件的源相对路径(旧名字)
 *  @param  targetAppendingPathComponent  要重命名的文件的目标相对路径(新名字)
 *
 *  @return 重命名结果
 */
+ (BOOL)renameFileAtPath:(NSString *)sourceAppendingPathComponent
                  ToPath:(NSString *)targetAppendingPathComponent;

@end

NS_ASSUME_NONNULL_END
