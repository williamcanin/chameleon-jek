# Theme [Chameleon](https://github.com/williamcanin/chameleon-theme-jekyll) Jekyll (Blog/Portfolio)

Apresents:
![ScreenShot](https://raw.githubusercontent.com/williamcanin/chameleon-theme-jekyll/master/assets/images/preview/preview.png)

## Intro

Chameleon Theme, é o tema para [Jekyll](http://jekyllrb.com) construído especialmente para quem deseja ter um blog e um portfólio com rapidez e leveza e com maior possibilidade de customização em temas. Sua base é feita com [Twitter Bootstrap](http://getbootstrap.com), que lhe da maiores praticidades ao abrir sua página em um dispositivo Mobile.

Usando ferramentas como GruntJS e Bower para seu gerenciamento e criação de dependências, os praticantes de desenvolvimento terá maior facilidade em manipular o Chameleon Theme. 

O Chameleon Theme usa também a linguagem [Ruby](https://www.ruby-lang.org) para realização de Deploy no GitHub, com opções de deploy do código fonte e do projeto compilado (pasta _build_) para um ramo de sua escolha no GitHub, alteração do tema (cores), criação do cabeçalho das páginas e posts e outras mais funções. 

> Você pode alterar a estrutura do Chameleon Theme como desejar, desde que não manipule os direitos autorais do projeto.

Este projeto tem os direitos autorais para: [William C. Canin](http://github.com/williamcanin) - (c) copyright 2015


## Requirements

| Prerequisite    | How to check 		| How to install | Version requerited
| --------------- | ------------------- | -------------- | 
| Git             | `git --version`     | [Git](http://git-scm.com/) | >= 2.0.0 |
| Ruby            | `ruby -v`    		| [Ruby](https://www.ruby-lang.org) | >= 2.1.0 Z
| Gem             | `gem -v`            | **Ruby** contains **Gem** | >= 2.4.6 |
| Python          | `python --version`  | [Python](https://www.python.org/) |
| Node.js         | `node -v`    		| [Nodejs](http://nodejs.org/) |
| Npm             | `npm --version`     | **Nodejs** contains **Npm** |
| GruntJs         | `grunt --version`   | `npm install -g grunt grunt-cli` |
| Bower           | `bower -v`   		| `npm install -g bower` |
| Bundler         | `bundler -v` 		| `gem install bundler` |

For Windows users, you must install the DevKit and Pygments.
For more notes of the Dev Kit installation, see: [Devkit Install](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit#installation-instructions)

## Unloading, installing dependencies, compiling Chameleon Theme and start the server Jekyll.

* 1 - Perform unloading through the **Git**...

```
$ git clone https://github.com/williamcanin/chameleon-theme-jekyll.git
```

* 2 - ...and go to the folder:

```
$ cd chameleon-theme-jekyll
```

* 3 - Install Bandler:

```
# gem install bundler  
```

* 4 - Run the command to the dependencies and the compilation of **Chameleon Theme**:

```
$ rake make_install
```

* 5 - Run the following command to start the server **Jekyll** and your website run locally:

```
$ grunt serve
```

After the server is running, go to the address in your browser: **http://0.0.0.0:4000**

## Deploy for GitHub

* 1 - Open the file **_config.yml**, and in the session **Configuration GitHub Deploy** fill in the details of your remote server on GitHub.

> Significado das variáveis na sessão Configuration GitHub Deploy.

* **project_name**: Nome do seu website.
* **first_last_name**: Seu nome e ultimo sobrenome.
* **user_email**: Seu email para configurar o Git.
* **github_user**: Seu usuário do [GitHub](http://github.com)
* **source_repository_project**: Repositório para armazenar o código fonte do site.
* **build_repository_project**: Repositório para o deploy do seu site compilado no GitHub. Se não tiver um, crie em seu [GitHub](http://github.com) e em seguida crie um ramo com o nome de `gh-pages` e faça o deploy nesse ramo.
* **sshttps**: Utilize SSH(`git@github.com:`) ou Https(`https://github.com/`) para configurar o endereço remoto na realização do deploy para o GitHub. Se utilizar o SSH, crie uma chave ssh e exporta para o GitHub, para isso acesse: [Exportando SSH]().

* 2.1 - Run the following command to deploy of source code to github:
```
$ rake deploygit pull="n" type="source" branch="master" messagecommit="First commit"
```

> Nota: Lembre-se de informar a variável **source_repository_project** no 
> arquivo `config.yml` com o mesmo nome do diretório criado no GitHub.

* 2.2 - Caso queira realizar o deploy do projeto já compilado, ou seja, da pasta **_build**, faça: 

> Nota: Lembre-se de informar a variável **build_repository_project** no 
> arquivo `config.yml` com o mesmo nome do diretório criado no GitHub.
> Geralmente o deploy do site compilado é feito no ramo `gh-pages`.
> Para saber mais como hospedar seu website no ramo `gh-pages`, visite: [GitHub Pages]().

Exemplo:

```
$ rake deploygit pull="n" type="build" branch="gh-pages" messagecommit="Commit build site"
```

> Nota: The parameter "pull" is optional. If you "n", will be the deploy
> without performing the "pull" if put "s" before performing the "push", will
> be a "pull". For more information about all command **rake** in **
> Chameleon theme**, run the command: `rake help`



## Theme options:

Real chameleon... chameleon pure!. **Six** custom colors to please everyone.

Preview theme color:

![ScreenShot](https://raw.githubusercontent.com/williamcanin/chameleon-theme-jekyll/master/assets/images/preview/greentheme.png)

![ScreenShot](https://raw.githubusercontent.com/williamcanin/chameleon-theme-jekyll/master/assets/images/preview/orangetheme.png)

![ScreenShot](https://raw.githubusercontent.com/williamcanin/chameleon-theme-jekyll/master/assets/images/preview/bluetheme.png)

![ScreenShot](https://raw.githubusercontent.com/williamcanin/chameleon-theme-jekyll/master/assets/images/preview/blacktheme.png)

![ScreenShot](https://raw.githubusercontent.com/williamcanin/chameleon-theme-jekyll/master/assets/images/preview/pinktheme.png)

![ScreenShot](https://raw.githubusercontent.com/williamcanin/chameleon-theme-jekyll/master/assets/images/preview/lighttheme.png)


# DEMO 

| Subject                                         | link
| ----------------------------------------------- | ------------- |
| To watch the demo of "Chameleon theme", go to > |  [Demo](http://williamcanin.github.io/chameleon-theme-jekyll/) |


### As you can see, the "Chameleon Theme" has varieties of colors, and for use a color you like, use the following commands:

```
$ rake theme color={ green | orange | blue | black | pink | light } [ENTER]
$ grunt sass-build [ENTER]
```
> Example: $ rake theme color=blue [ENTER]

>Nota: For more information about all command **rake** in **Chameleon theme**, run the command: `rake help`

## Effects and configurations

The Chameleon theme, supports effects style settings, languages, and configurations of strings and social networking. To perform these settings,
set the file "**_config.yml**" in theme root, to your liking.The file **_config.yml** is self explanatory.

**Optimize Images**

To optimize the images of the portfolio and other, use an image optimization task in the "grunt".
Ex: [grunt-image](https://www.npmjs.com/package/grunt-image).

The Chameleon theme already has the "task" commented the file "Gruntfile.js", see the following:

* 1 - Uncomment tasks "image" in "Gruntfile.js".
* 2 - Run command: `npm install grunt-image --save-dev`
* 3 - Run task: `grunt imgcompress`

**Watch**

> 1 - Include the following script in your HTML in HEAD:

``` html
 <script src="http://localhost:35729/livereload.js"></script>
```

>      or

```html
     <script>document.write('<script src="http://' + (location.host || 'localhost').split(':')[0] + ':35729/livereload.js"></' + 'script>')</script>
```

>  2 - Install the extension of livereload in your browser: [Here](http://feedback.livereload.com/knowledgebase/articles/86242-how-do-i-install-and-use-the-browser-extensions-).

> 3 - Run the command: `grunt watch` and enable **Livereload** in your web browser.

**Custom Header**

On the theme **Chameleon** the opportunity for the user to customize the header by placing a banner image or just a simple text. For this, the user will have to enable the variable **str_page_heading_text** or **str_page_heading_img** (according to the choice you prefer, image or text) in **_config.yml** file.

# Tools used in the project

* Operating System: [Ubuntu](http://www.ubuntu.com/)
* Terminal: GNOME Terminal
* Image Editor: GIMP
* Text Editor: [Sublime Text 3](http://sublimetext.com/3)
* Vectoring: InkScape
* Based on [Twitter Bootstrap](http://getbootstrap.com)

