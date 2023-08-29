//
//  Providers.swift
//  TMDbMyApp
//
//  Created by Ruben Alonso on 22/8/23.
//

import Foundation

/*
 {
   "id": 298618,
   "results": {
 "ES": {
   "link": "https://www.themoviedb.org/movie/298618-the-flash/watch?locale=ES",
   "flatrate": [
     {
       "logo_path": "/Ajqyt5aNxNGjmF9uOfxArGrdf3X.jpg",
       "provider_id": 384,
       "provider_name": "HBO Max",
       "display_priority": 9
     }
   ],
   "buy": [
     {
       "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
       "provider_id": 2,
       "provider_name": "Apple TV",
       "display_priority": 4
     },
     {
       "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
       "provider_id": 3,
       "provider_name": "Google Play Movies",
       "display_priority": 13
     },
     {
       "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
       "provider_id": 68,
       "provider_name": "Microsoft Store",
       "display_priority": 14
     },
     {
       "logo_path": "/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg",
       "provider_id": 10,
       "provider_name": "Amazon Video",
       "display_priority": 35
     }
   ],
   "rent": [
     {
       "logo_path": "/peURlLlr8jggOwK53fJ5wdQl05y.jpg",
       "provider_id": 2,
       "provider_name": "Apple TV",
       "display_priority": 4
     },
     {
       "logo_path": "/tbEdFQDwx5LEVr8WpSeXQSIirVq.jpg",
       "provider_id": 3,
       "provider_name": "Google Play Movies",
       "display_priority": 13
     },
     {
       "logo_path": "/shq88b09gTBYC4hA7K7MUL8Q4zP.jpg",
       "provider_id": 68,
       "provider_name": "Microsoft Store",
       "display_priority": 14
     },
     {
       "logo_path": "/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg",
       "provider_id": 10,
       "provider_name": "Amazon Video",
       "display_priority": 35
     }
   ]
 }
}
}
*/


struct WatchProvidersResponse: Codable {
  let id: Int
  let results: [String: WatchProvider]
}

struct WatchProvider: Codable {
  let link: String
  let flatrate: [WatchProviderItem]?
  let rent: [WatchProviderItem]?
  let buy: [WatchProviderItem]?
}

struct WatchProviderItem: Codable, Identifiable {
  let logoPath: String
  let id: Int
  let providerName: String
}
