//
//  AuthorsViewController.m
//  jamesApp2
//
//  Created by james kasinger on 7/5/16.
//  Copyright © 2016 kasingj. All rights reserved.
//

#import "AuthorsViewController.h"
#import "BooksViewController.h"

@interface AuthorsViewController ()

@property NSString *author;

@end

@implementation AuthorsViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    //title
    self.title = @"Authors";
    //load books
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Books" ofType:@"plist"];
    self.author = [NSArray arrayWithContentsOfFile:filePath];
    NSLog(@"authors > %@", self.author);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.authors count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell Identifier";
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Fetch Author
    NSDictionary *author = [self.authors objectAtIndex:[indexPath row]];
    
    // Configure Cell
    [cell.textLabel setText:[author objectForKey:@"Author"]];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // Fetch Author
    NSDictionary *author = [self.authors objectAtIndex:[indexPath row]];
    self.author =  [author objectForKey:@"Author"];
    
    // Perform Segue
    [self performSegueWithIdentifier:@"BooksViewController" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //storyboard knows to instantiate books view controller
    if ([segue.destinationViewController isKindOfClass:[BooksViewController class]]) {
        // Configure Books View Controller
        [(BooksViewController *)segue.destinationViewController setAuthor:self.author];
        
        // Reset Author
        [self setAuthor:nil];
    }
}

@end
