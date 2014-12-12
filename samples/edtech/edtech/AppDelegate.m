//
//  AppDelegate.m
//  edtech
//
//  Created by ShinPleZ on 10/4/56 BE.
//  Copyright (c) 2556 ShinPleZ. All rights reserved.
//

#import "AppDelegate.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"

#import "FirstViewiPadController.h"
#import "SecondViewiPadController.h"
#import "ThirdViewiPadController.h"
#import "FourViewiPadController.h"
#import "FiveViewiPadController.h"

#import "SampleAppAboutViewController.h"

#import "QutionaryService.h"

#import <CoreData/CoreData.h>
#import "DataManagement.h"
#import "Questionary.h"

@implementation AppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    NSString *deviceType = [UIDevice currentDevice].model;
    NSLog(@"%@",deviceType);
    
    
    
    DataManagement *database = [DataManagement DatabaseManagement];
    database._context = [self managedObjectContext];
    
    
    
    QutionaryService *q = [[QutionaryService alloc] init];
    [q initial];
   
    Questionary *ques  = (Questionary*)[[[DataManagement DatabaseManagement] getQuestionary] lastObject];
    
    if([ques.flag isEqualToString:@"N"]){
        
        UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Questionnaire" message:@"Please complete the questionnaire. "
                                                    delegate:self
                                           cancelButtonTitle:@"Skip"
                                           otherButtonTitles:@"Ok", nil];
        
        al.delegate  =self;
        [al show];
    }
    
    if([deviceType isEqualToString:@"iPhone Simulator"] || [deviceType isEqualToString:@"iPhone"])
    {
        UIViewController *viewController1 = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
        UIViewController *viewController2 = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
        UIViewController *viewController3 = [[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:nil];
        //UIViewController *viewController4 = [[FourViewController alloc] initWithNibName:@"FourViewController" bundle:nil];
        UIViewController *viewController5 = [[FiveViewController alloc] initWithNibName:@"FiveViewController" bundle:nil];
        
        SampleAppAboutViewController *vc = [[SampleAppAboutViewController alloc] initWithNibName:@"SampleAppAboutViewController" bundle:nil];
        vc.appTitle = @"MUIC AR";
        vc.appAboutPageName = @"VP_about";
        vc.appViewControllerClassName = @"VideoPlaybackViewController";
    
        UINavigationController *navi1 = [[UINavigationController alloc] initWithRootViewController:viewController1];
        navi1.navigationBarHidden = YES;
    
        UINavigationController *navi2 = [[UINavigationController alloc] initWithRootViewController:viewController2];
        navi2.navigationBarHidden = YES;
    
        UINavigationController *navi3 = [[UINavigationController alloc] initWithRootViewController:viewController3];
        navi3.navigationBarHidden = YES;
    
        UINavigationController *navi4 = [[UINavigationController alloc] initWithRootViewController:vc];
        navi4.navigationBarHidden = YES;
    
        UINavigationController *navi5 = [[UINavigationController alloc] initWithRootViewController:viewController5];
        navi5.navigationBarHidden = YES;
    
        self.tabBarController = [[UITabBarController alloc] init];
        [self.tabBarController.tabBar setFrame:CGRectMake(0, self.window.frame.size.height - 50, self.window.frame.size.width, 60)];
        self.tabBarController.viewControllers = @[navi1, navi2, navi3, navi4, navi5];
        self.tabBarController.delegate = self;
        self.window.rootViewController = self.tabBarController;
    }
    else
    {
        UIViewController *viewControlleriPad1 = [[FirstViewiPadController alloc] initWithNibName:@"FirstViewiPadController" bundle:nil];
        UIViewController *viewControlleriPad2 = [[SecondViewiPadController alloc] initWithNibName:@"SecondViewiPadController" bundle:nil];
        UIViewController *viewControlleriPad3 = [[ThirdViewiPadController alloc] initWithNibName:@"ThirdViewiPadController" bundle:nil];
        //UIViewController *viewControlleriPad4 = [[FourViewiPadController alloc] initWithNibName:@"FourViewiPadController" bundle:nil];
        UIViewController *viewControlleriPad5 = [[FiveViewiPadController alloc] initWithNibName:@"FiveViewiPadController" bundle:nil];
        
        SampleAppAboutViewController *vc = [[SampleAppAboutViewController alloc] initWithNibName:@"SampleAppAboutViewController" bundle:nil];
        vc.appTitle = @"MUIC AR";
        vc.appAboutPageName = @"VP_about";
        vc.appViewControllerClassName = @"VideoPlaybackViewController";
        
        UINavigationController *navi1_iPad = [[UINavigationController alloc] initWithRootViewController:viewControlleriPad1];
        navi1_iPad.navigationBarHidden = YES;
        
        UINavigationController *navi2_iPad = [[UINavigationController alloc] initWithRootViewController:viewControlleriPad2];
        navi2_iPad.navigationBarHidden = YES;
        
        UINavigationController *navi3_iPad = [[UINavigationController alloc] initWithRootViewController:viewControlleriPad3];
        navi3_iPad.navigationBarHidden = YES;
        
        UINavigationController *navi4_iPad = [[UINavigationController alloc] initWithRootViewController:vc];
        navi4_iPad.navigationBarHidden = YES;
        
        UINavigationController *navi5_iPad = [[UINavigationController alloc] initWithRootViewController:viewControlleriPad5];
        navi5_iPad.navigationBarHidden = YES;
        
        self.tabBarController = [[UITabBarController alloc] init];
        [self.tabBarController.tabBar setFrame:CGRectMake(0, self.window.frame.size.height - 50, self.window.frame.size.width, 60)];
        self.tabBarController.viewControllers = @[navi1_iPad, navi2_iPad, navi3_iPad, navi4_iPad, navi5_iPad];
        self.window.rootViewController = self.tabBarController;
    }
    

    
    

    return YES;
}
    
    


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    Questionary *ques  = (Questionary*)[[[DataManagement DatabaseManagement] getQuestionary] lastObject];
    switch (buttonIndex) {
        case 0:
        {
            NSLog(@"PRESS SKIP");
            
            NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
            [dic setObject:@"N" forKey:@"flag"];
            [dic setObject:ques.url forKey:@"url"];
            [[DataManagement DatabaseManagement] saveQuestion:dic];
        }
            break;
        case 1:
        {
            NSLog(@"PRESS OK");
            NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
            [dic setObject:@"Y" forKey:@"flag"];
            [dic setObject:ques.url forKey:@"url"];
            [[DataManagement DatabaseManagement] saveQuestion:dic];
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:ques.url]];
            /*
            UIWebView *webView = [[UIWebView alloc] init];
            [webView setFrame:CGRectMake(0, 0, 320, 460)];
            [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:ques.url]]];
            [self.window addSubview:webView];
            [self.window makeKeyAndVisible];
             */
            
        }
            break;
        default:
            break;
    }
    
}



- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if ([viewController isKindOfClass:[UINavigationController class]])
    {
        [(UINavigationController *)viewController popToRootViewControllerAnimated:NO];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}
/*
- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}
*/
#pragma mark Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *) managedObjectContext {
	
    if (managedObjectContext != nil) {
        return managedObjectContext;
    }
	
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator: coordinator];
    }
    return managedObjectContext;
}


/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created by merging all of the models found in the application bundle.
 */
- (NSManagedObjectModel *)managedObjectModel {
	
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
    managedObjectModel = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];
    return managedObjectModel;
}


/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
	
    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }
	
    NSURL *storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory] stringByAppendingPathComponent: @"EdtechDB.sqlite"]];
	
	NSError *error = nil;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
		/*
		 Replace this implementation with code to handle the error appropriately.
		 
		 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
		 
		 Typical reasons for an error here include:
		 * The persistent store is not accessible
		 * The schema for the persistent store is incompatible with current managed object model
		 Check the error message to determine what the actual problem was.
		 */
		////NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
    }
	
    return persistentStoreCoordinator;
}

// Returns the URL to the application's Documents directory.
- (NSString *)applicationDocumentsDirectory {
	return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

@end
