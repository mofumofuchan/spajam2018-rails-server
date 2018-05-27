user1 = User.create(id: 1, name: "小野純平", num_protein: 100)
user2 = User.create(id: 2, name: "小島智樹", num_protein: 0)
user3 = User.create(id: 3, name: "道券裕二", num_protein: 100)
user4 = User.create(id: 4, name: "沖本祐典", num_protein: 100)
User.create(id: 5, name: "anonymous", num_protein: 100)

Objective.create(title: "今週2回ジムに行く！",
                 start: Date.today,
                 end: 1.week.since,
                 menu: "ランニング-10km",
                 done: false,
                 achievement: 10,
                 user: user1)

Objective.create(title: "腹筋がんばります",
                 start: "2018-05-21",
                 end: "2018-05-28",
                 menu: "腹筋-100回",
                 done: false,
                 achievement: 10,
                 user: user2)

Objective.create(title: "上腕二頭筋鍛えます",
                 start: "2018-05-24",
                 end: 1.week.since,
                 menu: "腕立て伏せ-200回",
                 done: false,
                 achievement: 30,
                 user: user3)

Objective.create(title: "ジャンプ力の向上",
                 start: "2018-05-26",
                 end: 1.week.since,
                 menu: "スクワット-50回",
                 done: false,
                 achievement: 60,
                 user: user4)
