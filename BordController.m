//
//  BordController.m
//  MobileStudent
//
//  Created by Olga on 25.06.14.
//  Copyright (c) 2014 Olga. All rights reserved.
//

#import "BordController.h"
#import "BordCell.h"
#import "Bord.h"

@interface BordController ()
{
    NSMutableData *bordData;
    NSString * currentElement;
    NSMutableString *currentTime;
    NSMutableString *bordName;
    NSMutableString *bordRoom;
    NSMutableString *bordBuilding;
    NSMutableString *bordTeacher;
    NSMutableString *bordType;
    NSMutableString *day;
    NSMutableArray *days;
   
    NSArray *sections;
    Bord *bord;
   
}

@end

@implementation BordController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    sections = @[@"Monday",@"Tuesday"];
    
    bord = [Bord sharedInstance];
     NSURL *url = [NSURL URLWithString:@"http://shelly.kpfu.ru/e-ksu/get_schedulle_aud?p_group_name=01-110"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url
                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                          timeoutInterval:60.0];
    NSURLConnection *conn =[[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (conn){
        
        bordData = [[NSMutableData alloc] init];
        
    }
    else{
        NSLog(@"ERROR");
    }
    
}



- (void)connection:(NSURLConnection *)connection didReceiveData:(NSMutableData *)data {
    [bordData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
   NSString *result = [[NSString alloc] initWithData:bordData encoding:NSWindowsCP1251StringEncoding];
    bordData = [result dataUsingEncoding:NSUTF8StringEncoding];
   // NSLog(@"Data = %@",result);
    
//    bord.news = [[NSMutableArray alloc]init];
    NSXMLParser *rssParser = [[NSXMLParser alloc] initWithData:bordData];
    
    rssParser.delegate = self;
    [rssParser parse];
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Error = %@", error);
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict  {
    
   
    currentElement = elementName;
    // NSLog(@"I use delegate. Current element: %@",elementName);
   if ([elementName isEqualToString:@"classes-list"]){
       day = [[NSMutableString alloc]init];
       days = [[NSMutableArray alloc ]init];
       NSLog(@"THERE IS NO ERROR1");
    }
   if ([elementName isEqualToString:@"class"]) {
       day = [[NSMutableString alloc]init];
        currentTime = [[NSMutableString alloc]init];
       bordName = [[NSMutableString alloc]init];
       bordRoom = [[NSMutableString alloc]init];
        bordBuilding = [[NSMutableString alloc]init];
        bordTeacher = [[NSMutableString alloc]init];
        bordType = [[NSMutableString alloc]init];
        return;
    }
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
   // NSLog(@"CURRENT ELEMENT OF FOUNDCHARACTERS IS: %@",currentElement);
    if ([currentElement isEqualToString:@"day"]){
       //  NSLog(@"THERE IS NO ERROR1");
        [day appendString:string];
      [days addObject:day];
    }
    if ([currentElement isEqualToString:@"time"]) {
		[currentTime appendString:string];
       // NSLog(@"%@",currentTime);
	}
    if ([currentElement isEqualToString:@"name"]) {
		[bordName appendString:string];
        // NSLog(@"%@",bordName);
    }
    if ([currentElement isEqualToString:@"room"]) {
		[bordRoom appendString:string];
       //  NSLog(@"%@",bordRoom);
    }
    if ([currentElement isEqualToString:@"building"]) {
		[bordBuilding appendString:string];
       //  NSLog(@"%@",bordBuilding);
    }
    if ([currentElement isEqualToString:@"teacher"]) {
		[bordTeacher appendString:string];
       // NSLog(@"%@",bordTeacher);
    }
    if ([currentElement isEqualToString:@"type"]) {
		[bordType appendString:string];
       //  NSLog(@"%@",bordType);
    }
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"class"]) {
        NSDictionary *newsItem = [NSDictionary dictionaryWithObjectsAndKeys:
                                  currentTime, @"time",
                                  bordName, @"name",
                                  bordRoom,@"room",
                                  bordBuilding,@"building",
                                  bordTeacher,@"teacher",
                                  bordType,@"type",
                                  day,@"day",
                                  nil];
         NSMutableArray *daysItem = [[NSMutableArray alloc]init];
      if ([elementName isEqualToString:@"class"]){
         
          [daysItem addObjectsFromArray:days];
           // NSLog(@"%@",day);
          
       }
      
        [bord.news addObject:newsItem];
        NSLog(@"%@",daysItem);
       // NSLog(@"NEWS%@",bord.news);
        currentTime = nil;
        bordName = nil;
        bordRoom = nil;
         bordBuilding = nil;
         bordTeacher = nil;
         bordType = nil;
        
        
        currentElement = nil;
        return;
    }
}


- (void)parserDidEndDocument:(NSXMLParser *)parser {
   // [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [self.tableView reloadData];
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"%@", parseError);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
   
    return 2;
}

//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return [monthTitle objectAtIndex:section];
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   // NSLog(@"%d",bord.news.count);
    return [bord.news count];
   
    

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BordCell";
    
    BordCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    //Task *task = [taskManager.tasks objectAtIndex:indexPath.row];
    if (cell == nil) {
        cell = [[BordCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                               reuseIdentifier:CellIdentifier];
    }
    // cell.task = task;
    NSDictionary *newsItem = [bord.news objectAtIndex:indexPath.row];
    cell.nameLabel.text = [newsItem objectForKey:@"name"];
    cell.timeLabel.text = [newsItem objectForKey:@"time"];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  
    
  

}



@end
