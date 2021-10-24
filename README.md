## Votre première application Rails 

Salutation Wagoners ! :vulcan_salute:

Vous trouverez sur ce repo un recap en FR de la lecture qu'on a fait ensemble !:ok_hand: :technologist:	:woman_technologist:	



## C'est quoi un Framework ??

Un framework est un ensemble de composants de codes ou bibliothèque de fonctionnalités qui permet au développeur de piocher des fonctions qui sont au préalable pré-installer ou pré-configurer. L'utilisation d'un framework web ou mobile permet de gagner beaucoup de temps lors d'un démarrage d'un projet. 

De nos jours, les développeurs se spécialisent tous sur un ou plusieurs framework dépendemment de leurs besoins ou type de projets.


## Ruby On Rails 


Ruby On Rails est un framework web open-source écrit en Ruby, il propose une structure pré-configurer qui permet de développer rapidement votre application web, RoR vous apporte plus de fléxibilité et facilité pour programmer votre application web sans à le configurer à zéro ! 

David Heinemeier Hansson, le créateur de Ruby On Rails s'est inspirer de Matz (créateur de Ruby) pour la simplicité des syntaxes Ruby et déploiement des projets Ruby.

Il a donc créer Rails, un framework qui permet au développeur de gagner plus de temps sans à configurer leurs environments + structure de développement, Rails est prisé par tous les développeurs pour l'économie du temps à générer un projet sans oublier que s'est programmer sous Ruby.

Pour plus d'information sur la doctrine Rails, voici un article très intéressant sur note site du Wagon : https://www.lewagon.com/blog/rails_doctrine ou le site officiel de RoR via ce lien : https://rubyonrails.org/doctrine/ 


***>Il n’y aurait pas de Rails sans Ruby, il est donc normal que le premier pilier doctrinal soit tiré de la motivation fondamentale qui a motivé la création de Ruby.*** *DHH* 

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

<p align="center">
  <img width="600" height="200" src="https://res.cloudinary.com/kzkjr/image/upload/v1635104715/blogging/Capture_d_e%CC%81cran_2021-10-24_a%CC%80_20.43.07_2.png">
</p>
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

Il ne vous reste plus qu'à ouvrir le lien du serveur rails :point_right:  http://localhost:3000  

## Architecture Ruby On rails 

Voyons un aperçu de la structure Rails :

<p align="center">
  <img width="200" height="400" src="https://res.cloudinary.com/kzkjr/image/upload/v1635104715/blogging/Capture_d_e%CC%81cran_2021-10-24_a%CC%80_20.40.58_2.png">
</p>

Nous allons plus souvent à l'avenir travailler un peu plus sur les dossier **app**,**db** puis **config** que nous verrons un peu plus en profondeur durant votre semaine Rails 


## Les contrôleurs Rails 

Le contrôleur effectue différents traitements, communique ave les modèles et donne la main aux vues, l'une des exemples que nous avons citer durant le cours est que le contrôleur est toujour l'intermédiaire entre les modèles et les vues. Il met les données du modèle à la disposition de la vue pour qu'il puisse l'afficher aux utilisateurs et enregistrer/metà à jour les données dans le modèle.


### Générer un contrôleur vide 

```bash
rails generate controller pages 
```

**Par convention, nous décrivons toujours les contrôleurs au pluriel !**


```ruby
#/app/controllers/pages_controller.rb
class PagesController < ApplicationController
end

```

### Route

Les routes nous permettent tout simplement de décrire les itinéraires de chaque actions(méthodes) définie dans nos contrôleurs dans la vue.

Par exemple :

#### Routes
```ruby
#config/routes.rb
Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/homepage", to: "pages#index"
  get "/about", to: 'pages#about'
  get "/contact", to: "pages#contact"

  #verb #URI Pattern #controller_action
end
```

#### Root 

Il est possible de définir un itinéraire **root** 

```ruby
#config/routes.rb
Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  get "/about", to: 'pages#about'
  get "/contact", to: "pages#contact"

  #verb #URI Pattern #controller_action
end
```


#### Page controller

```ruby
#app/controllers/pages_controller.rb
class PagesController < ApplicationController
    def index
    end

    def about 
    end

    def contact 
    end
end
```

Comme vous l'avez pu remarquer sur le fichier ```routes.rb``` , les actions définies sur le contrôleurs **Pages** sont déclarés sur chaque route. 

Vous pouvez nommer vos pages après les **verb** comme bon vous semble, il est toutefois conseiller de leurs donner le même nom que leurs actions au contrôleur afin d'éviter des confusions.

Nous avons aussi créer 3 fichiers sur la vue du contrôleur Pages ci-dessous : 

<p align="center">
  <img width="200" height="400" src="https://res.cloudinary.com/kzkjr/image/upload/v1635108196/blogging/Capture_d_e%CC%81cran_2021-10-24_a%CC%80_21.31.02_2.png">
</p>


Vous pouvez être assister sur Rails pour connaitre les paginations configurer sur ```routes.rb``` en utilisant cette commande via le terminal : 

```bash
rails routes
  Prefix Verb URI Pattern         Controller#Action
homepage GET  /homepage(.:format) pages#index
   about GET  /about(.:format)    pages#about
 contact GET  /contact(.:format)  pages#contact

```

**Pour filter par nom d'actions sur le contrôleurs**

```bash
rails routes -g about
```

**Pour filtrer par contrôleurs**

```bash
rails routes -c pages
```

### Layout + View 

```ruby
# app/views/layouts/application.html.erb

<!DOCTYPE html>
<html>
  <head>
    <title>FirstRailsApp</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
  </head>

  <body>
    <%= yield %>
  </body>
</html>

```

### ERB 

L'ERB signifie Embedded Ruby, c'est une syntaxe qui vous permet d'écrire du ruby sous Html.

```ruby
<p>Il est <%= Time.now %><p>
```

### BOUCLES

N'oubliez pas que Rails est initialement du Ruby, vous pouvez utiliser tous les boucles vu durant vos premiers challenges Ruby au Wagon sur les vues ainsi que les contrôleurs.

```ruby
# app/views/pages/contact.html.erb

<% members = [ 'salma','loubna','yassine','assem','abdullah','amine','yassine' ] %>

<h2>Meet our team</h2>
<ol>
  <% members.each do |member| %>
    <li><%= member.capitalize %></li>
  <% end %>
</ol>
```

### INSTANCES DE VARIABLES SUR LE CONTROLEUR

Il est toutefois inutile de stocker vos données dans la partie vue, chaque **contrôleur** est lié à sa **vue** par ses **actions**.

Par exemple : 
```ruby
class PagesController < ApplicationController 
    def index
    
    end

    def about 
    end

    def contact 
       #action
       @members = [ 'salma','loubna','yassine','assem','abdullah','amine','yassine' ]
    end
end

```


```ruby
# app/views/pages/contact.html.erb
#view
<h2>Meet our team</h2>
<ol>
  <% members.each do |member| %>
    <li><%= member.capitalize %></li>
  <% end %>
</ol>
```


### Liens Hypertextes sur Rails 


```ruby
<%= link_to ANCHOR_TEXT, ANCHOR_URL %>
```



```ruby
<%= link_to "About", about_path%>
<%= link_to "Contact", contact_path%>

```

```ruby
<%= link_to "Index", root_path%>
```

Ecrit et éditer par 0kaz