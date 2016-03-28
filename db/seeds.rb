demoUser1 = User.where(email: "demo1@domain.com").first_or_create
demoUser1.password = "12345678"
demoUser1.username = "demoUser1"
demoUser1.save

demoUser2 = User.where(email: "demo2@domain.com").first_or_create
demoUser2.password = "12345678"
demoUser2.username = "demoUser2"
demoUser2.save

if demoUser1.posts.empty?
  demoUser1.posts.create title: "Dystopian Virtual Reality Is Finally Here!",
    content: "Today Oculus VR, the virtual-reality hardware company Facebook acquired for $2 billion in 2014, releases its flagship headset, the Oculus Rift.",
    views: "97",
    votes: "5"
end

if demoUser2.posts.empty?
  demoUser2.posts.create title: "Will Amazon Let Developers Monetize the Echo?",
  content: "Big Ass Fans, the maker of a premium home ceiling fan, has a new way for users to control their connected fans. Just ask Alexa.",
  views: "33",
  votes: "20"
end
