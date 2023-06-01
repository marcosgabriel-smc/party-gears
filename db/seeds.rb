# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Cleaning the users table...'
User.destroy_all

puts 'Creating 3 users...'
meleu = User.create!(
  name: 'meleu',
  email: 'meleu@rbnb.com',
  password: 'asdfgçlkjh',
  bio: Faker::Quote.matz,
  avatar: 'https://github.com/meleu.png'
)
marcos = User.create!(
  name: 'marcos',
  email: 'marcos@rbnb.com',
  password: 'asdfgçlkjh',
  bio: Faker::Quote.matz,
  avatar: 'https://github.com/marcosgabriel-smc.png'
)
douglas = User.create!(
  name: 'douglas',
  email: 'douglas@rbnb.com',
  password: 'asdfgçlkjh',
  bio: Faker::Quote.matz,
  avatar: 'https://github.com/Douglasgpassos.png'
)

images = {
  'dj' => 'https://cdn.awsli.com.br/600x450/2511/2511094/produto/191248690/3f146d2a98.jpg',
  'sound' => 'https://images.unsplash.com/photo-1620456175552-c82581ade74e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1632&q=80',
  'lighting' => 'https://sb7someluz.com.br/wp-content/uploads/2015/04/Profissionais-do-Ano-06.jpg'
}

puts 'Cleaning the gears table...'
Gear.destroy_all

puts "Creating some gears"

sound = Gear.create!(
  category: 'SOUND',
  name: "MONITOR DE ÁUDIO R1280DB",
  description: "-Potência de saída: L / R: 21W + 21W RMS
  -Relação sinal / ruído: 85dBA (A)
  -Nível de ruído:< 25dB (A)
  -Sensibilidade de entrada: LINE IN1: R / L: 450 ± 50mV
                                       LINE IN2: R / L: 550 ± 50mV
                                       OPT / COA: R / L: 500 ± 50mFFS
                                       Bluetooth: R / L: 700 ± 50mFFS
  -Resposta de frequência: 55Hz-20KHz
  -Unidade de graves: 4 (116mm)
  -Unidade de Tweeter: tweeter de cúpula de seda de 13mm
  -Bivolt",
  user: marcos,
  image_url: "https://edifier.com.br/pub/media/catalog/product/cache/f1731b22860b0086fc34e14d5ee03543/c/a/caixa-de-som-bluetooth-edifier-r1280dbs_4.jpg",
  price: rand(50..500)
)

lighting = Gear.create!(
  category: 'LIGHTING',
  name: "REFLETOR LED COB 200W CWWW C/BANDOOR",
  description: "Os antigos refletores PAR 64 tinham lâmpadas halógenas, esquentavam muito e consumiam mais energia. Para substituir esse produto, temos o refletor COB LED 200w Cw/WW. A vantagem desse produto é versatilidade, pois o refletor de LED 200w pode ser usado em teatros, feiras, shows e igrejas para iluminar seu palco. Além de ser um produto LED, o refletor cob possui sistema eletrônico de dimerização que elimina o uso do dimmer e consome 1/4 da potência de um refletor convencional. Além disso, o refletor conta com LED WW que significa branco quente (warm white) e LED CW, o branco frio (cool white). Isso permite ao usuário chegar na temperatura de cor ideal. Além de comprar o refletor COB LED 200w, aproveite as vantagens da loja para incluir outros produtos de iluminação profissional no seu pedido.",
  user: meleu,
  image_url: "https://cdn.awsli.com.br/600x450/1296/1296619/produto/213582398/refletor-cob-100w-led-rlfeywu5fb.jpg",
  price: rand(50..500)
)

dj = Gear.create!(
  category: 'DJ',
  name: "XDJ-RR",
  description: "Eleve as suas atuações para um nível superior com o sistema para DJ tudo-em-um para rekordbox. Esta solução de DMJ com 2 canais herda as características de design e funcionalidades essenciais no nosso multileitor profissional NXS2 e da mesa de mistura combinando tudo num conjunto portátil e leve.",
  user: douglas,
  image_url: "https://www.pioneerdj.com/-/media/pioneerdj/images/products/all-in-one-system/xdj-rr/xdj-rr-main-v2.png",
  price: rand(50..500)
)

20.times do
  category = Gear::CATEGORIES.sample

  Gear.create!(
    category:,
    name: Faker::App.name,
    description: Faker::Quote.famous_last_words,
    user: User.all.sample,
    image_url: images[category],
    price: rand(50..500)
  )
end

puts 'Creating some offers'
today = Date.today
tomorrow = Date.tomorrow
interval = (tomorrow - today).to_i

Offer.create!(
  gear: dj,
  user: marcos,
  start_date: today,
  end_date: tomorrow,
  total_price: dj.price * interval
)

Offer.create!(
  gear: dj,
  user: meleu,
  start_date: today,
  end_date: tomorrow,
  total_price: dj.price * interval
)

Offer.create!(
  gear: sound,
  user: meleu,
  start_date: today,
  end_date: tomorrow,
  total_price: sound.price * interval
)

Offer.create!(
  gear: sound,
  user: douglas,
  start_date: today,
  end_date: tomorrow,
  total_price: sound.price * interval
)

Offer.create!(
  gear: lighting,
  user: douglas,
  start_date: today,
  end_date: tomorrow,
  total_price: lighting.price * interval
)

Offer.create!(
  gear: lighting,
  user: marcos,
  start_date: today,
  end_date: tomorrow,
  total_price: lighting.price * interval
)

puts 'Finished!'
