//
//  YBAppDelegate.m
//  LocalNotificationTutorial
//
//  Created by Yassine Benabbas on 21/02/13.
//  Copyright (c) 2013 yostane. All rights reserved.
//

#import "YBAppDelegate.h"

@implementation YBAppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //Création de la notification
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.alertAction = @"alert action";
    localNotification.alertBody = @"alert body: fired immedialty when app did finish launching";
    //Présenter la notification immédiatement, l'utilisateur n'est pas averti visuellement
    [application presentLocalNotificationNow:localNotification];
    [localNotification release];
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application{
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.alertAction = @"alert action";
    localNotification.alertBody = @"alert body: fired immediatly when app enters background";
    
    //On peut obtenir une référence vers l'objet application n'importe où dans le code avec [UIApplication sharedApplication]
    [[UIApplication sharedApplication] presentLocalNotificationNow:localNotification];
    [localNotification release];
}

- (void)applicationDidBecomeActive:(UIApplication *)application{
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.alertAction = @"alert action";
    localNotification.alertBody = @"alert body: fired 5 seconds after app did become active";
    NSDate *fireTime = [[NSDate date] addTimeInterval:5];
    localNotification.fireDate = fireTime;
    //Présenter la notification dans 5 secondes
    [application scheduleLocalNotification:localNotification];
    [localNotification release];
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    //L'application appelle cette fonction quand elle recoit une notification
    NSLog(@"notification recieved %@", notification);
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"local notification fired" message:notification.alertBody delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
    if (alertView) {
        [alertView release];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
}

@end
