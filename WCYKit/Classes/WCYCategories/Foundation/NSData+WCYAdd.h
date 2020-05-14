//
//  NSData+WCYAdd.h
//  MyCategories
//
//  Created by 汇元 on 2018/7/4.
//  Copyright © 2018年 汇元. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 为NSData创建的扩展类
 */
@interface NSData (WCYAdd)

#pragma mark - Hash
/**
 Returns a lowercase NSString for md2 hash.
 */
- (NSString *_Nonnull)md2String;

/**
 Returns an NSData for md2 hash.
 */
- (NSData *_Nonnull)md2Data;

/**
 Returns a lowercase NSString for md4 hash.
 */
- (NSString *_Nonnull)md4String;

/**
 Returns an NSData for md4 hash.
 */
- (NSData *_Nonnull)md4Data;

/**
 Returns a lowercase NSString for md5 hash.
 */
- (NSString *_Nonnull)md5String;

/**
 Returns an NSData for md5 hash.
 */
- (NSData *_Nonnull)md5Data;

/**
 Returns a lowercase NSString for sha1 hash.
 */
- (NSString *_Nonnull)sha1String;

/**
 Returns an NSData for sha1 hash.
 */
- (NSData *_Nonnull)sha1Data;

/**
 Returns a lowercase NSString for sha224 hash.
 */
- (NSString *_Nonnull)sha224String;

/**
 Returns an NSData for sha224 hash.
 */
- (NSData *_Nonnull)sha224Data;

/**
 Returns a lowercase NSString for sha256 hash.
 */
- (NSString *_Nonnull)sha256String;

/**
 Returns an NSData for sha256 hash.
 */
- (NSData *_Nonnull)sha256Data;

/**
 Returns a lowercase NSString for sha384 hash.
 */
- (NSString *_Nonnull)sha384String;

/**
 Returns an NSData for sha384 hash.
 */
- (NSData *_Nonnull)sha384Data;

/**
 Returns a lowercase NSString for sha512 hash.
 */
- (NSString *_Nonnull)sha512String;

/**
 Returns an NSData for sha512 hash.
 */
- (NSData *_Nonnull)sha512Data;

/**
 Returns a lowercase NSString for hmac using algorithm md5 with key.
 @param key  The hmac key.
 */
- (NSString *_Nonnull)hmacMD5StringWithKey:(NSString *_Nonnull)key;

/**
 Returns an NSData for hmac using algorithm md5 with key.
 @param key  The hmac key.
 */
- (NSData *_Nonnull)hmacMD5DataWithKey:(NSData *_Nonnull)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha1 with key.
 @param key  The hmac key.
 */
- (NSString *_Nonnull)hmacSHA1StringWithKey:(NSString *_Nonnull)key;

/**
 Returns an NSData for hmac using algorithm sha1 with key.
 @param key  The hmac key.
 */
- (NSData *_Nonnull)hmacSHA1DataWithKey:(NSData *_Nonnull)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha224 with key.
 @param key  The hmac key.
 */
- (NSString *_Nonnull)hmacSHA224StringWithKey:(NSString *_Nonnull)key;

/**
 Returns an NSData for hmac using algorithm sha224 with key.
 @param key  The hmac key.
 */
- (NSData *_Nonnull)hmacSHA224DataWithKey:(NSData *_Nonnull)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha256 with key.
 @param key  The hmac key.
 */
- (NSString *_Nonnull)hmacSHA256StringWithKey:(NSString *_Nonnull)key;

/**
 Returns an NSData for hmac using algorithm sha256 with key.
 @param key  The hmac key.
 */
- (NSData *_Nonnull)hmacSHA256DataWithKey:(NSData *_Nonnull)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha384 with key.
 @param key  The hmac key.
 */
- (NSString *_Nonnull)hmacSHA384StringWithKey:(NSString *_Nonnull)key;

/**
 Returns an NSData for hmac using algorithm sha384 with key.
 @param key  The hmac key.
 */
- (NSData *_Nonnull)hmacSHA384DataWithKey:(NSData *_Nonnull)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha512 with key.
 @param key  The hmac key.
 */
- (NSString *_Nonnull)hmacSHA512StringWithKey:(NSString *_Nonnull)key;

/**
 Returns an NSData for hmac using algorithm sha512 with key.
 @param key  The hmac key.
 */
- (NSData *_Nonnull)hmacSHA512DataWithKey:(NSData *_Nonnull)key;

/**
 Returns a lowercase NSString for crc32 hash.
 */
- (NSString *_Nonnull)crc32String;

/**
 Returns crc32 hash.
 */
- (uint32_t)crc32;


#pragma mark - Encrypt and Decrypt
///=============================================================================
/// @name Encrypt and Decrypt
///=============================================================================

/**
 Returns an encrypted NSData using AES.
 
 @param key   A key length of 16, 24 or 32 (128, 192 or 256bits).
 
 @param iv    An initialization vector length of 16(128bits).
 Pass nil when you don't want to use iv.
 
 @return      An NSData encrypted, or nil if an error occurs.
 */
- (nullable NSData *)aes256EncryptWithKey:(NSData *_Nonnull)key iv:(nullable NSData *)iv;

/**
 Returns an decrypted NSData using AES.
 
 @param key   A key length of 16, 24 or 32 (128, 192 or 256bits).
 
 @param iv    An initialization vector length of 16(128bits).
 Pass nil when you don't want to use iv.
 
 @return      An NSData decrypted, or nil if an error occurs.
 */
- (nullable NSData *)aes256DecryptWithkey:(NSData *_Nonnull)key iv:(nullable NSData *)iv;


#pragma mark - Encode and decode
///=============================================================================
/// @name Encode and decode
///=============================================================================

/**
 Returns string decoded in UTF8.
 */
- (nullable NSString *)utf8String;

/**
 Returns a uppercase NSString in HEX.
 */
- (nullable NSString *)hexString;

/**
 Returns an NSData from hex string.
 
 @param hexString   The hex string which is case insensitive.
 
 @return a new NSData, or nil if an error occurs.
 */
+ (nullable NSData *)dataWithHexString:(NSString *_Nonnull)hexString;

/**
 Returns an NSString for base64 encoded.
 */
- (nullable NSString *)base64EncodedString;

/**
 Returns an NSData from base64 encoded string.
 
 @warning This method has been implemented in iOS7.
 
 @param base64EncodedString  The encoded string.
 */
+ (nullable NSData *)dataWithBase64EncodedString:(NSString *_Nonnull)base64EncodedString;

/**
 Returns an NSDictionary or NSArray for decoded self.
 Returns nil if an error occurs.
 */
- (nullable id)jsonValueDecoded;


#pragma mark - Inflate and deflate
///=============================================================================
/// @name Inflate and deflate
///=============================================================================

/**
 Decompress data from gzip data.
 @return Inflated data.
 */
- (nullable NSData *)gzipInflate;

/**
 Comperss data to gzip in default compresssion level.
 @return Deflated data.
 */
- (nullable NSData *)gzipDeflate;

/**
 Decompress data from zlib-compressed data.
 @return Inflated data.
 */
- (nullable NSData *)zlibInflate;

/**
 Comperss data to zlib-compressed in default compresssion level.
 @return Deflated data.
 */
- (nullable NSData *)zlibDeflate;

@end
