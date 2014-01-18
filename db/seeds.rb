turnips = Crop.create(
            name: 'turnips', 
            description: 'Turnips are lovely'
          )

carrots = Crop.create(
            name: 'carrots', 
            description: 'OMG CARROTS'
          )

pod     = Pod.create(
            month: Date.new(2013,8),
            published: true
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

User.create(
  email: 'robinson.ran@gmail.com',
  password: 'testing-only'
)
