//
//  OMOpenStruct.h
//  ObjectiveMeta
//
//  Created by Endika Gutiérrez Salas on 2/16/14.
//  Copyright (c) 2014 Endika Gutiérrez Salas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OMOpenStruct : NSObject

- (id)initWithValuesForKeys:(NSDictionary *)dict;

- (void)setObject:(id)obj forKeyedSubscript:(NSString *)key;
- (id)objectForKeyedSubscript:(NSString *)key;

@end
