# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])

#   Character.create(name: "Luke", movie: movies.first)
User.create!(
  name: "admin",
  username: "admin",
  email: "admin@melodyrentals.com",
  password: "1234567",
  password_confirmation: "1234567",
  role: "admin",
)

Instrument.create![(
    { name: 'Sitar', description: 'This sitar can be played as a Vilayat Khan or Ravi Shankar Style
    7 main and 12 sympathetic (Tarab) strings
    Hand-carved natural bone Main and Taraf (sympathetic) bridge.
    Steel strings are German steel and Bronze and Brass strings are English made.
    Celluloid material (reflects of mother of pearl) decoration.
    Very plain, with No carving or other decorations. Lightweight Sitar. 
    The body of the Sitar is made of well-seasoned toon wood (Red Cider)
    ', image: '', price: '45', available: true, category: "String", user_id: 1,},
    { name: 'Tanpura Deluxe Model', description: '(Miraj)The Tanpura is called as the Tambura (Devanagari: तम्पूरा) is along necked plucked lute, Tumba made with a dried Gourd. This is a stringed instrument found in different versions in different places. This is also called Tambora in Marathi, Tambura in South India, Tamburo in Gujarati, or Tanpura in North India in its bodily shape somewhat resembles the sitar, but it has no frets, as only the open strings are played as a harmonic accompaniment to the other musicians. It has four or five (rarely, six) wire strings, which are plucked one after another in a regular pattern to create a harmonic resonance on the basic noteStandardtunning of the Tanpura i', image: '', price: '55', available: true, category: "String", user_id: 1,},
    { name: 'Dholaka', description: 'The dholaka (or dholak) is a barrel-shaped drum with two heads. It is played with the hand and a stick. This nineteenth-century example is rope-
    tensioned with brass rings that allow the player to adjust the tension on the heads.', image: '', price: '20', available: true, category: "Percussion", user_id: 1,},
    { name: 'Kirar', description: 'A traditional African guitar from Ethiopia and Eritrea. It is also known as Kirar, Kerar, or Kraar. This five or six-stringed bowl-shaped lyre decorated with beads, cloth, and wood is tuned to a pentatonic scale and can be amplified like a violin or electric guitar.', image: '', price: '25', available: false, category: "String", user_id: 1,},
    { name: 'Banjo', description: 'Banjo is a typical African musical instrument from West Africa that has gained widespread use outside the continent, especially in the Caribbean by slaves in the 17th century. The body of this instrument resembles a tambourine with a hoop and 
    screw securing the vellum belly to the frame. This stringed musical instrument with 
    a thin membrane stretched over a cavity or frame to form a resonator resembles 
    Akoting', image: '', price: '25', available: true, category: "String", user_id: 1,},
    { name: 'Balafon', description: 'The playing of a Balafon takes after that of a xylophone. This gourd-resonated xylophone originates from West African states such as Ivory Coast, Burkina Faso, Mali, and Ghana.', image: '', price: '40', available: true, category: "Percussion", user_id: 1,},
    { name: 'Algaita', description: ' Algaita is one of the most beautiful famous double-reed African woodwind instruments from West Africa, commonly favourite in international Jazz 
    compositions. The Kanuri people of Nigeria are the founders of this timeless art of 
    music, but it is also common among the Hausa', image: '', price: '35', available: false, category: "Percussion", user_id: 1,},
    { name: 'Goblet Drum', description: 'These percussion instruments have been used since ancient times. Many drawings show ancient Egyptians playing goblet drums in temples and festivities. Nowadays, goblet drums are the National symbol of Egyptian folklore music.
    The drum`s basic shape has remained the same since ancient times. The main 
    difference is the drum`s rounded edges. They help produce sounds typical of 
    traditional Egyptian music', image: '', price: '60', available: true, category: "Percussion", user_id: 1,},
    { name: 'Egyptian harp', description: 'The harp, called benet in ancient Egyptian, was one of the most popular musical instruments throughout pharaonic history. This bow harp, among the oldest to have survived, is characterized by a long, curving neck and a shovel-shaped sound box', image: '', price: '30', available: true, category: "String", user_id: 1,},
    { name: 'Wooden Pipe', description: '
    A pipe is a tubular wind instrument in general, or various specific wind instruments. The word is an onomatopoeia, and comes from the tone which can resemble that of a bird chirping. With just three holes, a pipe`s range is obtained by overblowing to sound at least the second or the third harmonic partials', image: '', price: '20', available: true, category: "Woodwind", user_id: 1,},
    { name: 'Oud', description: 'The oud is a short-neck lute-type, pear-shaped, fretless stringed instrument, usually with 11 strings grouped in six courses, but some models have five or seven courses, with 10 or 13 strings respectively. The oud is very similar to other types of lute, and to Western lutes', image: '', price: '35', available: true, category: "String", user_id: 1,},
)]

# in case we wanna add more instruments, here is the boiler plate
# { name: '', description: '', image: '', price: '', available: true, category: "", user_id: 1,},


