RiotKit
=======

RiotKit is an Objective-C wrapper around the Riot Games Developer API, currently exposing player and stat data from League of Legends. A part from being API complete, RiotKit is designed using NSOperations to allow asynchronous requests without blocking the main thread. All requests are converted into model objects, allowing for clean OOP.

***NOTE:*** RiotKit is still in its early stages and not recommended for production use. Many APIs are stubbed out as of now.

## Installation

RiotKit is available on CocoaPds. Just add this to your PodFile:

```ruby
pod 'RiotKit', '~> 0.0.1'
```

## Usage

After install, import the RiotKit header in your class interface:

```objective-c
#import <RiotKit/RiotKit.h>
```

RiotKit's APIs are designed to be an Objective-C take on the Riot API. You'll find many of the methods are simply more expressive versions of their REST API counterparts:

```objective-c
RiotKit *riot = [RiotKit alloc] initWithAPIKey:@"YOUR-API-KEY" region:RKRegionNorthAmerica];
[riot getSummonersWithNames:@[@"doublelift"] block:^(NSDictionary *objects, NSError *error) {
  RKSummoner *summoner = objects[@"doublelift"];
  NSLog(@"Summoner: %@", summoner);
}];
```

## TODO

RiotKit is still a work in progress and many endpoints are stubbed out during its early releases. This is the future roadmap:

- Summoners
- Games
- Leagues
- Stats
- Teams
- LOL Static Data

## License

RiotKit is released under the MIT License. See LICENSE file for details.

## Legal

RiotKit is not affiliated with Riot Games, Inc. League of Legends and Riot Games are trademarks, service marks, or registered trademarks of Riot Games, Inc.
