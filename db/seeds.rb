user1 = User.create(name: "小野純平", num_protein: 100)
user2 = User.create(name: "沖本祐典", num_protein: 100)
user3 = User.create(name: "道券裕二", num_protein: 100)
user4 = User.create(name: "小島智樹", num_protein: 100)

Objective.create(title: "今週2回ジムに行きます！",
                 start: Date.today,
                 end: 1.week.since,
                 menu: "ランニング/10km",
                 done: false,
                 user: user1)
