//
//  WAR3UndeadArchitect.m
//  Warcraft3
//
//  Created by Dikey on 5/6/14.
//  Copyright (c) 2014 Dikey. All rights reserved.
//

#import "WAR3UndeadArchitect.h"

@implementation WAR3UndeadArchitect

-(instancetype)init
{
    if (self = [super init]) {
        [self getDeserializedArray];
        self.deserializedArray = _deserializedArray;
    }
    return self;
}

- (NSArray *)getDeserializedArray
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"WAR3UndeadArchitect" ofType:@"json" ];
    NSData *jsonData = [[NSData alloc]initWithContentsOfFile:path];
    
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization
                     JSONObjectWithData:jsonData
                     options:NSJSONReadingMutableContainers
                     error:&error];
    
    if ([jsonObject isKindOfClass:[NSDictionary class]]){
        NSDictionary *deserializedDictionary = jsonObject;
        NSLog(@"Deserialized JSON Dictionary = %@",
              deserializedDictionary);
    }
    else if ([jsonObject isKindOfClass:[NSArray class]]){
        _deserializedArray = (NSArray *)jsonObject;
        //   NSLog(@"NSArray will be displayed");
    }
    
    
    
    return _deserializedArray;
}


@end
