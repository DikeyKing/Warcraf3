//
//  WAR3NEUnit.m
//  Warcraft3
//
//  Created by Dikey on 4/25/14.
//  Copyright (c) 2014 Dikey. All rights reserved.
//

#import "WAR3NEUnit.h"

@implementation WAR3NEUnit

-(instancetype)init
{
    if (self = [super init]) {
        [self getDeserializedArray];
        self.deserializedArray=_deserializedArray;
    }
    return  self;
}

- (NSArray *)getDeserializedArray
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"WAR3NEUnit" ofType:@"json" ];
    NSData *jsonData = [[NSData alloc]initWithContentsOfFile:path];
    
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization
                     JSONObjectWithData:jsonData
                     options:NSJSONReadingMutableContainers
                     error:&error];
    
    if (jsonObject != nil && error == nil){
        NSLog(@"Successfully deserialized...");
        if ([jsonObject isKindOfClass:[NSDictionary class]]){
            NSDictionary *deserializedDictionary = jsonObject;
            NSLog(@"Deserialized JSON Dictionary = %@",
                  deserializedDictionary);
        }
        else if ([jsonObject isKindOfClass:[NSArray class]]){
            _deserializedArray = (NSArray *)jsonObject;
            NSLog(@"NSArray will be displayed");
        }
        else {
            /* Some other object was returned. We don't know how to
             deal with this situation as the deserializer only
             returns dictionaries or arrays */
        }
    }
    else if (error != nil){
        NSLog(@"An error happened while deserializing the JSON data.");
    };
    
    return _deserializedArray;
}


@end
