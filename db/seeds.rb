require "open-uri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# *********************************************************************************************************************
# ************************************************ GUIDE TO USE THE SEED **********************************************
# *********************************************************************************************************************

# use the user jon.lemon@hotmail.com (password: 123456) to navigate, he had two jobs :
# backend developper / fullstack developper
# If you wanna add a job to add more offers, add frontend developper, it add you the first offer of the list.

# You can validate the following offer to had a match:
# "Développeur web freelance" by tim cook
# "developpeur Ruby/stimulus" by sebastien saunier

# and if you have added the frontend developper job to the jon lemon list the:
#  "Developpeur Javascript Frontend" offer by dominique patty

# To test the non display (or recrutor_status false in a match)
# "developpeur fullstack" by arnaud lagardere
# "Backend Developers" by tim cook

# ******************************************************************************
# Nettoyage de la DB

# Nettoyage des messages
Message.destroy_all
# Nettoyage des chatrooms
Chatroom.destroy_all
# Nettoyage des matches
Match.destroy_all
# Nettoyage des userjobs
UserJob.destroy_all
# Nettoyage des offres
Offer.destroy_all
# Nettoyage des userskill
UserSkill.destroy_all
# Nettoyage des skills
Skill.destroy_all
# Nettoyage des jobs
Job.destroy_all
# Nettoyage des users
User.destroy_all

# ********************************************

# Users :
# Recrutor creation
puts "creation des recruteurs"
saunier_sebastien = User.create(email: "sebastienSaunier@free.fr", password: "123456", first_name: "Sebastien",
                                last_name: "Saunier", city: "Paris", recrutor: true, gender: "homme",
                                birthdate: Date.new(1967, 8, 25), description: "Homme d'affaires, entrepreneur, business
                                angel, fondateur du groupe le wagon")
estrosi_christian = User.create(email: "christian.estrosi@nice.fr", password: "123456", first_name: "Christian",
                                last_name: "Estrosi", city: "Nice", recrutor: true, gender: "homme",
                                birthdate: Date.new(1955, 7, 1), description: "sportif motocycliste,
                                homme politique français, ancien président du conseil général des Alpes-Maritimes")
lagardere_arnaud = User.create(email: "arnaudlagardere@rich.org", password: "123456", first_name: "Arnaud",
                               last_name: "Lagardère", city: "Paris", recrutor: true, gender: "homme",
                               birthdate: Date.new(1961, 3, 18), description: "chef d'entreprise,
                               dirigeant du groupe Lagardère, éditeur, homme d'affaires")
cook_tim = User.create(email: "timcooking@apple.com", password: "123456", first_name: "Tim", last_name: "cook", city:
                       "Los Angeles", recrutor: true, gender: "homme", birthdate: Date.new(1960, 11, 1), description:
                       "chef d'entreprise, actuel directeur général (CEO) d'Apple. Robertsdale High School,
                       Université d'Auburn, Université Duke, Fuqua School of Business. Homme d'affaires, informaticien,
                       ingénieur.")
restaurant = User.create(email: "chezRobert@yahoo.com", password: "123456", first_name: "Robert", last_name: "Machin",
                         city: "Nice", recrutor: true, gender: "homme", birthdate: Date.new(1978, 9, 15), description:
                        "Restaurant de quartier, situé sous les arcades dans le vieux Nice, cuisinte traditionnelle et
                        familliale.")
dominique_paty = User.create(email: "Patydomi@gmail.fr", password: "123456", first_name: "dominique", last_name:
                            "du Paty de Clam", city: "Paris", recrutor: true, gender: "femme", birthdate:
                            Date.new(1960, 12, 22), description: "fondatrice du cabinet conseil et accompagnements
                            réseau H, entrepreneure et consultante formatrice en responsabilité sociétale des
                            entreprises (RSE). Chevalier de la Légion d'honneur.")
jobconnect = User.create(email: "jobconnect@gmail.fr", password: "123456", first_name: "job", last_name:
                            "connect", city: "Paris", recrutor: true, gender: "femme", birthdate:
                            Date.new(2014, 12, 1), description: "job connect est une entreprise qui vous met en
                            relation avec des recruteurs, nous cherchons les offres qui vous conviennent le mieux et
                            nous vous mettons en relation pour faciliter votre recherche !")

puts "recruteurs créés"
# Candidat creation
puts "creation des candidats"
lemon_jon = User.create(email: "jon.lemon@hotmail.com", password: "123456", first_name: "Jon",
                        last_name: "Lemon", city: "Nice", gender: "homme", birthdate: Date.new(1980, 12, 8),
                        description: "concepteur et goûteur de bière.")
catarina = User.create(email: "catarina@gmail.fr", password: "123456", first_name: "Catarina", last_name:
                       "Bellatchixtchix", city: "Nice", gender: "femme", birthdate: Date.new(1986, 10, 15),
                       description: "developpeuse d'application web et web mobile")
bot_test = User.create(email: "jobble@heroku.com", password: "123456", first_name: "bot", last_name: "test",
                       city: "computer", gender: "homme", description: "Bot de test pour envoyer le premier message")

puts "candidats créés"

# ********************************************************

# Job creation
puts "creation des jobs"

front_developper = Job.create(name: "developper web front-end")
back_developper = Job.create(name: "developper web back-end")
fullstack_developper = Job.create(name: "fullstack developper")
designer = Job.create(name: "web designer")
barista = Job.create(name: "barista")
analyst = Job.create(name: "analyste-système d'information")
affair_analyst = Job.create(name: "analyste d'affaire")
system_engineer = Job.create(name: "ingénieur système")
accounting = Job.create(name: "comptable")
jedi = Job.create(name: "maitre Jedi")
data_scientist = Job.create(name: "spécialiste des données")
data_engineer = Job.create(name: "ingénieur des données")
data_analyst = Job.create(name: "analyste de données")
human_ressources = Job.create(name: "ressources humaines")
optician = Job.create(name: "opticien")

puts "jobs créés"

# ******************************************************** , company_name:
# Offers creation
puts "creation des offres:"

file = URI.open('https://res.cloudinary.com/dn5lpurr4/image/upload/w_408,h_650,c_fill/v1642063175/development/Romain-Paillard-Boris-Paillard-Sebastien-Saunier-Le-Wagon_mz0kpl.jpg')
first_offer = Offer.new(title: "Developpeur front-end", description: "Vous connaissez les langages de programation
                        frontend tel que HTML, CSS, Javascript, vous êtes a même de maquetter vos projets, vous savez
                        gérer le design et la codification d'une page, vous êtes célibataire, nous avons un emploi qui
                        pourrait vous convenir !", location: "Paris", salary: 3_250, number_hour: 36,
                        employement_type: "cadre", contract_type: "CDD", company_name: "Le Wagon")
first_offer.photo.attach(io: file, filename: 'wagonteam.png', content_type: 'image/png')
first_offer.job = front_developper
first_offer.user = saunier_sebastien
first_offer.save!

puts "1"

invalid_file = URI.open('https://res.cloudinary.com/dn5lpurr4/image/upload/w_408,h_650,c_fill/v1642066099/development/job-connect-new-logo-1024x1024_pau5jc.png')
non_valid_offer = Offer.new(title: "Développeur React Front-end", description: "Tu rejoindras un collectif composé de 25
                            personnes dont 13 Développeurs. 1 à 4 développeurs sont dédiés à chaque projet remporté. Les
                            projets peuvent se construire en parallèle (moyenne de 4 à 6 projets/an). Evidemment, tu ne
                            seras jamais seul au début.", location: "Nice", salary: 1_800, number_hour: 40,
                            employement_type: "cadre", contract_type: "CDI", company_name: "Job connect")
non_valid_offer.photo.attach(io: invalid_file, filename: 'jobConnect.jpg', content_type: 'image/png')
non_valid_offer.job = back_developper
non_valid_offer.user = jobconnect
non_valid_offer.save!

puts "1.1"

invalid_file4 = URI.open('https://res.cloudinary.com/dn5lpurr4/image/upload/w_408,h_650,c_fill/v1642067586/development/Fachada_xqgljl.jpg')
non_valid_offer4 = Offer.new(title: "Développeur Back-end API", description: "Smood, acteur incontournable Suisse dans
                            le domaine de la FoodTech et du LastMileDelivery souhaite renforcer les équipes de son
                            centre IT via sa société JAMTECH. Smood offre un lien entre les restaurateurs et les clients
                            en organisant les livraisons des plats à domicile ou au bureau grâce à notre plateforme web
                            et nos applications mobiles.", location: "Nice", salary: 1_500, number_hour: 38,
                             employement_type: "cadre", contract_type: "CDI", company_name: "Job connect")
non_valid_offer4.photo.attach(io: invalid_file4, filename: 'jobConnect.jpg', content_type: 'image/png')
non_valid_offer4.job = back_developper
non_valid_offer4.user = jobconnect
non_valid_offer4.save!

puts "1.2"

file2 = URI.open('https://res.cloudinary.com/dn5lpurr4/image/upload/w_408,h_650,c_fill/v1641897767/development/800px-Christian_Estrosi_-_2017__2824778920307_29__28cropped_29_sxp3fo.jpg')
second_offer = Offer.new(title: "developpeur PHP/symfony", description: "Nous recherchons pour notre municipalité un
                         developpeur web qui maitrise le langage back-end afin d'améliorer les services de la ville.
                         Votre mission consistera a concevoir et mettre en place une base de donnée avec son interface
                         qui permettent de dématérialiser les archives de notre ville.", location: "Nice",
                         salary: 2_600, number_hour: 40, employement_type: "chef de projet", contract_type: "CDD",
                         company_name: "Ville de Nice")
second_offer.photo.attach(io: file2, filename: 'Estrosi.jpg', content_type: 'image/png')
second_offer.job = back_developper
second_offer.user = estrosi_christian
second_offer.save!

puts "2"

file3 = URI.open('https://res.cloudinary.com/dn5lpurr4/image/upload/w_408,h_650,c_fill/v1641898067/development/bar-robert_mmlkto.jpg')
third_offer = Offer.new(title: "barista", description: "dans une brasserie traditionnelle vous serez amené a préparer
                        les boissons chaudes pour nos clients, nous privilégions l'experience et le savoir-faire.",
                        salary: 1_600, number_hour: 40, employement_type: "service", contract_type: "CDD",
                        location: "Nice", company_name: "Restaurant chez Robert")
third_offer.photo.attach(io: file3, filename: 'Robert.jpg', content_type: 'image/png')
third_offer.job = barista
third_offer.user = restaurant
third_offer.save!

puts "3"

file4 = URI.open('https://res.cloudinary.com/dn5lpurr4/image/upload/w_408,h_650,c_fill/v1641898172/development/3535003-arnaud-lagardere-montee-des-marches-du-950x0-1_sfdmzl.jpg')
fourth_offer = Offer.new(title: "developpeur ruby", description: "Notre entreprise récemment installé sur la côte
                         recherche ses futurs collaborateurs, nous sommes a la recherche de developpeur web maitrisant
                         le langage ruby et le framework rails, vous devez être autonome et a même de travailler en
                         équipe. Des connaissances en Javascript sont un plus, le poste est ouvert a tout les profils.",
                         salary: 2_300, number_hour: 34, employement_type: "developpeur", contract_type: "CDI",
                         location: "Paris", company_name: "groupe Lagardère")
fourth_offer.photo.attach(io: file4, filename: 'Lagardere.jpg', content_type: 'image/png')
fourth_offer.job = affair_analyst
fourth_offer.user = lagardere_arnaud
fourth_offer.save!

puts "4"

file5 = URI.open('https://res.cloudinary.com/dn5lpurr4/image/upload/w_408,h_650,c_fill/v1641898239/development/648x360_arnaud-lagardere-a-paris-le-10-mai-2019_o8smu9.jpg')
fifth_offer = Offer.new(title: "developpeur fullstack", description: "Notre groupe recherche un développeur fullstack
                       pour la création de son site de vente en ligne. Vous aurez pour tâche de concevoir, créer et
                       mettre en ligne le site de vente pour notre marque et promouvoir l'image de celle-ci, nous
                       recherchons quelqu'un avec un minimum d'experience.", salary: 5_000, number_hour: 38,
                        employement_type: "salarié", contract_type: "CDI", location: "Nice", company_name: "groupe
                        Lagardère")
fifth_offer.photo.attach(io: file5, filename: 'Lagardere2.jpg', content_type: 'image/png')
fifth_offer.job = affair_analyst
fifth_offer.user = lagardere_arnaud
fifth_offer.save!

puts "5"

file6 = URI.open('https://res.cloudinary.com/dn5lpurr4/image/upload/w_408,h_650,c_fill/v1641898313/development/Nice_1_a0jly7.jpg')
sixth_offer = Offer.new(title: "graphiste web", description: "Nous recherchons actuellement un graphiste avec des
                        compétences de web-designer, capable de créer l'interface graphique et de dessiner les visuels.
                        Vous intégrerez une équipe où vous aiderez a la conception du design et a son intégration",
                        salary: 2_375, number_hour: 38, employement_type: "salarié", contract_type: "mission",
                        location: "Nice", company_name: "Ville de Nice")
sixth_offer.photo.attach(io: file6, filename: 'Nissa.jpg', content_type: 'image/png')
sixth_offer.job = designer
sixth_offer.user = estrosi_christian
sixth_offer.save!

puts "6"

file7 = URI.open('https://res.cloudinary.com/dn5lpurr4/image/upload/w_408,h_650,c_fill/v1642063029/development/sebastien_saunier_wbibow.jpg')
seventh_offer = Offer.new(title: "developpeur Ruby/stimulus", description: "Rejoignez notre équipe de développeur !
                          Vous maitriser les languages Ruby et stimulus ? Vous souhaitez améliorer vos connaissances
                          de ces languages au sein d'une équipe innovante et créative ? Nous avons peut-être une place
                          pour vous ! Au sein de nos équipes, développer vos talents et venez créer l'avenir. ",
                          salary: 2_900, number_hour: 35, employement_type: "salarié", contract_type: "CDI",
                          location: "Nice", company_name: "Le Wagon")
seventh_offer.photo.attach(io: file7, filename: 'Saunier.jpg', content_type: 'image/png')
seventh_offer.job = back_developper
seventh_offer.user = saunier_sebastien
seventh_offer.save!

puts "7"

file8 = URI.open('https://res.cloudinary.com/dn5lpurr4/image/upload/w_408,h_650,c_fill/v1641898637/development/tim_ksvdje.jpg')
eigth_offer = Offer.new(title: "Sauvez la princesse Leïa", description: "Nous avons besoin d'un Obi-Wan Kenobi, un
                        MAITRE (désolé Anakin) Jedi qui puisse être a même de nous aider a sauver l'empire galactique.
                        Vous devrez combattre les droïdes qui menacent l'empire et protéger la vie d'une jeune princesse
                        qui essaye de trouver une issue pacifique a la crise.",
                        salary: 0, number_hour: 168, employement_type: "style de vie", contract_type: "CDI",
                        location: "Coruscant", company_name: "Apple")
eigth_offer.photo.attach(io: file8, filename: 'Jedicook.jpg', content_type: 'image/png')
eigth_offer.job = jedi
eigth_offer.user = cook_tim
eigth_offer.save!

puts "8"

file9 = URI.open('https://res.cloudinary.com/dn5lpurr4/image/upload/w_408,h_650,c_fill/v1641898730/development/800px-Tim_Cook__282017_2C_cropped_29_sx4zqf.jpg')
nine_offer = Offer.new(title: "ingénieur système d'information", description: "Placé(e) sous l'autorité hiérarchique de
                       la Direction Générale, le ou la chargée de mission SI est membre de l'équipe du siège de
                       l'Association.Ses missions seront axées autour du déploiement de la démarche qualité associative
                       et des démarches projets qui émanent des établissements et services, mais aussi de l'Association.
                       Il assurera en particulier le pilotage des projets issus de la stratégie du Système d'Information
                       en lien avec l'amélioration de la qualité du service rendu par les établissements et services.
                       Missions liées à l'optimisation des processus métier et à la mise en oeuvre du logiciel dossier
                       unique de l'usager.", salary: 3_250, number_hour: 40, employement_type: "salarié", contract_type:
                       "CDI", location: "Dijon", company_name: "Apple")
nine_offer.photo.attach(io: file9, filename: 'Cook.jpg', content_type: 'image/png')
nine_offer.job = system_engineer
nine_offer.user = cook_tim
nine_offer.save!

puts "9"

file10 = URI.open('https://res.cloudinary.com/dn5lpurr4/image/upload/w_408,h_650,c_fill/v1641898703/development/Apple-CEO-Tim-Cook_pbjisn.jpg')
ten_offer = Offer.new(title: "Développeur web freelance", description: "OFFRE D'EMPLOI POUR PERSONNES INDÉPENDANTES
                      EXPERT(E) EN WEB MARKETING + copyrighting.
                      Pour développement d'un projet à long terme, si tu es une personne investi qui a du temps et
                      de l'expérience / résultat dans le domaine. J'attends TON e-mails ET j'espère que TU sauras mettre
                      en avant tes talents de copyrighteurs ", salary: 1_700, number_hour: 32,
                      employement_type: "salarié", contract_type: "CDD", location: "Californie", company_name: "Apple")
ten_offer.photo.attach(io: file10, filename: 'Cook$.jpg', content_type: 'image/png')
ten_offer.job = fullstack_developper
ten_offer.user = cook_tim
ten_offer.save!

puts "10"

file11 = URI.open('https://res.cloudinary.com/dn5lpurr4/image/upload/w_408,h_650,c_fill/v1641898806/development/image-99737--1679066_p53o4k.jpg')
eleven_offer = Offer.new(title: "Backend Developers", description: "Backend Developers for long-term
                        contract roles (remote roles for EU residents)Enjoy the full flexibility and freedom of working
                        remotely as a Backend developer focusing on your favourite languages with ambitious tech
                        companies around the world. About our positions:Teamway is the new community-led network for
                        tech professionals. We find incredible opportunities for talented professionals like you, who
                        prefer to work remotely in the tech industry.", salary: 2_400, number_hour: 40,
                         employement_type: "cadre", contract_type: "CDD", location: "France", company_name: "Apple")
eleven_offer.photo.attach(io: file11, filename: 'Cook2.jpg', content_type: 'image/png')
eleven_offer.job = back_developper
eleven_offer.user = cook_tim
eleven_offer.save!

puts "11"

file12 = URI.open('https://res.cloudinary.com/dn5lpurr4/image/upload/w_408,h_650,c_fill/v1641898891/development/1582205545497_jwtycz.jpg')
twelve_offer = Offer.new(title: "Developpeur Javascript Frontend", description: "Réseau H est un groupe de sociétés
                         innovantes qui exploitent les nouvelles technologies en plaçant le client au centre de toutes
                         ses démarches. Nous élaborons et proposons des solutions qui contribuent à l’éducation
                         financière de nos clients. Créée en 2011, d’une envie d’entreprendre et d’une volonté
                         d’améliorer le quotidien de chacun, nous comptons aujourd’hui 12 marques et sociétés regroupées
                         autour de 4 industries : le E-learning, l’Assurance, la Finance et l’Immobilier. Nous cherchons
                         donc un(e) Developpeur(se) Front End (H/F) de compétition, qui n’a pas peur de s’attaquer à
                         des défis variés et qui saura les relever avec brio.", salary: 1_900, number_hour: 35,
                         employement_type: "salarié", contract_type: "CDI", location: "Nice",
                         company_name: "Handiréseau")
twelve_offer.photo.attach(io: file12, filename: 'DuPaty.jpg', content_type: 'image/png')
twelve_offer.job = front_developper
twelve_offer.user = dominique_paty
twelve_offer.save!

puts "12"

file13 = URI.open('https://res.cloudinary.com/dn5lpurr4/image/upload/w_408,h_650,c_fill/v1641899080/development/la-salle-restaurant-robert_hpcpxu.jpg')
thirtenn_offer = Offer.new(title: "développeur fullstack javascript", description: "Afin de promouvoir notre image,
                          notre restaurant recherche actuellement un developpeur web fullstack connaissant les
                          technologies javascript et php afin de concevoir le design et l'intégralité de l'architecture
                          de notre future plate-forme de livraison en ligne.", salary: 1_800, number_hour: 40,
                           employement_type: "salarié", contract_type: "CDD", location: "Nice", company_name:
                           "Restaurant chez Robert")
thirtenn_offer.photo.attach(io: file13, filename: 'Robertrestau.jpg', content_type: 'image/png')
thirtenn_offer.job = fullstack_developper
thirtenn_offer.user = restaurant
thirtenn_offer.save!

puts "13"

file14 = URI.open('https://res.cloudinary.com/dn5lpurr4/image/upload/w_408,h_650,c_fill/v1641899166/development/dpa-tim-cook-apple-93891281.jpg_ow5ldz.jpg')
fourteen_offer = Offer.new(title: "UX designer", description: "Dans le cadre du développement de notre entreprise nous
                           recrutons actuellement deux web-designer avec de l'expèrience en user experience afin de
                           dinamyser nos équipes et de créer une identité graphique nouvelle propre a notre marque pour
                           le secteur de la France.", salary: 2_300, number_hour: 38, employement_type: "salarié",
                           contract_type: "CDI", location: "Marseille", company_name: "Apple")
fourteen_offer.photo.attach(io: file14, filename: 'CookOk.jpg', content_type: 'image/png')
fourteen_offer.job = designer
fourteen_offer.user = cook_tim
fourteen_offer.save!

puts "14"

puts "Offres créés"

# **************************************************
# Skills creation
puts "creation des compétences"

skill_html = Skill.create(name: "HTML5")
skill_css = Skill.create(name: "CSS3")
skill_javascript = Skill.create(name: "Javascript")
skill_ruby = Skill.create(name: "Ruby")
skill_php = Skill.create(name: "PHP7")
skill_sql = Skill.create(name: "sql")
skill_python = Skill.create(name: "Python")
skill_cafe = Skill.create(name: "Preparation de café")
skill_wireframe = Skill.create(name: "création de wireframe")
skill_english = Skill.create(name: "langue: Anglais")
skill_french = Skill.create(name: "langue: Français")
skill_spanish = Skill.create(name: "langue: Espagnol")
skill_italian = Skill.create(name: "langue: Italien")
skill_toshop = Skill.create(name: "Photoshop")
skill_figma = Skill.create(name: "Figma")
skill_office = Skill.create(name: "suite office")
skill_github = Skill.create(name: "Github")
skill_vente = Skill.create(name: "vente")
skill_communication = Skill.create(name: "contact client")
skill_gestion = Skill.create(name: "Gestion de stocks")
skill_ponctualite = Skill.create(name: "Ponctuel")
skill_jardin = Skill.create(name: "Entretien jardins")
skill_poney = Skill.create(name: "water-poney")

puts "compétences créés"

# ***********************************************
# user_jobs creation
puts "création des user_jobs"

third_job = UserJob.new(experience: 46)
third_job.user = catarina
third_job.job = designer
third_job.save!

puts "user_jobs créés"

# **********************************************
# matches creation
puts "création des matches"

second_match = Match.new(recrutor_status: false)
second_match.offer = fifth_offer
second_match.user = lemon_jon
second_match.save!

third_match = Match.new(recrutor_status: true)
third_match.offer = sixth_offer
third_match.user = catarina
third_match.save!

five_match = Match.new(recrutor_status: true)
five_match.offer = ten_offer
five_match.user = lemon_jon
five_match.save!

six_match = Match.new(recrutor_status: true)
six_match.offer = seventh_offer
six_match.user = lemon_jon
six_match.save!

seven_match = Match.new(recrutor_status: false)
seven_match.offer = eleven_offer
seven_match.user = lemon_jon
seven_match.save!

eight_match = Match.new(recrutor_status: true)
eight_match.offer = eigth_offer
eight_match.user = catarina
eight_match.save!

nine_match = Match.new(recrutor_status: true)
nine_match.offer = twelve_offer
nine_match.user = lemon_jon
nine_match.save!

puts 'matches créés'

# ********************************************
