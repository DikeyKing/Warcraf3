//
//  HumanHero.m
//  expandList
//
//  Created by Dikey on 3/30/14.
//
//

#import "WAR3HumanHero.h"

@implementation WAR3HumanHero

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
    NSString *path = [[NSBundle mainBundle]pathForResource:@"WAR3HumanHero" ofType:@"json" ];
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
