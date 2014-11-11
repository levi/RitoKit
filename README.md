RitoKit
=======

RitoKit is an Objective-C wrapper around the Riot Games Developer API, currently exposing player and stat data from League of Legends. Apart from its aim for API parity, RitoKit keeps developer happiness in mind. All requests are kept off the main thread and conducted through NSOperations and JSON reponses are transformed into pure Objective-C objects. All you have to worry about is what you want to do with all the awesome data.

## Installation

RitoKit is available on CocoaPods. Just add this to your PodFile:

```ruby
pod 'RitoKit', '~> 0.0.3'
```

## Usage

After install, import the RitoKit header in your class interface:

```objective-c
#import <RitoKit/RitoKit.h>
```

RiotKit's APIs are designed to be an Objective-C take on the Riot API. You'll find many of the methods are simply expressive versions of their REST API counterparts:

```objective-c
RitoKit *riot = [[RitoKit alloc] initWithAPIKey:@"YOUR-API-KEY" region:RKRegionNorthAmerica];
[riot getSummonersWithNames:@[@"doublelift"] block:^(NSDictionary *objects, NSError *error) {
  RKSummoner *summoner = objects[@"doublelift"];
  NSLog(@"Summoner: %@", summoner);
}];
```

Swift:
```swift
let riot = RitoKit(APIKey: "YOUR-API-KEY", region: .NorthAmerica)
riot.getSummonersWithNames(["doublelift"]) {
    objects, error in
    let summoner = objects["doublelift"]
    println("Summoner: \(summoner)")
}
```

## TODO

RitoKit is still a work in progress and many endpoints are stubbed out during this early release. The future roadmap consists of:

- Leagues
- Stats
- Teams
- Status
- Match
- LOL Static Data

## License

RitoKit is released under the MIT License. See LICENSE file for details.

## Legal

RitoKit is not affiliated, associated, authorized, endorsed by, or in any way officially connected with Riot Games, Inc., Riot Games International, Inc., or any of its subsidiaries or its affiliates. The official Riot developer API can be accessed at https://developer.riotgames.com. Riot Games and League of Legends are trademarks, service marks, or registered trademarks of Riot Games, Inc.
