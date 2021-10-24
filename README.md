## Votre première application Rails 

Salutation Wagoners ! 

Vous trouverez sur ce repo un recap en FR de la lecture qu'on a fait ensemble !


## Ruby On Rails 


Ruby On Rails est un framework web open-source écrit en Ruby, il propose une structure pré-configurer qui permet de développer rapidement votre application web, RoR vous apporte plus de fléxibilité et facilité pour programmer votre application web sans à le configurer à zéro ! 

David Heinemeier Hansson, le créateur de Ruby On Rails s'est inspirer de Matz ()  par la simplicité des syntaxes Ruby et déploiement des projets Ruby; il a donc créer Rails, un framework qui permet au développeur de gagner plus de temps sans à configurer leurs environments + structure de développement, Rails est prisé par tous les développeurs pour l'économie du temps à générer un projet sans oublier que s'est programmer sous Ruby.

Pour plus d'information sur la doctrine Rails, voici un article très intéressant sur note site du Wagon : https://www.lewagon.com/blog/rails_doctrine ou le site officiel de RoR via ce lien : https://rubyonrails.org/doctrine/ 


***Il n’y aurait pas de Rails sans Ruby, il est donc normal que le premier pilier doctrinal soit tiré de la motivation fondamentale qui a motivé la création de Ruby.*** *DHH* 

## Générer votre projet Rails 

Nous allons commencer tout d'abord par générer notre projet Rails mais avant tout, il faut savoir que Rails est un gem sur ruby et nécessite une installation sur votre machine. 

```bash
gem install rails -v 6.0
``` 

Suite à l'installation de rails, vous pouvez vérifier sous quelle version vous opérer via cette commande :

```bash 
rails --version
```

Désormais nous pouvons générer notre projet Rails en tapant cette commande sur le terminal : 

```bash
rails new first-rails-app --skip-active-storage --skip-action-mailbox
```

***-skip-active-storage et -skip-active-storage sont ce qu'on appelle des "flags", nous allons générer donc un projet sans utiliser du active-storage ou action mailbox, ce sont deux gems pré-installer sur ruby qui permettent (active storage) le rajout des images au cloud en utilisant des services tel que Amazon S3 ou Google Cloud, ainsi que (action mailbox) pour acheminer les services mailing via un controller tel que Mandrill, mailgun, postmark ou sendgrid  ***


## Git sur Rails

Comme vous l'avez déjà constater, le Git est initialiser par défaut après avoir générer votre première application Rails.

![https://res.cloudinary.com/kzkjr/image/upload/v1635104715/blogging/Capture_d_e%CC%81cran_2021-10-24_a%CC%80_20.43.07_2.png]


Autrement dit, il va falloir faire un premier ```git add``` + ```git commit``` sur votre terminal afin d'historiser vos push Git. 

Cependant, nous n'avons pas de repository sur notre github, au lieu d'aller en créer directement via votre compte, vous pouvez lancer cette commande sur votre terminal afin de créer un repository sur votre compte github sans passer par le site ! 

```bash
hub create 
```

Vous remarquerez donc sur votre compte Github qu'un repo a bien été créer ! 

Autre moyen de vérifier sa création via le terminal est d'écrire cette commande sur votre terminal :

```bash
 first-rails-app git:(master) ✗ git remote -v
origin  git@github.com:votre-repo/first-rails-app.git (fetch)
origin  git@github.com:votre-repo/first-rails-app.git (push)
```

Lançons donc notre application rails pour la première fois en tapant cette commande via le terminal ! 
```bash
rails s
```

Il ne vous reste plus qu'à ouvrir le lien du serveur rails ==>  http://localhost:3000  

### Architecture Ruby On rails 

Voyons un aperçu de la structure Rails

![https://res.cloudinary.com/kzkjr/image/upload/v1635104715/blogging/Capture_d_e%CC%81cran_2021-10-24_a%CC%80_20.40.58_2.png]

