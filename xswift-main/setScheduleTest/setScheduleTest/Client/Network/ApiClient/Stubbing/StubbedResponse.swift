//
//  StubbedResponse.swift
//  setScheduleTest
//
//  Created by Thomas Woodfin on 3/11/21.
//

import Foundation


// MARK: Search Movie
let itemsArrayForSearchMovieList = [
    [
        "adult": false,
        "backdrop_path": "/eBGKU0ZLJmxtVtzESTB1mfllX1J.jpg",
        "genre_ids": [
            80,
            28,
            53
        ],
        "id": 630004,
        "original_language": "en",
        "original_title": "The Vault",
        "overview": "When an engineer learns of a mysterious, impenetrable fortress hidden under The Bank of Spain, he joins a crew of master thieves who plan to steal the legendary lost treasure locked inside while the whole country is distracted by Spain's World Cup Final. With thousands of soccer fans cheering in the streets, and security forces closing in, the crew have just minutes to pull off the score of a lifetime.",
        "popularity": 1683.349,
        "poster_path": "/kWhXubAiIcHW0xn5GThflqaKZqh.jpg",
        "release_date": "2021-03-03",
        "title": "The Vault",
        "video": false,
        "vote_average": 7,
        "vote_count": 376
    ],
    [
        "adult": false,
        "backdrop_path": "/4O40vu2KOgnFfxvrZgzBG6havQ.jpg",
        "genre_ids": [
            28,
            80,
            53
        ],
        "id": 645788,
        "original_language": "en",
        "original_title": "The Protégé",
        "overview": "Rescued as a child by the legendary assassin Moody and trained in the family business, Anna is the world’s most skilled contract killer. When Moody, the man who was like a father to her and taught her everything she needs to know about trust and survival, is brutally killed, Anna vows revenge. As she becomes entangled with an enigmatic killer whose attraction to her goes way beyond cat and mouse, their confrontation turns deadly and the loose ends of a life spent killing will weave themselves ever tighter.",
        "popularity": 1473.813,
        "poster_path": "/o9FY8N5c8CXf22q8s4CmRRjAQJx.jpg",
        "release_date": "2021-08-19",
        "title": "The Protégé",
        "video": false,
        "vote_average": 6.8,
        "vote_count": 314
    ],
    [
        "adult": false,
        "backdrop_path": "/zsH3iW60T1t2HBTtrSKzzxJ406J.jpg",
        "genre_ids": [
            16,
            35,
            10751
        ],
        "id": 846214,
        "original_language": "en",
        "original_title": "The Simpsons: The Good, the Bart, and the Loki",
        "overview": "Loki is banished from Asgard once again and must face his toughest opponents yet: the Simpsons and Springfield’s mightiest heroes. The God of Mischief teams up with Bart Simpson in the ultimate crossover event paying tribute to the Marvel Cinematic Universe of superheroes and villains.",
        "popularity": 346.645,
        "poster_path": "/rtMdtzywcAGOrF6t8fbxJBqpdcq.jpg",
        "release_date": "2021-07-07",
        "title": "The Simpsons: The Good, the Bart, and the Loki",
        "video": false,
        "vote_average": 7.7,
        "vote_count": 426
    ],
    [
        "adult": false,
        "backdrop_path": "/cinER0ESG0eJ49kXlExM0MEWGxW.jpg",
        "genre_ids": [
            28,
            12,
            14
        ],
        "id": 566525,
        "original_language": "en",
        "original_title": "Shang-Chi and the Legend of the Ten Rings",
        "overview": "Shang-Chi must confront the past he thought he left behind when he is drawn into the web of the mysterious Ten Rings organization.",
        "popularity": 1158.567,
        "poster_path": "/1BIoJGKbXjdFDAqUEiA2VHqkK1Z.jpg",
        "release_date": "2021-09-01",
        "title": "Shang-Chi and the Legend of the Ten Rings",
        "video": false,
        "vote_average": 7.7,
        "vote_count": 1374
    ],
    [
        "adult": false,
        "backdrop_path": "/jlGmlFOcfo8n5tURmhC7YVd4Iyy.jpg",
        "genre_ids": [
            28,
            12,
            14
        ],
        "id": 436969,
        "original_language": "en",
        "original_title": "The Suicide Squad",
        "overview": "Supervillains Harley Quinn, Bloodsport, Peacemaker and a collection of nutty cons at Belle Reve prison join the super-secret, super-shady Task Force X as they are dropped off at the remote, enemy-infused island of Corto Maltese.",
        "popularity": 941.322,
        "poster_path": "/kb4s0ML0iVZlG6wAKbbs9NAm6X.jpg",
        "release_date": "2021-07-28",
        "title": "The Suicide Squad",
        "video": false,
        "vote_average": 7.8,
        "vote_count": 4608
    ],
    [
        "adult": false,
        "backdrop_path": "/kzIiKLccwuzD3qD5OHFyPIkiqEw.jpg",
        "genre_ids": [
            28,
            10749,
            16
        ],
        "id": 317442,
        "original_language": "ja",
        "original_title": "The Last: Naruto the Movie",
        "overview": "Two years after the events of the Fourth Great Ninja War, the moon that Hagoromo Otsutsuki created long ago to seal away the Gedo Statue begins to descend towards the world, threatening to become a meteor that would destroy everything on impact. Amidst this crisis, a direct descendant of Kaguya Otsutsuki named Toneri Otsutsuki attempts to kidnap Hinata Hyuga but ends up abducting her younger sister Hanabi. Naruto and his allies now mount a rescue mission before finding themselves embroiled in a final battle to decide the fate of everything.",
        "popularity": 248.817,
        "poster_path": "/bAQ8O5Uw6FedtlCbJTutenzPVKd.jpg",
        "release_date": "2014-12-06",
        "title": "The Last: Naruto the Movie",
        "video": false,
        "vote_average": 7.9,
        "vote_count": 1068
    ],
    [
        "adult": false,
        "backdrop_path": "/4ZGCd0jz0F4rguSPKuFHpc1xhvg.jpg",
        "genre_ids": [
            53,
            27
        ],
        "id": 638045,
        "original_language": "en",
        "original_title": "The Toll",
        "overview": "A socially awkward driver and a weary passenger try to make it to their destination while being haunted by a supernatural threat.",
        "popularity": 292.982,
        "poster_path": "/q6vV6sSWz9cytmc8L9IEBjjyFmV.jpg",
        "release_date": "2021-03-26",
        "title": "The Toll",
        "video": false,
        "vote_average": 6.2,
        "vote_count": 56
    ],
    [
        "adult": false,
        "backdrop_path": "/wfrfxivLOBtGMC98tIr2LSOeKSe.jpg",
        "genre_ids": [
            16,
            35,
            10751
        ],
        "id": 639721,
        "original_language": "en",
        "original_title": "The Addams Family 2",
        "overview": "The Addams get tangled up in more wacky adventures and find themselves involved in hilarious run-ins with all sorts of unsuspecting characters.",
        "popularity": 1618.449,
        "poster_path": "/ld7YB9vBRp1GM1DT3KmFWSmtBPB.jpg",
        "release_date": "2021-10-01",
        "title": "The Addams Family 2",
        "video": false,
        "vote_average": 7.5,
        "vote_count": 495
    ],
    [
        "adult": false,
        "backdrop_path": "/5Zv5KmgZzdIvXz2KC3n0MyecSNL.jpg",
        "genre_ids": [
            28,
            53,
            80
        ],
        "id": 634528,
        "original_language": "en",
        "original_title": "The Marksman",
        "overview": "Jim Hanson’s quiet life is suddenly disturbed by two people crossing the US/Mexico border – a woman and her young son – desperate to flee a Mexican cartel. After a shootout leaves the mother dead, Jim becomes the boy’s reluctant defender. He embraces his role as Miguel’s protector and will stop at nothing to get him to safety, as they go on the run from the relentless assassins.",
        "popularity": 323.772,
        "poster_path": "/6vcDalR50RWa309vBH1NLmG2rjQ.jpg",
        "release_date": "2021-01-15",
        "title": "The Marksman",
        "video": false,
        "vote_average": 7.2,
        "vote_count": 937
    ],
    [
        "adult": false,
        "backdrop_path": "/jw6ASGRT2gi8EjCImpGtbiJ9NQ9.jpg",
        "genre_ids": [
            27
        ],
        "id": 632357,
        "original_language": "en",
        "original_title": "The Unholy",
        "overview": "Alice, a young hearing-impaired girl who, after a supposed visitation from the Virgin Mary, is inexplicably able to hear, speak and heal the sick. As word spreads and people from near and far flock to witness her miracles, a disgraced journalist hoping to revive his career visits the small New England town to investigate. When terrifying events begin to happen all around, he starts to question if these phenomena are the works of the Virgin Mary or something much more sinister.",
        "popularity": 383.72,
        "poster_path": "/bShgiEQoPnWdw4LBrYT5u18JF34.jpg",
        "release_date": "2021-03-31",
        "title": "The Unholy",
        "video": false,
        "vote_average": 6.9,
        "vote_count": 1403
    ]
    
] as [[String: Any]]

let responseForSearchMovieList = [
    "page": 1,
    "results": itemsArrayForSearchMovieList,
    "total_pages": 500,
    "total_results": 10000
] as [String : Any]




// MARK: Moview Details
let responseForMovieDetails = [
    "adult": false,
    "backdrop_path": "/eBGKU0ZLJmxtVtzESTB1mfllX1J.jpg",
    "genre_ids": [
        80,
        28,
        53
    ],
    "id": 630004,
    "original_language": "en",
    "original_title": "The Vault",
    "overview": "When an engineer learns of a mysterious, impenetrable fortress hidden under The Bank of Spain, he joins a crew of master thieves who plan to steal the legendary lost treasure locked inside while the whole country is distracted by Spain's World Cup Final. With thousands of soccer fans cheering in the streets, and security forces closing in, the crew have just minutes to pull off the score of a lifetime.",
    "popularity": 1683.349,
    "poster_path": "/kWhXubAiIcHW0xn5GThflqaKZqh.jpg",
    "release_date": "2021-03-03",
    "title": "The Vault",
    "video": false,
    "vote_average": 7,
    "vote_count": 376
] as [String : Any] 
