//
//  HttpNetWork.m
//  ttl
//
//  Created by why on 2017/9/18.
//  Copyright © 2017年 why. All rights reserved.
//

#import "HttpNetWork.h"
#import "UploadParam.h"
#import "AFNetworking.h"
#import "ZDUser.h"


@implementation HttpNetWork

static id _instance = nil;


+ (instancetype)sharedInstance {
    return [[self alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];

    });
    return _instance;
    
}



//- (instancetype)init {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _instance = [super init];
//
//    });
//    return _instance;
//}

#pragma mark -- GET请求 --
- (void)getWithURLString:(NSString *)URLString
              parameters:(id)parameters
                 success:(DDCompleteBlock)success
                 failure:(void (^)(NSError *))failure {
   
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
   
    

    /**
     *  可以接受的类型
     */
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    /**
     *  请求队列的最大并发数
     */
    //    manager.operationQueue.maxConcurrentOperationCount = 5;
    /**
     *  请求超时的时间
     */
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];

    NSMutableDictionary *headers = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies].mutableCopy;
    
    
    [manager.requestSerializer setValue:headers[@"Cookie"] forHTTPHeaderField:@"Cookie"];
    
    manager.requestSerializer.timeoutInterval = 10;
    
    [manager GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *fields = ((NSHTTPURLResponse*)task.response).allHeaderFields;
        
        NSURL *url = [NSURL URLWithString:URLString];
        
        
        //获取cookie方法
        NSArray *cookies = [NSHTTPCookie cookiesWithResponseHeaderFields:fields forURL:url];

        for (NSHTTPCookie *cookie in cookies) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie]; // 保存
        }

      
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        
        NSString *str = [NSString stringWithFormat:@"%@", [dict objectForKey:@"code"]];
        NSString * errorMessage=[dict objectForKey:@"msg"];
        
        BOOL isSuccess=[str isEqualToString:@"200"]?YES:NO;
        BOOL igNoreLogin =false;
        
        for (NSString *s in [parameters allKeys]) {
            if ([s isEqualToString:@"ignoreLogin"]) {
                igNoreLogin = true;
            }
        }
        
        if (!igNoreLogin &&([str isEqualToString:@"401"] || ![dict objectForKey:@"login"])) {
            [ZDUser loginShowLoginView];
            if (failure) {
                failure((NSError*)errorMessage);
            }
            return ;
        }
        if (isSuccess) {
        
            [[NSURLCache sharedURLCache]cachedResponseForRequest:[task currentRequest]];
            
            
            if (success) {
                success(dict,isSuccess,errorMessage);
            }
        }else{
            if (failure) {
                failure((NSError*)errorMessage);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (!CHECK_STR(error)) {
            NSLog(@"%@",error);
        }
        if (failure) {
            failure(error);
        }
    }];
}

#pragma mark -- POST请求 --
- (void)postWithURLString:(NSString *)URLString
               parameters:(id)parameters
                   isForm:(BOOL)form
                  success:(DDCompleteBlock)success
                  failure:(void (^)(NSError *))failure {
    
     AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
     manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer = form ? [AFHTTPRequestSerializer serializer] :
    [AFJSONRequestSerializer serializer];

    manager.requestSerializer.timeoutInterval =10;
    
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    
    NSMutableDictionary *headers = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies].mutableCopy;
 
    [manager.requestSerializer setValue:headers[@"Cookie"] forHTTPHeaderField:@"Cookie"];

    [manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *fields = ((NSHTTPURLResponse*)task.response).allHeaderFields;
        
        NSURL *url = [NSURL URLWithString:URLString];
        
        
        //获取cookie方法
        NSArray *cookies = [NSHTTPCookie cookiesWithResponseHeaderFields:fields forURL:url];
        
        for (NSHTTPCookie *cookie in cookies) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie]; // 保存
        }

        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        NSString *str = [NSString stringWithFormat:@"%@", [dict objectForKey:@"code"]];
        BOOL isSuccess=[str isEqualToString:@"200"]?YES:NO;
        
        BOOL igNoreLogin =false;
        
        for (NSString *s in [parameters allKeys]) {
            if ([s isEqualToString:@"ignoreLogin"]) {
                igNoreLogin = true;
            }
        }
        
        if (!igNoreLogin &&([str isEqualToString:@"401"] || ![dict objectForKey:@"login"])) {
            [ZDUser loginShowLoginView];
            return ;
        }
        NSString * errorMessage=[dict objectForKey:@"msg"];
        
        if (isSuccess) {
            if (success) {
                success(dict,isSuccess,errorMessage);
            }
        }else{
            if (failure) {
                failure((NSError*)errorMessage);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (!CHECK_STR(error)) {
            NSLog(@"%@",error);
        }
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark -- PUT网络请求 --
- (void)putWithURLStr:(NSString *)urlStr paramDic:(NSDictionary *)paramDic finish:(DDCompleteBlock)finish enError:(void(^)(NSError *error))enError{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/javascript",@"text/json",@"text/plain", nil];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
      manager.requestSerializer.timeoutInterval = 10;
    // 设置请求头
    manager.requestSerializer.HTTPMethodsEncodingParametersInURI = [NSSet setWithArray:@[@"POST", @"GET", @"PUT"]];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [manager PUT:urlStr parameters:paramDic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //请求成功的操作
        if (finish) {
            NSDictionary *dict = [NSJSONSerialization  JSONObjectWithData:responseObject options:0 error:NULL];
            NSString *str = [NSString stringWithFormat:@"%@", [dict objectForKey:@"code"]];
            BOOL isSuccess=[str isEqualToString:@"200"]?YES:NO;
            
            BOOL igNoreLogin =false;
            for (NSString *s in [paramDic allKeys]) {
                if ([s isEqualToString:@"ignoreLogin"]) {
                    igNoreLogin = true;
                }
            }
            if (!igNoreLogin &&([str isEqualToString:@"401"] || ![dict objectForKey:@"login"])) {
                [ZDUser loginShowLoginView];
                return ;
            }
            NSString * errorMessage=[dict objectForKey:@"msg"];
            if(dict){
                finish(dict,isSuccess,errorMessage);
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (enError) {
            enError(error);
        }
    }];
    
    
}
//字典转data
-(NSData *)returnDataWithDictionary:(NSDictionary *)dict
{
    NSMutableData * data = [[NSMutableData alloc] init];
    NSKeyedArchiver * archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:dict forKey:@"talkData"];
    [archiver finishEncoding];
    
    return data;
}




#pragma mark --- delete网络请求

- (void)deleteWithURLString:(NSString *)URLString
                 parameters:(id)parameters
                    success:(DDCompleteBlock)success
                    failure:(void (^)(NSError *error))failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/javascript",@"text/json",@"text/plain", nil];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 设置请求头
    manager.requestSerializer.HTTPMethodsEncodingParametersInURI = [NSSet setWithArray:@[@"POST", @"GET", @"PUT",@"DELETE"]];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager DELETE:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        NSString *str = [NSString stringWithFormat:@"%@", [dict objectForKey:@"code"]];
        BOOL isSuccess=[str isEqualToString:@"200"]?YES:NO;
        BOOL igNoreLogin =false;
        for (NSString *s in [parameters allKeys]) {
            if ([s isEqualToString:@"ignoreLogin"]) {
                igNoreLogin = true;
            }
        }
        if (!igNoreLogin &&([str isEqualToString:@"401"] || ![dict objectForKey:@"login"])) {
            [ZDUser loginShowLoginView];
            return ;
        }
        NSString * errorMessage=[dict objectForKey:@"msg"];
        if (success) {
            
            success(dict,isSuccess,errorMessage);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}




#pragma mark -- POST/GET网络请求 --
- (void)requestWithURLString:(NSString *)URLString
                  parameters:(id)parameters
                        type:(HttpRequestType)type
                     success:(void (^)(id))success
                     failure:(void (^)(NSError *))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer.timeoutInterval = 10;
    switch (type) {
        case HttpRequestTypeGet:
        {
            [manager GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
                if (success) {
                    success(dict);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
            }];
        }
            break;
        case HttpRequestTypePost:
        {
            [manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
                if (success) {
                    success(dict);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
            }];
        }
            break;
    }
}
- (void)uploadWithURLString:(NSString *)URLString parameters:(id)parameters uploadParam:(NSArray<UploadParam *> *)uploadParams success:(void (^)())success failure:(void (^)(NSError *))failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (UploadParam *uploadParam in uploadParams) {
            [formData appendPartWithFileData:uploadParam.data name:uploadParam.name fileName:uploadParam.filename mimeType:uploadParam.mimeType];
        }
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

#pragma mark - 下载数据
- (void)downLoadWithURLString:(NSString *)URLString parameters:(id)parameters progerss:(void (^)())progress success:(void (^)())success failure:(void (^)(NSError *))failure {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URLString]];
    NSURLSessionDownloadTask *downLoadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        if (progress) {
            progress();
        }
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        return targetPath;
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if (failure) {
            failure(error);
        }
    }];
    [downLoadTask resume];
}








@end
