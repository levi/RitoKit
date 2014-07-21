RiotKit
=======

RiotKit is an Objective-C wrapper around the Riot Games Developer API, currently exposing player and stat data from League of Legends. Apart from its aim for API parity, RiotKit keeps developer happiness in mind. All requests are kept off the main thread and conducted through NSOperations and JSON reponses are transformed into pure Objective-C object. All you have to worry about is what you want to do with all the awesome data.

***NOTE:*** RiotKit is still in its early stages and not recommended for production use. Many APIs are stubbed out as of now.

## Installation

RiotKit is available on CocoaPods. Just add this to your PodFile:

```ruby
pod 'RiotKit', '~> 0.0.2'
```

## Usage

After install, import the RiotKit header in your class interface:

```objective-c
#import <RiotKit/RiotKit.h>
```

RiotKit's APIs are designed to be an Objective-C take on the Riot API. You'll find many of the methods are simply expressive versions of their REST API counterparts:

```objective-c
RiotKit *riot = [[RiotKit alloc] initWithAPIKey:@"YOUR-API-KEY" region:RKRegionNorthAmerica];
[riot getSummonersWithNames:@[@"doublelift"] block:^(NSDictionary *objects, NSError *error) {
  RKSummoner *summoner = objects[@"doublelift"];
  NSLog(@"Summoner: %@", summoner);
}];
```

## TODO

RiotKit is still a work in progress and many endpoints are stubbed out during this early release. The future roadmap consists of:

- Games
- Leagues
- Stats
- Teams
- LOL Static Data

## License

RiotKit is released under the MIT License. See LICENSE file for details.

## Legal

RiotKit is not affiliated, associated, authorized, endorsed by, or in any way officially connected with Riot Games, Inc., Riot Games International, Inc., or any of its subsidiaries or its affiliates. The official Riot developer API can be accessed at https://developer.riotgames.com. Riot Games and League of Legends are trademarks, service marks, or registered trademarks of Riot Games, Inc.
