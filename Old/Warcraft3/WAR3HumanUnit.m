//
//  HumanUnitModel.m
//  expandList
//
//  Created by Dikey on 3/27/14.
//
//

#import "WAR3HumanUnit.h"

@implementation WAR3HumanUnit

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
    NSString *path = [[NSBundle mainBundle]pathForResource:@"WAR3HumanUnit" ofType:@"json" ];
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
