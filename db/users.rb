MTestType.create!([
  {testName: "さんすう", testEnNm: "10multi", parentTypeId: nil, testUrl: "/result_historys/generateTest", testImage: "10multiplicati.png", testDesc: nil, testSize: 10, created_id: "ben", updated_id: "ben"},
  {testName: "こくごう", testEnNm: "10multi", parentTypeId: nil, testUrl: "/result_historys/generateTest", testImage: "10multiplicati.png", testDesc: nil, testSize: 10, created_id: "ben", updated_id: "ben"},
  {testName: "えいご", testEnNm: "10multi", parentTypeId: nil, testUrl: "/result_historys/generateTest", testImage: "10multiplicati.png", testDesc: nil, testSize: 10, created_id: "ben", updated_id: "ben"},
  {testName: "9*9 かけざん", testEnNm: "10multi", parentTypeId: 1, testUrl: "/result_historys/generateTest", testImage: "10multiplicati.png", testDesc: nil, testSize: 10, created_id: "ben", updated_id: "ben"},
  {testName: "10までひきざん", testEnNm: "10add", parentTypeId: 1, testUrl: "/result_historys/generateTest", testImage: "10add.png", testDesc: nil, testSize: 20, created_id: "ben", updated_id: "ben"},
  {testName: "10までげんざん", testEnNm: "10sub", parentTypeId: 1, testUrl: "/result_historys/generateTest", testImage: "10subtract.png", testDesc: nil, testSize: 20, created_id: "ben", updated_id: "ben"},
  {testName: "ひきざん２", testEnNm: "10sub", parentTypeId: 1, testUrl: "/result_historys/generateTest", testImage: "add2.png", testDesc: nil, testSize: 20, created_id: "ben", updated_id: "ben"},
  {testName: "ひきざん３", testEnNm: "10sub", parentTypeId: 1, testUrl: "/result_historys/generateTest", testImage: "add3.png", testDesc: nil, testSize: 5, created_id: "ben", updated_id: "ben"},
  {testName: "げんざん２", testEnNm: "10sub", parentTypeId: 1, testUrl: "/result_historys/generateTest", testImage: "sub2.png", testDesc: nil, testSize: 20, created_id: "ben", updated_id: "ben"},
  {testName: "げんざん３", testEnNm: "10sub", parentTypeId: 1, testUrl: "/result_historys/generateTest", testImage: "sub3.png", testDesc: nil, testSize: 5, created_id: "ben", updated_id: "ben"}
])
TestRule.create!([
  {ruleUserId: 1, mTestTypeId: 4, testCount: 3, maxScore: 100, maxPoint: 5, minScore: 80, minPoint: 1, midScore: 90, midPoint: 3},
  {ruleUserId: 1, mTestTypeId: 5, testCount: 1, maxScore: 100, maxPoint: 5, minScore: 90, minPoint: 1, midScore: 95, midPoint: 3},
  {ruleUserId: 1, mTestTypeId: 6, testCount: 3, maxScore: 100, maxPoint: 5, minScore: 90, minPoint: 1, midScore: 95, midPoint: 3},
  {ruleUserId: 1, mTestTypeId: 7, testCount: 3, maxScore: 100, maxPoint: 5, minScore: 90, minPoint: 1, midScore: 95, midPoint: 3},
  {ruleUserId: 1, mTestTypeId: 8, testCount: 3, maxScore: 100, maxPoint: 5, minScore: 80, minPoint: 1, midScore: 90, midPoint: 3},
  {ruleUserId: 1, mTestTypeId: 9, testCount: 3, maxScore: 100, maxPoint: 5, minScore: 90, minPoint: 1, midScore: 95, midPoint: 3},
  {ruleUserId: 1, mTestTypeId: 10, testCount: 3, maxScore: 100, maxPoint: 5, minScore: 80, minPoint: 1, midScore: 90, midPoint: 3},
  {ruleUserId: 2, mTestTypeId: 4, testCount: 3, maxScore: 100, maxPoint: 5, minScore: 80, minPoint: 1, midScore: 90, midPoint: 3},
  {ruleUserId: 2, mTestTypeId: 5, testCount: 1, maxScore: 100, maxPoint: 5, minScore: 90, minPoint: 1, midScore: 95, midPoint: 3},
  {ruleUserId: 2, mTestTypeId: 6, testCount: 3, maxScore: 100, maxPoint: 5, minScore: 90, minPoint: 1, midScore: 95, midPoint: 3},
  {ruleUserId: 2, mTestTypeId: 7, testCount: 3, maxScore: 100, maxPoint: 5, minScore: 90, minPoint: 1, midScore: 95, midPoint: 3},
  {ruleUserId: 2, mTestTypeId: 8, testCount: 3, maxScore: 100, maxPoint: 5, minScore: 80, minPoint: 1, midScore: 90, midPoint: 3},
  {ruleUserId: 2, mTestTypeId: 9, testCount: 3, maxScore: 100, maxPoint: 5, minScore: 90, minPoint: 1, midScore: 95, midPoint: 3},
  {ruleUserId: 2, mTestTypeId: 10, testCount: 3, maxScore: 100, maxPoint: 5, minScore: 80, minPoint: 1, midScore: 90, midPoint: 3}
])
Toy.create!([
  {toyName: "aa", toyUrl: "XXXXおもちゃん", toyPoint: 3000, toyImage: "10multiplicati.png", testDesc: "aa", created_id: "ben", updated_id: "ben"}
])
User.create!([
  {loginNm: "kaori", kataNm: "カオリ", kanjiNm: "馨ちゃん", age: 8, email: nil, point: 100, voiceGood: nil, voiceBad: nil, voicePerfect: nil, created_id: "ben", updated_id: "ben"},
  {loginNm: "wataru", kataNm: "わたる", kanjiNm: "航くん", age: 4, email: nil, point: 100, voiceGood: nil, voiceBad: nil, voicePerfect: nil, created_id: "ben", updated_id: "ben"}
])
