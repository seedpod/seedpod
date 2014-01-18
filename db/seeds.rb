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
  detail: 'Bacon ipsum dolor sit amet nisi broccoli in voluptate broccoli broccoli irure broccoli broccoli broccoli dolor broccoli qui. Broccoli broccoli broccoli laboris ex elit pariatur broccoli broccoli broccoli adipisicing broccoli deserunt exercitation broccoli. Fugiat nostrud in aute anim consequat broccoli nisi eiusmod duis broccoli ut. Est broccoli broccoli broccoli esse, duis broccoli laborum broccoli cupidatat sunt officia. Broccoli broccoli anim elit aliquip, ex broccoli. Esse ut incididunt irure ut broccoli magna. Mollit non excepteur ullamco broccoli. Ut broccoli broccoli, broccoli tempor laborum broccoli. Broccoli adipisicing aute ea broccoli ut. Broccoli irure ex, culpa mollit broccoli reprehenderit elit broccoli veniam broccoli ut dolore pariatur proident. Ut laborum qui in sunt.'
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

Admin.create(
  email: 'admin@getseedpod.com',
  password: 'testing-only'
)

user = User.create(
  email: 'robinson.ran@gmail.com',
  password: 'testing-only',
  name:              Faker::Name.name,
  address_street:    Faker::Address.street_address,
  address_locality:  Faker::Address.city,
  address_region:    Faker::Address.state,
  address_postcode:  Faker::Address.postcode,
)

subscription = Subscription.create(
  user: user
)

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
