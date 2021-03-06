//
//  HZYDemoReformer.m
//  MISNetworkingDev
//
//  Created by haozhenyi on 2018/4/24.
//  Copyright © 2018年 com.58.MIS-Foundation. All rights reserved.
//

#import "HZYDemoReformer.h"

@interface HZYDemoReformer ()
@property (nonatomic, assign) Class modelClass;

@end
@implementation HZYDemoReformer
+ (instancetype)reformerWithClass:(Class)modelClass {
    HZYDemoReformer *refomer = [[self alloc] init];
    refomer.modelClass = modelClass;
    return refomer;
}

- (id)request:(HZYNetworkRequest *)request reformResponseObject:(id)responseObject error:(NSError * _Nullable __autoreleasing * _Nullable)error {
    if (*error) return responseObject;
    if ([self.modelClass isSubclassOfClass:JSONModel.class]) {
        id jsonModel = [[self.modelClass alloc] initWithDictionary:responseObject error:error];
        if (!*error) {
            return jsonModel;
        }
    }
    return responseObject;
}

@end

@implementation HZYDemoModel
@end
