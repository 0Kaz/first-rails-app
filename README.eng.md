## Your first Rails App

Hello Wagoners ! :vulcan_salute:

You will find in this repo a complete recap of what we saw together during the lecture !:ok_hand: :technologist:	:woman_technologist:	


## What is a framework ? 

A framework is a set structure in which tasks are performed or completed. Software frameworks are designed to be universal, and reusable to provide functionality as part of a larger software platform, this then facilitates the development of software applications, products, and solutions to ease programmers life while working on projects.


## Ruby On Rails 


Ruby On Rails is a server-side opensource web framework written in Ruby, its an Model-view-controller framework providing a default structure for a database, web services and web pages.

David Heinemeier Hansson, created Ruby On Rails(RoR) back in 2004 after been inspired by Matz(Yukihiro Matsumoto A.K.A creator of Ruby) for the mere simplicity of how Ruby is written.

Rails was then created to prioritize conventions over configuration and a better environment for developers to code their web app projects emphasizing and following the two principles of CoC(Convention Over Configuration) and DRY(Don't Repeat Yourself)


For more information, check out our website @ le Wagon  : https://www.lewagon.com/blog/rails_doctrine or the official Rails website : https://rubyonrails.org/doctrine/ 


## Generate your first Rails app

We will start first by generating our first Rails project, but before that, we need to insist that Rails is a ```gem``` and it requires an installation before use.

```bash
gem install rails -v 6.0
``` 

After installing Rails, you can see which version of Rails you are using :

```bash 
rails --version
```
From now one, you can generate a rails project with this command below:

```bash
rails new first-rails-app --skip-active-storage --skip-action-mailbox
```

***-skip-active-storage and -skip-active-storage are called "flags", we will generate a simple project without using active-storage and action mailbox.(active storage) facilitates uploading files to a cloud storage service like Amazon S3, Google Cloud Storage, or Microsoft Azure Storage and attaching those files to Active Record objects, and (action mailbox) routes incoming emails to controller-like mailboxes for processing in Rails. It ships with ingresses for Mailgun, Mandrill, Postmark, and SendGrid***


## Git on rails

As you might have noticed, Git is already initiated by default after you generate your rails application. 


<p align="center">
  <img width="600" height="200" src="https://res.cloudinary.com/kzkjr/image/upload/v1635104715/blogging/Capture_d_e%CC%81cran_2021-10-24_a%CC%80_20.43.07_2.png">
</p>

All is left is to commit through git to start saving upcoming changes ```git add``` + ```git commit```  .

Although we don't have a Github repository created yet, we can now create our first repository on Github through our terminal without manually going through our Github account and create a repo :

```bash
hub create 
```

You can check if your Github repository is created with :

```bash
 first-rails-app git:(master) ✗ git remote -v
origin  git@github.com:votre-repo/first-rails-app.git (fetch)
origin  git@github.com:votre-repo/first-rails-app.git (push)
```

Let's start our first Rails app ! 
```bash
rails s
```

Let's click on the page to see what's cooking up in Rails :point_right:  http://localhost:3000  

## Ruby On Rails Files structure

Check out what Rails generated in our project folder :

<p align="center">
  <img width="200" height="400" src="https://res.cloudinary.com/kzkjr/image/upload/v1635104715/blogging/Capture_d_e%CC%81cran_2021-10-24_a%CC%80_20.40.58_2.png">
</p>

We will mostly work on the **app**,**db** and **config** folders during this week challenges and lectures.


## Rails controllers

Controllers provides 
Le contrôleur effectue différents traitements, communique ave les modèles et donne la main aux vues, l'une des exemples que nous avons citer durant le cours est que le contrôleur est toujour l'intermédiaire entre les modèles et les vues. Il met les données du modèle à la disposition de la vue pour qu'il puisse l'afficher aux utilisateurs et enregistrer/mettre à jour les données dans le modèle.


### Générer un contrôleur vide 

```bash
rails generate controller pages 
```

**Par convention, nous décrivons toujours les contrôleurs au pluriel ! On doit respecter les conventions de nommages sous Rails**


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

**Différence entre ```<%=%>``` et ```<% %>```**:

:clap:	<%= J'affiche du contenu sur html via ruby %>
:clap:  <% je calcule/compile du Ruby sans afficher le résultat sur ma page Html %>

```ruby
<p>Il est <%= Time.now %><p>
```

### BOUCLES

N'oubliez pas que Rails est initialement du Ruby, vous pouvez toujours utiliser les boucles vues durant vos premiers challenges Ruby au Wagon.

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

Il est toutefois inutile de stocker vos données dans la partie vue, chaque **contrôleur** est lié à sa **vue** par son **action**.

Par exemple : 
```ruby
class PagesController < ApplicationController 
    def index
    
    end

    def about 
    end

    def contact 
       #action
       @members = [ 'salma','loubna','yassine','assem','abdullah','amine','yassine','abdelhak']
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
 
Les liens hypertextes sur Rails sont beaucoup plus efficace que les tag html, celles-ci contiennent les routes paths.

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

### Params

Il est possible de communiquer des informations, données en passant de la vue au contrôleur grâce au params.

#### VUE
```ruby
<!-- app/views/pages/contact.html.erb -->

<h2>Meet our team</h2>
<ol>
  <% @members.each do |member| %>
    <li><%= member.capitalize %></li>
  <% end %>
</ol>

<form action="/contact" method="get">
    <input type="text" name="member" placeholder="Who are you looking for?">
    <input type="submit">
  </form>


<%= link_to "Index", root_path%>
```

#### CONTRÔLEUR
```ruby
class PagesController < ApplicationController
    def index
    end

    def about 
    end

    def contact 
        @members = [ 'salma','loubna','yassine','assem','abdullah','amine','yassine','abdelhak' ]
        puts "getting the params : #{params[:member]}"
    end
end

```

### Params Livecode 

```ruby
<!-- app/views/pages/contact.html.erb -->

<h2>Meet our team</h2>
<ol>
  <% @members.each do |member| %>
    <li><%= member.capitalize %></li>
  <% end %>
</ol>

<form action="/contact" method="get">
    <input type="text" name="member" placeholder="Who are you looking for?" value="<%=params[:member}%>">
    <input type="submit">
  </form>


<%= link_to "Index", root_path%>
```

```ruby

class PagesController < ApplicationController
    def index
    end

    def about 
    end

    def contact 
        @members = [ 'salma','loubna','yassine','assem','abdullah','amine','yassine' ]
        if params[:member]
            @members = @members.select { |member| member.start_with? (params[:member].downcase)}
        end
    end
end

```

Si vous vérifiez votre terminal qui lance le serveur Rails, vous verrez un résultat semblable à celui-ci :
```
Processing by PagesController#contact as HTML
  Parameters: {"member"=>"Omar"}
getting the params : Omar
```


GOOD LUCK WITH YOUR CHALLENGES ! :raised_hands:	:raised_hands:	

Écrit et édité par 0Kaz
