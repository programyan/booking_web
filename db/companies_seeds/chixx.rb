ActiveRecord::Base.transaction do

  categories = []

  categories << Category.find_or_create_by(name: 'Бургеры', icon_type: 'icon_burger', description: '').id
  categories << Category.find_or_create_by(name: 'Крылышки', icon_type: 'icon_wing', description: '').id
  categories << Category.find_or_create_by(name: 'Ножки', icon_type: 'icon_leg', description: '').id
  categories << Category.find_or_create_by(name: 'Кебабы', icon_type: 'icon_kebab', description: '').id
  categories << Category.find_or_create_by(name: 'Картофель фри и чипсы', icon_type: 'icon_chips', description: '').id
  categories << Category.find_or_create_by(name: 'Салаты', icon_type: 'icon_salat', description: '').id
  categories << Category.find_or_create_by(name: 'Соусы', icon_type: 'icon_sauce', description: '').id
  categories << Category.find_or_create_by(name: 'Супы', icon_type: 'icon_soup', description: '').id
  categories << Category.find_or_create_by(name: 'Напитки', icon_type: 'icon_drinks', description: '').id
  categories << Category.find_or_create_by(name: 'Наборы', icon_type: 'icon_set', description: '').id

  company_addresses = []

  company_addresses << Address.create(
                          title: 'ChiXX',
                          city: 'Хабаровск',
                          street: 'Ленина',
                          house: '18').id

  company = Company.find_or_initialize_by(name: 'ИП Свиридов Ф.Т.')

  company.update(categories: categories,
  							 description: "ChiXX – это команда единомышленников, которые любят и умеют готовить.\nНаша цель – предложить Вам лучшие рецепты из самых деликатесных частей курицы. Все наши блюда готовятся вручную, вкусно, быстро и с душой. Используем только свежие продукты и очень внимательно относимся к процессу приготовления.\nМы уверены, что наш проект поможет Вам разнообразить привычную палитру готовых блюд, которая предлагается в нашем городе.\nЗакажите прямо сейчас и в кратчайшие сроки восхитительные блюда окажутся на Вашем столе!\nМы открыли новое кафе по адресу: ул. Ленинградская, 28г. Приходите и насладитесь нашими восхотительными блюдами в приятной и дружеской атмосфере!",
  							 delivery: { cost: 150, free_shipping: 800, pickup_discount: 10, period: { start: '12:00 +10', end: '19:30 +10' } },
  							 contact_info: { phone: '+7 (4212) 77-60-25', email: 'info@chixx.ru', geotag: ["48.469463,135.071622"], geotag_cafe: ["48.483257,135.094393"] },
                 address_ids: company_addresses)

  company_id = company.id

  CompanySchedule.where(company_id: company_id).delete_all
  Product.where(company_id: company_id).delete_all

  CompanySchedule.create(
    company_id: company_id,
  	week_day: 'sun',
  	time_start: '13:00:00+10',
  	time_end: '21:00:00+10'
  )
  CompanySchedule.create(
    company_id: company_id,
  	week_day: 'mon',
  	time_start: nil,
  	time_end: nil
  )
  CompanySchedule.create(
    company_id: company_id,
  	week_day: 'tue',
  	time_start: '12:00:00+10',
  	time_end: '21:00:00+10'
  )
  CompanySchedule.create(
    company_id: company_id,
  	week_day: 'wed',
  	time_start: '12:00:00+10',
  	time_end: '21:00:00+10'
  )
  CompanySchedule.create(
    company_id: company_id,
  	week_day: 'thu',
  	time_start: '12:00:00+10',
  	time_end: '21:00:00+10'
  )
  CompanySchedule.create(
    company_id: company_id,
  	week_day: 'fri',
  	time_start: '12:00:00+10',
  	time_end: '21:00:00+10'
  )
  CompanySchedule.create(
    company_id: company_id,
  	week_day: 'sat',
  	time_start: '12:00:00+10',
  	time_end: '21:00:00+10'
  							 )

  Product.create(
  	category_id: Category.find_by_name("Бургеры").id,
  	company_id: company_id,
  	title: 'Бульдог XL',
  	brief: 'Пожалуй, самый большой бургер в городе, практически полкило чистой массы!',
  	description: 'Пожалуй, самый большой бургер в городе, практически полкило чистой массы! Две восхитительные котлеты, восхитительный хрустящий бекон, двойной сыр, салатные листья, свежие томаты, огурец, красный лук, но самое главное - великолепный соус гриль и наш фирменный карамелизированный соус с ворчестером! Вряд ли вы осилите Бульдога в одиночку :)',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/burger_buldog.png',
  	main_options: [{ name: 'Курица - 440 гр', cost: 480 },{ name: 'Говядина - 430 гр', cost: 550 }],
  	additional_info: [{ name: '🥗 Салат Коул слоу (200 гр)', cost: 75 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Бургеры").id,
  	company_id: company_id,
  	title: 'ChiXXburger',
  	brief: 'Фирменный бургер ChiXX сразу в трёх размерах! В каждом вы найдете хрустящий бекон, перчики халапеньо, хрустящие кукурузные чипсы!',
  	description: 'Фирменный бургер ChiXX сразу в трёх размерах! В каждом вы найдете 1. хрустящий бекон, 2. перчики халапеньо, 3. хрустящие кукурузные чипсы! Размер XL - 2 большие котлеты из говядины, двойной сыр (чеддер), красный лук, маринованный огурец, 2 разных бургерных соуса! Размер L - аналог XL, но с одной котлетой. И размер М - младший брат бургера L, в средней кунжутной булочке! Какой выбираете?',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/burger_chixx.png',
  	main_options: [{ name: 'XL - 450 гр', cost: 520 },{ name: 'L - 310 гр', cost: 370 },{ name: 'M - 190 гр', cost: 225}],
  	)
  Product.create(
  	category_id: Category.find_by_name("Бургеры").id,
  	company_id: company_id,
  	title: 'Чили XL',
  	brief: 'Бургер бомба! ясная чили начинка из говяжьего фарша с фасолью, кукурузой, рисом и перчиком чили + приличная сочная говяжья котлета с сыром.',
  	description: 'Бургер бомба = мясная чили начинка из говяжьего фарша с фасолью, кукурузой, рисом и перчиком чили + приличная сочная говяжья котлета с сыром чеддер + салатный лист и красный лук, сметана и кетчуп! Для большей пикантности добавьте перчик халапеньо и дополните салатом Коул слоу по приятной цене!',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/burger_chili_xl.png',
  	main_options: [{ name: 'XL - 325 гр', cost: 390 }],
  	additional_info: [{ name: '🥗 Салат Коул слоу (200 гр)', cost: 75 },{ name: '🌶 Халапеньо', cost: 10 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Бургеры").id,
  	company_id: company_id,
  	title: 'Багама-Мама М',
  	brief: 'НОВИНКА! В этом бургере вы прочувствуете божественное сочетание говяжьего мяса, бекона и сыра Моцарелла!',
  	description: 'НОВИНКА! В этом бургере вы прочувствуете божественное сочетание говяжьего мяса, бекона и сыра Моцарелла! В бургер входят: свежие листья салата, хрустящий красный лук, кетчуп Heinz и мягкая горчица! Дополните салатом Коул слоу по выгодной цене!',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/burger_bagama.png',
  	main_options: [{ name: 'M - 165 гр', cost: 210 }],
  	additional_info: [{ name: '🥗 Салат Коул слоу (200 гр)', cost: 75 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Бургеры").id,
  	company_id: company_id,
  	title: 'Aloha! М',
  	brief: 'Запоминающееся сочетание: гриль котлета + ананас, на выбор говяжья или куриная.',
  	description: 'Запоминающееся сочетание: гриль котлета + ананас, на выбор говяжья или куриная :) Листья салата, сыр чеддер и наш фирменный пикантный соус "Баффало"! Удивительное сочетание вкусов! Дополните салатом Коул слоу по выгодной цене!',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/burger_aloha.png',
  	main_options: [{ name: 'Курица - 195 гр', cost: 200 },{ name: 'Говядина - 185 гр', cost: 210 }],
  	additional_info: [{ name: '🥗 Салат Коул слоу (200 гр)', cost: 75 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Бургеры").id,
  	company_id: company_id,
  	title: 'Классик XL / M',
  	brief: 'Сочная котлета из говядины в кунжутной булочке! Дополняем салатным листом, соусом гриль, томатом, свежим красным луком, кетчупом Heinz.',
  	description: 'Сочная котлета из говядины в кунжутной булочке! Дополняем салатным листом, великолепным соусом гриль, томатом, свежим красным луком, кетчупом Heinz. По вашему желанию добавим ломтик сыра чеддер. Дополните салатом Коул слоу по приятной цене!',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/burger_classik.png',
  	main_options: [{ name: 'XL - 280 гр', cost: 330 },{ name: 'M - 155 гр', cost: 190}],
  	additional_info: [{ name: '🧀 Чеддер', cost: 15 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Бургеры").id,
  	company_id: company_id,
  	title: 'Чикен XL',
  	brief: 'Ароматная куриная котлета, маринованные огурцы, листы салата, ломтик сыра, помидоры, гриль соус.',
  	description: 'Кунжутная булочка и ароматная куриная котлета! Маринованные огурцы, листы салата, ломтик сыра, помидоры - всё это стало еще вкуснее благодаря гриль соусу. Попробуйте и влюбитесь! Дополните салатом Коул слоу по приятной цене!',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/burger_chiken.png',
  	main_options: [{ name: 'Курица - 290 гр', cost: 290 }],
  	additional_info: [{ name: '🥗 Салат Коул слоу (200 гр)', cost: 75 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Бургеры").id,
  	company_id: company_id,
  	title: 'Кантри XL',
  	brief: 'Большая говяжья котлета, луковые кольца, сыр чеддер, свежий томат, красный лук, салатные листья, нежный майонез и соус сальса в булочке.',
  	description: 'Большая говяжья котлета, золотистые луковые кольца, сыр чеддер, свежий томат, красный лук, салатные листья, нежный майонез и соус сальса в кунжутной булочке. Дополните салатом Коул слоу по приятной цене!',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/burger_kantri.png',
  	main_options: [{ name: 'XL - 325 гр', cost: 390 }],
  	additional_info: [{ name: '🥗 Салат Коул слоу (200 гр)', cost: 75 },{ name: '🌶  Халапеньо', cost: 10 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Бургеры").id,
  	company_id: company_id,
  	title: 'Баффало XL',
  	brief: 'Первый в Хабаровске Баффало бургер порадует увесистой, сочной куриной котлетой в фирменном островатом соусе Баффало.',
  	description: 'Первый в Хабаровске Баффало бургер порадует увесистой, сочной куриной котлетой в фирменном островатом соусе Баффало. Кладем свежий томат, салатный лист, маринованные огурчики кольцами и ломтики благородного голубого сыра. Дополните салатом Коул слоу по приятной цене!',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/burger_baffalo.png',
  	main_options: [{ name: 'Курица - 290 гр', cost: 350 }],
  	additional_info: [{ name: '🥗 Салат Коул слоу (200 гр)', cost: 75 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Бургеры").id,
  	company_id: company_id,
  	title: 'Чикен-гриль XL',
  	brief: 'Кунжутная булочка с сочной куриной котлетой и сыром чеддер, свежие листы салата, обжаренный на гриле баклажан, томат и шампиньоны.',
  	description: 'Кунжутная булочка с сочной куриной котлетой и сыром чеддер, свежие листы салата, обжаренный на гриле баклажан, томат и шампиньоны. Главный ингредиент - карамелизированный соус с ворчестером и соус барбекю! Дополните салатом Коул слоу по приятной цене!',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/burger_chiken_grill.png',
  	main_options: [{ name: 'Курица - 320 гр', cost: 370 }],
  	additional_info: [{ name: '🥗 Салат Коул слоу (200 гр)', cost: 75 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Бургеры").id,
  	company_id: company_id,
  	title: 'С яйцом XL',
  	brief: 'Великолепное и сытное сочетание: кунжутная булочка, жареное яйцо, большая куриная котлета в панировке, насыщенный соус.',
  	description: 'Великолепное и сытное сочетание: кунжутная булочка, жареное яйцо, большая куриная котлета в панировке, насыщенный соус, томаты и свежие листья салата. Дополните салатом Коул слоу по приятной цене!',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/burger_egg.png',
  	main_options: [{ name: 'Курица - 320 гр', cost: 330 }],
  	additional_info: [{ name: '🥗 Салат Коул слоу (200 гр)', cost: 75 }],
  )
  Product.create(
  	category_id: Category.find_by_name("Крылышки").id,
  	company_id: company_id,
  	title: 'Кентукки Криспи',
  	brief: 'Крылышки Кентукки в новом хрустящем исполнении!',
  	description: 'Крылышки Кентукки в новом хрустящем исполнении! Маринуются по рецепту ChiXX в натуральных травах и специях. Обладают лёгкой и приятной остринкой. Рекомендуем брать с соусами Сырным или Барбекю!',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/wings_krispi.png',
  	main_options: [{ name: '8 шт - 340 гр', cost: 340 },{ name: '14 шт - 600 гр', cost: 510 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Крылышки").id,
  	company_id: company_id,
  	title: 'Кентукки',
  	brief: 'Эти крылья можно считать настоящим хитом американской кухни. Снаружи - хрустящая, поджаристая корочка, внутри – нежное куриное мясо.',
  	description: 'Эти крылья можно считать настоящим хитом американской кухни. Снаружи - аппетитно хрустящая, поджаристая корочка, внутри – нежное куриное мясо. Куриные крылышки Кентукки маринуются по собственному рецепту ChiXX, в составе которого только натуральные травы и специи.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/wings_kentuki.png',
  	main_options: [{ name: '8 шт - 360 гр', cost: 340 },{ name: '14 шт - 590 гр', cost: 510 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Крылышки").id,
  	company_id: company_id,
  	title: 'Баффало',
  	brief: 'Одно из самых культовых блюд Америки! Неповторимые куриные крылышки, мягкие, сочные, обжаренные и покрытые соусом.',
  	description: 'Одно из самых культовых блюд Америки! Неповторимые куриные крылышки, мягкие, сочные, обжаренные и покрытые соусом, который и придает им традиционный островатый вкус. Соус приготовлен на основе томатной пасты, с добавлением трав и кайенского перца.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/wings_baffalo.png',
  	main_options: [{ name: '8 шт - 370 гр', cost: 340 },{ name: '14 шт - 600 гр', cost: 510 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Крылышки").id,
  	company_id: company_id,
  	title: 'Медово-горчичные',
  	brief: 'Крылышки тщательно маринуем и обжариваем до золотистой корочки, затем оборачиваем в медово-горчичный соус домашнего приготовления.',
  	description: 'Крылышки тщательно маринуем и обжариваем до золотистой корочки, затем оборачиваем в медово-горчичный соус домашнего приготовления. Блюдо становится нежно-сладковатого вкуса, с нотками горчицы и имбиря. Крылышки получаются мягкие и сочные, с приятным ароматом.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/wings_honny.png',
  	main_options: [{ name: '8 шт - 370 гр', cost: 340 },{ name: '14 шт - 590 гр', cost: 510 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Крылышки").id,
  	company_id: company_id,
  	title: 'Бурбон Барбекю',
  	brief: 'Сочные и увесистые крылышки маринуем в смеси ChiXX из специй и трав, обжариваем до золотистой корочки и пропитываем насыщенным соусом.',
  	description: 'Сочные и увесистые крылышки маринуем в смеси ChiXX из специй и трав, обжариваем до золотистой корочки и пропитываем насыщенным соусом на основе бурбона, томатной пасты и коричневого сахара. Крылышки получаются мягкие, приобретают аромат жарки на гриле и свойственные бурбону нотки чернослива.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/wings_bbq.png',
  	main_options: [{ name: '8 шт - 370 гр', cost: 340 },{ name: '14 шт - 590 гр', cost: 510 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Крылышки").id,
  	company_id: company_id,
  	title: 'Шрирача Hot!',
  	brief: 'НОВИНКА! Крылья Шрирача порадуют пронзительно огненным острым вкусом, тщательно промаринованные и обжаренные!',
  	description: 'НОВИНКА! Крылья Шрирача порадуют пронзительно огненным острым вкусом, тщательно промаринованные и обжаренные, они отлично подойдут любителям блюд "погорячее"! Пикантный соус шрирача на основе перца чили и чеснока проникает в крылышки до самых косточек и вряд ли даст вам заскучать!',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/wings_shiracha.png',
  	main_options: [{ name: '8 шт - 370 гр', cost: 340 },{ name: '14 шт - 600 гр', cost: 510 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Крылышки").id,
  	company_id: company_id,
  	title: 'Терияки',
  	brief: 'Крылышки маринуются, обжариваются и покрываются нашим фирменным Терияки соусом.',
  	description: 'Крылышки маринуются, обжариваются и покрываются нашим фирменным Терияки соусом. Блюдо обладает насыщенным вкусом и ароматом благодаря сочетанию соевого соуса, меда и семян кунжута. Крылышки получаются мягкие и сочные, с приятным сладковатым привкусом.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/wings_tereyaki.png',
  	main_options: [{ name: '8 шт - 370 гр', cost: 340 },{ name: '14 шт - 590 гр', cost: 510 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Крылышки").id,
  	company_id: company_id,
  	title: 'Куриное филе',
  	brief: 'Нежнейшие кусочки свежего куриного филе, обернутые в льезон и обжаренные с травами и специями до приятного золотистого цвета.',
  	description: 'Нежнейшие кусочки свежего куриного филе, обернутые в льезон и обжаренные с травами и специями до приятного золотистого цвета.  Вкусное и полезное блюдо!',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/chicken.png',
  	main_options: [{ name: '210 гр', cost: 250 },{ name: '420 гр', cost: 460 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Крылышки").id,
  	company_id: company_id,
  	title: 'Куриные наггетсы',
  	brief: 'Аппетитные куриные наггетсы, панированные в сухарях и приготовленные до хрустящей золотистой корочки.',
  	description: 'Аппетитные куриные наггетсы, панированные в сухарях и приготовленные до хрустящей золотистой корочки. Понравятся не только взрослым, но и детям!',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/nagets.png',
  	main_options: [{ name: '9 шт - 160 гр', cost: 170 },{ name: '15 шт - 260 гр', cost: 270 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Ножки").id,
  	company_id: company_id,
  	title: 'Баффало',
  	brief: 'Куриные ножки, мягкие, сочные, обжаренные и покрытые соусом, который и придает им традиционный островатый вкус.',
  	description: 'Куриные ножки, мягкие, сочные, обжаренные и покрытые соусом, который и придает им традиционный островатый вкус. Соус приготовлен на основе томатной пасты с добавлением кайенского перца.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/legs_baffalo.png',
  	main_options: [{ name: '3-4 шт - 370 гр', cost: 340 },{ name: '5-6 шт - 580 гр', cost: 510 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Ножки").id,
  	company_id: company_id,
  	title: 'Кентукки',
  	brief: 'Снаружи - аппетитно хрустящая, поджаристая корочка, внутри – нежное куриное мясо.',
  	description: 'Снаружи - аппетитно хрустящая, поджаристая корочка, внутри – нежное куриное мясо. Маринуем и панируем по собственному рецепту в составе которого кукурузные хлопья и только натуральные травы и специи.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/legs_kentuki.png',
  	main_options: [{ name: '3-4 шт - 370 гр', cost: 340 },{ name: '5-6 шт - 570 гр', cost: 510 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Кебабы").id,
  	company_id: company_id,
  	title: 'Чикен Донер',
  	brief: 'Новинка! Классическое исполнение: нежное и поджаристое куриное мясо со специями.',
  	description: 'Новинка! Классическое исполнение: нежное и поджаристое куриное мясо со специями в сочетании с воздушным чесночным соусом и хрустящей овощной начинкой: свежий томат, морковь, капуста, солёный огурец. Всю плотно заворачиваем в лаваш, обжариваем на гриле.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/doner_kebab.png',
  	main_options: [{ name: '430 гр', cost: 250 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Кебабы").id,
  	company_id: company_id,
  	title: 'Роял Донер',
  	brief: 'Новинка! Куриное мясо, хрустящая капуста, морковь, соленый огурец, томат, красный лук, картофель фри, моцарелла, шампиньоны, соус айоли.',
  	description: 'Новинка! Поджаристое куриное мясо, свежая хрустящая капуста, морковь, соленый огурец, томат, красный лук, картофель фри, сыр моцарелла, свежие шампиньоны, воздушный чесночный соус айоли, всё обжариваем в лаваше на гриле.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/kebab.png',
  	main_options: [{ name: '535 гр', cost: 450 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Кебабы").id,
  	company_id: company_id,
  	title: 'Буррито',
  	brief: 'Новинка! Блюдо с начинкой из говяжьего фарша, фасоли, риса, кукурузы, томатов, красного лука, сыра, перчика халапеньо и нежной сметаны.',
  	description: 'Новинка! Блюдо с сытнейшей начинкой из говяжьего фарша, фасоли, риса, кукурузы, томатов, красного лука, сыров Чеддер и Моцарелла, перчика халапеньо и нежной сметаны. Всё это завернуто в пшеничную тортилью и обжарено на гриле. Дополните соусом Сальса или Сырным по приятной цене!',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/burita.png',
  	main_options: [{ name: '275 гр', cost: 280 }],
  	additional_info: [{ name: '🍜 Сальса (60 мл)', cost: 50 },{ name: '🧀 Сырный (60 мл)', cost: 50 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Картофель фри и чипсы").id,
  	company_id: company_id,
  	title: 'Картофель дольками',
  	brief: 'Картофель, порезанный дольками, обжаренный до золотистой корочки и слегка посыпанный специями.',
  	description: 'Картофель, порезанный дольками, обжаренный до золотистой корочки и слегка посыпанный специями - вкусное и сочное дополнение к крыльям и ножкам!',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/potato_dolki-min.png',
  	main_options: [{ name: '180 гр', cost: 110 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Картофель фри и чипсы").id,
  	company_id: company_id,
  	title: 'Картофель фри',
  	brief: 'Классический картофель фри, порезанный соломкой, обладающий золотистым цветом.',
  	description: 'Классический картофель фри, порезанный соломкой, обладающий золотистым цветом. Присыпается специями. Отлично сочетается с любым из соусов на ваш выбор.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/potato_frii-min.png',
  	main_options: [{ name: '140 гр', cost: 95 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Картофель фри и чипсы").id,
  	company_id: company_id,
  	title: 'Луковые кольца',
  	brief: 'Нежные и хрустящие луковые кольца обжариваются до золотистой корочки.',
  	description: 'Нежные и хрустящие луковые кольца обжариваются до золотистой корочки. Вкус блюда еще лучше оттеняется кисло-сладким или чесночным соусом!',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/onion-min.png',
  	main_options: [{ name: '10 шт', cost: 120 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Картофель фри и чипсы").id,
  	company_id: company_id,
  	title: 'Хашбраунс',
  	brief: 'НОВИНКА! Порция золотистых хрустящих картофельных хэшбраунс.',
  	description: 'НОВИНКА! Порция золотистых хрустящих картофельных хэшбраунс. Приятный вкус жареной картошечки с луком!',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/hashbrauns-min.png',
  	main_options: [{ name: '4 шт', cost: 120 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Картофель фри и чипсы").id,
  	company_id: company_id,
  	title: 'Картофельные чипсы',
  	brief: 'Чипсы "Классические" (почти без соли).',
  	description: 'Хрустящая закуска, предлагаем чипсы "Классические" (почти без соли), которые можно дополнить любым соусом на ваш вкус.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/chips-min.png',
  	main_options: [{ name: 'Классик, 50 гр', cost: 70 }, { name: 'Классик, 100 гр', cost: 130 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Картофель фри и чипсы").id,
  	company_id: company_id,
  	title: 'Сырные палочки',
  	brief: 'Хрустящая, излюбленная многими закуска, с нежным сыром Моцарелла внутри.',
  	description: 'Хрустящая, излюбленная многими закуска, с нежным сыром Моцарелла внутри. Палочки обжарены до золотистой корочки. Еще вкуснее с чесночным или Барбекю соусом!',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/cheese_tiks-min.png',
  	main_options: [{ name: '5 шт (~165 гр)', cost: 230 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Салаты").id,
  	company_id: company_id,
  	title: 'Цезарь',
  	brief: 'Классический и неповторимый "Цезарь": свежие листья салата Айсберг, томаты черри, тертый сыр Пармезан, хрустящие крутоны и насыщенный соус.',
  	description: 'Классический и неповторимый "Цезарь": свежие листья салата Айсберг, томаты черри, тертый сыр Пармезан, хрустящие крутоны и насыщенный соус Цезарь.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/salad_caesar.png',
  	main_options: [{ name: '220 гр', cost: 190 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Салаты").id,
  	company_id: company_id,
  	title: 'Коул слоу',
  	brief: 'Легкий салат с основой из свежей моркови, капусты, заправляем сметанным соусом с винным уксусом.',
  	description: 'Легкий салат с основой из свежей моркови, капусты, заправляем сметанным соусом с винным уксусом и добавлением классической горчицы и черного перца. Идеален в качестве закуски для бургеров и горячих блюд.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/salat_koul-min.png',
  	main_options: [{ name: '200 гр', cost: 90 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Соусы").id,
  	company_id: company_id,
  	title: 'Сальса',
  	brief: 'Традиционный мексиканский соус на томатной основе.',
  	description: 'Традиционный мексиканский соус на томатной основе. Сладко-острый соус с кусочками красной паприки, чеснока и смеси «Тех-Мех» специй. Идеален в качестве дип-соуса к гарнирам и горячим блюдам - тортильям, чипсам, начос.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/souce_salsa-min.png',
  	main_options: [{ name: '60 мл', cost: 60 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Соусы").id,
  	company_id: company_id,
  	title: 'Блю чиз',
  	brief: 'Традиционный соус на основе благородного голубого сыра, фреш крема и белого перца.',
  	description: 'Традиционный соус на основе благородного голубого сыра, фреш крема и белого перца. Для насыщенного вкуса комочки сыра специально не измельчаются.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/souce_blue-min.png',
  	main_options: [{ name: '60 мл', cost: 90 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Соусы").id,
  	company_id: company_id,
  	title: 'Горчичный',
  	brief: 'Пряно-горчичный соус, на основе подсолнечного масла, желтков, семян горчицы и специй.',
  	description: 'Пряно-горчичный соус, на основе подсолнечного масла, желтков, семян горчицы и специй. Придает блюду пикантный вкус и остроту, вносит медовую нотку.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/souce_dijon-min.png',
  	main_options: [{ name: '60 мл', cost: 60 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Соусы").id,
  	company_id: company_id,
  	title: 'Сырный',
  	brief: 'Соус с насыщенным, ярким вкусом и ароматом.',
  	description: 'Соус с насыщенным, ярким вкусом и ароматом, специально для любителей сыра.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/souce_cheese-min.png',
  	main_options: [{ name: '60 мл', cost: 60 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Соусы").id,
  	company_id: company_id,
  	title: 'Барбекю (BBQ)',
  	brief: 'Классический соус',
  	description: 'Классический соус великолепно передает вкус и аромат приготовления на гриле.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/souce_bbq-min.png',
  	main_options: [{ name: '60 мл', cost: 60 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Соусы").id,
  	company_id: company_id,
  	title: 'Чесночный',
  	brief: 'Классический чесночный соус',
  	description: 'Обладает приятным ароматом, умеренной остротой и восхитительно нежным вкусом.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/souce_garlic-min.png',
  	main_options: [{ name: '60 мл', cost: 60 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Соусы").id,
  	company_id: company_id,
  	title: '1000 Островов',
  	brief: 'Классический соус средиземноморской и американской кухонь.',
  	description: 'Классический соус средиземноморской и американской кухонь. Нежный, слегка острый и пряный соус с букетом трав и специй. Идеален для овощных салатов, морских коктейлей и бургеров.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/souce_1000-min.png',
  	main_options: [{ name: '60 мл', cost: 60 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Соусы").id,
  	company_id: company_id,
  	title: 'Кетчуп',
  	brief: 'Классический кетчупа HEINZ.',
  	description: 'Классический кетчупа HEINZ, обладает густой консистенции и насыщенным вкусом томатов. Подходит практически для любого блюда.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/souce_ketchup-min.png',
  	main_options: [{ name: '60 мл', cost: 50 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Соусы").id,
  	company_id: company_id,
  	title: 'Китайский Кисло-сладкий',
  	brief: 'Пикантный соус к любому блюду, играющий неожиданными вкусовыми гранями.',
  	description: 'Пикантный соус к любому блюду, играющий неожиданными вкусовыми гранями.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/souce_china-min.png',
  	main_options: [{ name: '60 мл', cost: 60 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Супы").id,
  	company_id: company_id,
  	title: 'Чили кон карне',
  	brief: 'Новинка! HOT!HOT! Чили кон карне -  мясной суп техасской и мексиканской кухонь.',
  	description: 'Новинка! HOT!HOT! Чили кон карне -  мясной суп техасской и мексиканской кухонь: говядина, ароматный рис, томаты, красная фасоль и кукуруза, с добавлением перчика чили. Суп очень питательный и запоминающийся! По желанию можно добавить тертый сыр либо сметану.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/soup_karne-min.png',
  	additional_info: [{ name: '🍛 Сметана', cost: 5 }, { name: '🧀 Сыр', cost: 15 }],
  	main_options: [{ name: 'Суп - 270 гр', cost: 199 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Напитки").id,
  	company_id: company_id,
  	title: '7up',
  	brief: 'Великолепная тройка - напитки, давно зарекомендовавшие себя для любого повода.',
  	description: 'Великолепная тройка - напитки, давно зарекомендовавшие себя для любого повода.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/drink_7up-min.png',
  	main_options: [{ name: '600 мл', cost: 80 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Напитки").id,
  	company_id: company_id,
  	title: 'Mirinda',
  	brief: 'Великолепная тройка - напитки, давно зарекомендовавшие себя для любого повода.',
  	description: 'Великолепная тройка - напитки, давно зарекомендовавшие себя для любого повода.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/drink_miranda-min.png',
  	main_options: [{ name: '600 мл', cost: 80 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Напитки").id,
  	company_id: company_id,
  	title: 'Pepsi',
  	brief: 'Великолепная тройка - напитки, давно зарекомендовавшие себя для любого повода.',
  	description: 'Великолепная тройка - напитки, давно зарекомендовавшие себя для любого повода.',
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/drink_pepsi-min.png',
  	main_options: [{ name: '600 мл', cost: 80 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Наборы").id,
  	company_id: company_id,
  	title: 'Wing cет',
  	brief: 'Куриные крылышки: Баффало / Кентукки / Медово-горчичные / Бурбон-барбекю, Картофель дольками, Луковые кольца, Луковые кольца',
  	description: "Куриные крылышки 4 порции M: Баффало / Кентукки / Медово-горчичные / Бурбон-барбекю\n картофель дольками (2 порции),\n+ Луковые кольца (2 порции),\n+ Соус на выбор (4 шт).",
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/set1-min.png',
  	main_options: [{ name: 'Wing cет', cost: 1770 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Наборы").id,
  	company_id: company_id,
  	title: 'Burger сет',
  	brief: 'В состав сета входят 4 больших бургера: Чикен / Классик, Салат Коул слоу, Картофель дольками',
  	description: "В состав сета входят 4 больших бургера: Чикен / Классик,\n+ Салат Коул слоу (4 порции),\n+ Картофель дольками (2 порции)",
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/set2-min.png',
  	main_options: [{ name: 'Burger сет', cost: 1610 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Наборы").id,
  	company_id: company_id,
  	title: 'Mix сет',
  	brief: 'В состав сета входят 2 больших бургера: Чикен / Классик, Куриные крылышки 2 порции M на выбор, Картофель дольками, Соус на выбор',
  	description: "В состав сета входят 2 больших бургера: \nЧикен \n/ Классик, Куриные крылышки 2 порции M: Баффало / Кентукки / Медово-горчичные / Бурбон-барбекю, \nКартофель дольками (2 порции), \nСоус на выбор (2 порции)",
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/set3-min.png',
  	main_options: [{ name: 'Mix сет', cost: 1470 }],
  	)
  Product.create(
  	category_id: Category.find_by_name("Наборы").id,
  	company_id: company_id,
  	title: 'Beer сет',
  	brief: 'Самый большой ChiXX сет: Куриные крылышки на выбор, Картофель дольками, Луковые кольца, Соус на выбор',
  	description: "Самый большой ChiXX сет: \nКуриные крылышки на выбор (3 XL порции) \n+ Картофель дольками / Луковые кольца (3 порции) \n+ Соус на выбор (3 порции) \nЭтот сет можно дополнить Бургерами Бульдог \nсо скидкой 10%",
  	photo: 'https://195319.selcdn.ru/delivery_food/Chixx/products/set4-min.png',
  	main_options: [{ name: 'Beer сет', cost: 1810 }],
  	)
end
