//
//  ViewController.m
//  TestNSXMLParser
//
//  Created by Rock Su on 13/5/23.
//  Copyright (c) 2013年 Rock Su. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    
    NSXMLParser *xmlParser;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *xmlString = @"<?xml version=\"1.0\" encoding=\"UTF-8\"?><永遠的偶像><名字 name=\"梁朝偉\"><音樂>為情所困</音樂><movie>俠骨仁心</movie></名字><名字 name=\"劉德華\"><音樂>來生緣</音樂><movie>孤男寡女</movie></名字></永遠的偶像></xml>";
    
    NSData *data = [xmlString dataUsingEncoding:NSUTF8StringEncoding];
    xmlParser = [[NSXMLParser alloc] initWithData:data];
    [xmlParser setDelegate:self];
    [xmlParser parse];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - NSXMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"didStartElement");
    NSLog(@"elementName %@", elementName);
    for(id key in attributeDict)
    {
        NSLog(@"attribute %@", [attributeDict objectForKey:key]);
    }
}

//2. 找到XML tag所包含的內容
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"foundCharacters %@", string);
}

//3. 於遇到XML tag結尾時被呼叫
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"didEndElement");
    NSLog(@"elementName %@", elementName);
}

@end
