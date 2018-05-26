user1 = User.create(name: "小野純平", num_protein: 100)
user2 = User.create(name: "沖本祐典", num_protein: 100)
user3 = User.create(name: "道券裕二", num_protein: 100)
user4 = User.create(name: "小島智樹", num_protein: 100)

Objective.create(title: "今週2回ジムに行きます！",
                 start: Date.today,
                 end: 1.week.since,
                 menu: "ランニング/10km",
                 done: false,
                 achievement: 10,
                 user: user1)

Objective.create(title: "腹筋がんばります",
                 start: "2018-05-21",
                 end: "2018-05-28",
                 menu: "腹筋/100回",
                 done: false,
                 achievement: 85,
                 user: user2)

Objective.create(title: "上腕二頭筋鍛えます",
                 start: "2018-05-24",
                 end: 1.week.since,
                 menu: "腕立て伏せ/200回",
                 done: false,
                 achievement: 30,
                 user: user3)

Objective.create(title: "ジャンプ力のために鍛えます",
                 start: "2018-05-26",
                 end: 1.week.since,
                 menu: "スクワット/50回",
                 done: false,
                 achievement: 60,
                 user: user4)
