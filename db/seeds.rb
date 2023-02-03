# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  name: 'admin',
  username: 'admin',
  email: 'admin@melodyrentals.com',
  password: '1234567',
  password_confirmation: '1234567',
  role: 'admin',
)

User.create!(
  name: 'regular',
  username: 'regular',
  email: 'regular@melodyrentals.com',
  password: '1234567',
  password_confirmation: '1234567',
  role: 'regular',
)

Instrument.create!(
  name: 'Kalimba',
  description: 'Kalimba originates from Africa as a kind of portable musical instrument. MiSoundofNature creates the high-end Kalimba via superior Black Walnut, Black Walnuts & Maple, Zambian RoseWood to chase the melodies around in the deep forest. It is made of full flat board, and the selected wood is more than 10 years old. All of them are printed with tree rings, and the sound will be more solid and rich.combining vocal music theory, natural and gorgeous texture, fine and uniform structure, and strong acoustic plasticity.
  ',
  image: 'http://cdn.shopify.com/s/files/1/0610/5291/1800/products/hluru-17-key-flat-board-kalimba-thumb-piano-zambian-rosewood-guibourtia-single-board-arc-chamfering-c-tone-kalimba-instrument-misoundofnature-1.jpg?v=1654069864',
  price: '45',
  available: true,
  category: 'Keys',
  user_id: 1
)

Instrument.create!(
  name: 'Tanpura Deluxe Model',
  description: '(Miraj)The Tanpura is called as the Tambura (Devanagari: तम्पूरा) is along necked plucked lute, Tumba made with a dried Gourd. This is also called Tambura in South India. In its bodily shape somewhat resembles the sitar, but it has no frets, as only the open strings are played as a harmonic accompaniment to the other musicians. It has four or five (rarely, six) wire strings, which are plucked one after another in a regular pattern to create a harmonic resonance on the basic noteStandardtunning of the Tanpura',
  image: 'https://musicwithaditi.com/wp-content/uploads/2019/08/8325869555_94a6dd1050-1.jpg',
  price: '55',
  available: true,
  category: 'String',
  user_id: 1
)

Instrument.create!(
  name: 'Dholaka',
  description: 'The dholaka (or dholak) is a barrel-shaped drum with two heads. It is played with the hand and a stick. This nineteenth-century example is rope-
  tensioned with brass rings that allow the player to adjust the tension on the headsWooden two-headed drum.The rosewood shell has two heads held in place and tuned by bolts. Held horizontally, both heads are played with the hands (no beaters). In India, these extremely popular percussion instruments are commonly used in folk music and during marriage ceremonies.',
  image: 'https://i5.walmartimages.com/asr/0560432d-4b7c-41a9-8b42-f9bc7fcb8eb7_1.0a10b053d43eaac4a717a244c946618b.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF',
  price: '20',
  available: false,
  category: 'Percussion',
  user_id: 1
)

Instrument.create!(
  name: 'Kirar',
  description: 'A traditional African guitar from Ethiopia and Eritrea. It is also known as Kirar, Kerar, or Kraar. This five or six-stringed bowl-shaped lyre decorated with beads, cloth, and wood is tuned to a pentatonic scale and can be amplified like a violin or electric guitar.',
  image: 'https://assets.catawiki.nl/assets/2018/1/12/4/a/d/4ad0664a-964c-44ba-a4b5-c2167e52396e.jpg',
  price: '25',
  available: false,
  category: 'String',
  user_id: 1
)

Instrument.create!(
  name: 'Banjo',
  description: 'Banjo is a typical African musical instrument from West Africa that has gained widespread use outside the continent, especially in the Caribbean by slaves in the 17th century. The body of this instrument resembles a tambourine with a hoop and 
  screw securing the vellum belly to the frame. This stringed musical instrument with 
  a thin membrane stretched over a cavity or frame to form a resonator resembles 
  Akoting',
  image: 'https://collectionapi.metmuseum.org/api/collection/v1/iiif/505373/1024327/restricted',
  price: '25',
  available: true,
  category: 'String',
  user_id: 1
)

Instrument.create!(
  name: 'Balafon',
  description: 'The playing of a Balafon takes after that of a xylophone. This gourd-resonated xylophone originates from West African states such as Ivory Coast, Burkina Faso, Mali, and Ghana.',
  image: 'https://africaglobalnews.com/wp-content/uploads/2019/04/balafon.jpg',
  price: '40',
  available: true,
  category: 'Percussion',
  user_id: 1
)

Instrument.create!(
  name: 'Algaita',
  description: ' Algaita is one of the most beautiful famous double-reed African woodwind instruments from West Africa, commonly favourite in international Jazz 
  compositions. The Kanuri people of Nigeria are the founders of this timeless art of 
  music, but it is also common among the Hausa',
  image: 'https://www.indianidolacadmy.in/musical-instruments/img/instruments/algaita.jpg',
  price: '35',
  available: false,
  category: 'Percussion',
  user_id: 1
)

Instrument.create!(
  name: 'Goblet Drum',
  description: 'These percussion instruments have been used since ancient times. Many drawings show ancient Egyptians playing goblet drums in temples and festivities. Nowadays, goblet drums are the National symbol of Egyptian folklore music.
  The drum`s basic shape has remained the same since ancient times. The main 
  difference is the drum`s rounded edges. They help produce sounds typical of 
  traditional Egyptian music',
  image: 'https://www.bellydance.com/assets/images/8322-style-A.jpg',
  price: '60',
  available: true,
  category: 'Percussion',
  user_id: 1
)

Instrument.create!(
  name: 'Egyptian harp',
  description: 'The harp, called benet in ancient Egyptian, was one of the most popular musical instruments throughout pharaonic history. This bow harp, among the oldest to have survived, is characterized by a long, curving neck and a shovel-shaped sound box',
  image: 'https://api.europeana.eu/thumbnail/v3/400/cb05a72c918f7f5222d3dbe3f072879e', 
  price: '30',
  available: true,
  category: 'String',
  user_id: 1
)

Instrument.create!(
  name: 'Wooden Pipe',
  description: '
  A pipe is a tubular wind instrument in general, or various specific wind instruments. The word is an onomatopoeia, and comes from the tone which can resemble that of a bird chirping. With just three holes, a pipe`s range is obtained by overblowing to sound at least the second or the third harmonic partials',
  image: 'https://static.wixstatic.com/media/93a372_6b36ea13ff874b9fb7396d94fd9bb73f.jpg/v1/fill/w_560,h_560,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/93a372_6b36ea13ff874b9fb7396d94fd9bb73f.jpg',
  price: '20',
  available: true,
  category: 'Woodwind',
  user_id: 1
)

Instrument.create!(
  name: 'Oud',
  description: 'The oud is a short-neck lute-type, pear-shaped, fretless stringed instrument, usually with 11 strings grouped in six courses, but some models have five or seven courses, with 10 or 13 strings respectively. The oud is very similar to other types of lute, and to Western lutes',
  image: 'https://www.muzikkon.com/media/catalog/product/cache/064b89cbcfc7f93eb2290947767b1e60/a/r/arabic_oud_12_strings_walnut_1.jpg',
  price: '35',
  available: true,
  category: 'String',
  user_id: 1
)
Instrument.create!(
  name: 'Calabash Rattle',
  description: 'The Calabash Rattle is an African instrument made from woven strips of cane with pebbles inside & handle. The fill material of these rattles will vary, so each is unique. Some will have a more jingling sound, others more of a rattle of seeds. Remember, this rattle is made from natural materials, so it will need to be handled with care! Shake or tap against your hand to create various sounds. Perfect for various occasions, from the classroom to concert hall!',
  image: 'https://static.wixstatic.com/media/6a8478_79bfaf4ed64c4b9c893196241d07838b~mv2.png/v1/fit/w_500,h_500,q_90/file.png',
  price: '30',
  available: true,
  category: 'Percussion',
  user_id: 1
)

# in case we wanna add more instruments, here is the boiler plate
# { name: '', description: '', image: '', price: '', available: true, category: '', user_id: 1,},
