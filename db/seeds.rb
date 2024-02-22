# メインのサンプルユーザーを1人作成する
User.create!(name:  "Hibari",
    email: "hibari@railstutorial.org",
    password:              "1010yoko",
    password_confirmation: "1010yoko",
    admin: true,
    activated: true,
    activated_at: Time.zone.now)

# サンプルユーザー
User.create!(name:  "Makiko",
    email: "makiko@railstutorial.org",
    password:              "1010maki",
    password_confirmation: "1010maki",
    activated: true,
    activated_at: Time.zone.now)

# サンプルユーザー
User.create!(name:  "Hitoshi",
    email: "hitoshi@railstutorial.org",
    password:              "1010hito",
    password_confirmation: "1010hito",
    activated: true,
    activated_at: Time.zone.now)