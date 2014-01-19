turnips = Crop.create(
            name: 'turnips',
            description: 'Turnips are lovely'
          )

carrots = Crop.create(
            name: 'carrots',
            description: 'OMG CARROTS'
          )

old_pod = Pod.create(
            month: 1.month.ago.beginning_of_month,
            published: true
          )

pod     = Pod.create(
            month: Date.today.beginning_of_month,
            published: true
          )

Instruction.create(
  crop: turnips,
  pod: old_pod,
  ship: true,
  summary: "It's time to plant the turnips",
  image_url: "http://f.cl.ly/items/3224202o082m2y211n3c/turnip-history1.jpg",
  detail: 'Bacon ipsum dolor sit amet nisi broccoli in voluptate broccoli broccoli irure broccoli broccoli broccoli dolor broccoli qui.'
)

Instruction.create(
  crop: carrots,
  pod: pod,
  ship: true,
  summary: "It's time to plant the carrots, finally!",
  detail: 'Bacon ipsum dolor sit amet nisi broccoli in voluptate broccoli broccoli irure broccoli broccoli broccoli dolor broccoli qui. Broccoli broccoli broccoli laboris ex elit pariatur broccoli broccoli broccoli adipisicing broccoli deserunt exercitation broccoli. Fugiat nostrud in aute anim consequat broccoli nisi eiusmod duis broccoli ut. Est broccoli broccoli broccoli esse, duis broccoli laborum broccoli cupidatat sunt officia. Broccoli broccoli anim elit aliquip, ex broccoli. Esse ut incididunt irure ut broccoli magna. Mollit non excepteur ullamco broccoli. Ut broccoli broccoli, broccoli tempor laborum broccoli. Broccoli adipisicing aute ea broccoli ut. Broccoli irure ex, culpa mollit broccoli reprehenderit elit broccoli veniam broccoli ut dolore pariatur proident. Ut laborum qui in sunt.'
)

Instruction.create(
  crop: turnips,
  pod: pod,
  summary: "Harvesting time for turnips",
  detail: 'Bacon ipsum dolor sit amet nisi broccoli in voluptate broccoli broccoli irure broccoli broccoli broccoli dolor broccoli qui. Broccoli broccoli broccoli laboris ex elit pariatur broccoli broccoli broccoli adipisicing broccoli deserunt exercitation broccoli. Fugiat nostrud in aute anim consequat broccoli nisi eiusmod duis broccoli ut. Est broccoli broccoli broccoli esse, duis broccoli laborum broccoli cupidatat sunt officia. Broccoli broccoli anim elit aliquip, ex broccoli. Esse ut incididunt irure ut broccoli magna. Mollit non excepteur ullamco broccoli. Ut broccoli broccoli, broccoli tempor laborum broccoli. Broccoli adipisicing aute ea broccoli ut. Broccoli irure ex, culpa mollit broccoli reprehenderit elit broccoli veniam broccoli ut dolore pariatur proident. Ut laborum qui in sunt.'
)

password = 'testing-only'

Admin.create(
  email: 'admin@getseedpod.com',
  password: password
)

user = FactoryGirl.create :user
user.update_attributes!(email: 'robinson.ran@gmail.com', password: password, password_confirmation: password)

subscription = FactoryGirl.create :subscription
subscription.update_attributes!(user: user)

Payment.create(
  subscription: subscription,
  pod: pod
)

Payment.create(
  subscription: subscription,
  pod: old_pod
)

Shipment.create(
  pod: pod,
  user: user,
  shipped: true
)

Shipment.create(
  pod: old_pod,
  user: user,
  shipped: true
)
