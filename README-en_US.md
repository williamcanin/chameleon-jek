[Leia em português - Brasil](https://github.com/williamcanin/chameleon-jek/blob/dev/README.md)

# Chameleon Jek - Blog & Portfolio for Jekyll <img src="https://raw.githubusercontent.com/williamcanin/chameleon-jek/dev/assets/images/avatar/out.png" alt="Chameleon Jek Logotype" width="7%" height="7%"/>

<p align="center">
  <img src="https://raw.githubusercontent.com/williamcanin/chameleon-jek/dev/assets/images/preview/cj-logo.png" alt="Chameleon Jek Logotype" width="500px" height="55%"/>
</p>

## Index

* [Introduction](https://github.com/williamcanin/chameleon-jek/blob/dev/README-en_US.md#introduction)
* [Requirements](https://github.com/williamcanin/chameleon-jek/blob/dev/README-en_US.md#requirements)
* [Using - Linux](https://github.com/williamcanin/chameleon-jek/tree/dev#)
* [Using - Windows ou Mac OS X](https://github.com/williamcanin/chameleon-jek/blob/dev/README-PtBr.md#)
* [Settings Chameleon Jek]()
* [Deploy - GitHub]()
* [Demo]()
* [Issues](https://github.com/williamcanin/chameleon-jek/tree/dev#issues)
* [Versions](https://github.com/williamcanin/chameleon-jek/tree/dev#versions)
* [License & Copyright]()
* [Credits](https://github.com/williamcanin/chameleon-jek/tree/dev#credits)


## Introduction

**Chameleon Jek**, it is the template for [Jekyll](http://jekyllrb.com) built especially for those who want a blog and a portfolio with speed, lightness and greater ability to customize color.

The **Chameleon Jek** it has seven (7) different colors to customize:

[![Demo Chameleon Jeky Colors](https://raw.githubusercontent.com/williamcanin/chameleon-jek/dev/assets/images/preview/animation-no-border.gif)](https://raw.githubusercontent.com/williamcanin/chameleon-jek/dev/assets/images/preview/demo-colors.gif)

**Chameleon Jek** use [Twitter Bootstrap](http://getbootstrap.com), that gives you greater practicalities when you open your page in a mobile device in responsive mode.

Using tools like Gulp, Bower and Rake for your management, creating dependencies, and configuration **Chameleon Jek**, users and development practitioners, will find it easier to handle your project. 

The **Chameleon Jek** does deploy the compiled code (folder gh-pages) GitHub for the branch "gh-pages". Also deploys the branch "master". If the user wants to implement as **Chameleon Jek**, it is also possible to deploy for a branch of development (dev). 

These and other features, they are present through the Rakefile.
To learn which commands the **Chameleon Jek** boasts, run:

```
$ rake help
```

## Requirements

| Required        | Checking            | How to install  |
| --------------- | ------------------- | -------------- | 
| Git             | `git --version`     | [Git](http://git-scm.com/) |
| Ruby            | `ruby -v`           | [Ruby](https://www.ruby-lang.org) |
| Gem             | `gem -v`            | **Ruby** contains **Gem** |
| Python          | `python --version`  | [Python](https://www.python.org/) |
| NodeJS          | `node -v`           | [Nodejs](http://nodejs.org/) |
| Npm             | `npm --version`     | **Nodejs** contains **Npm** |
| Gulp            | `gulp -v`           | `npm install -g gulp` |
| Bower           | `bower -v`          | `npm install -g bower` |
| Bundler         | `bundler -v`        | `gem install bundler` |


## Using

### Users Linux

If you are Linux user, You will find it easier to install **Chameleon Jek** and all dependencies of the same. The least you need to have installed on your Linux machine is [Git for Linux](https://git-scm.com/download/linux).

With the installed Git, follow the steps below:

* 1 - Make Clone **Chameleon Jek** and enter the same folder:

```
$ git clone https://github.com/williamcanin/chameleon-jek.git "chameleon-jek"
$ cd "chameleon-jek"
```

* - 2 - Now, simply run the three (3) following commands (neatly):

> NOTE: Wait for the end of each command!


```
# bash linux.sh requirements
$ bash linux.sh init
$ bash linux.sh install
```

**Important Questions:**

*What the above commands do?*

The first command: Must be run as root (superuser). He is responsible for installing the requirements (table above) required to run a Jekyll project.

The second command: Must be run with normal user, **NOT** root.
He is responsible for setting up the RubyGems environment for the local user  PATH and add to the Gems will be installed with the third command.

The third command: Must be run with normal user, **NOT** root.
It is the final drive, which will install the Gems necessary for **Chameleon Jek**, dependencies (Bower), the compression and minification "stylesheets" and "javascripts", and compilation of **Chameleon Jek**. 

> NOTE: After running the three (3) above command, o script "linux.sh" the
> script "linux.sh" will be blocked, preventing user executes the commands 
> again. IF YOU WANT TO EXECUTE THE CONTROLS AGAIN, EXECUTE COMMAND 
> "$ bash linux.sh reconfigure" TO UNLOCK.

* 3 - Starting Jekyll server (with Livereload) in **Chameleon Jek**:

```
$ rake gulp:serve
```

### Users Windows and Mac OS X

The least you need to have installed on your Windows or Mac OS X machine is Git.

[Git - Windows](https://git-scm.com/download/win)

[Git - Mac OS X](https://git-scm.com/download/mac)

With Git installed, follow the steps below:

> IMPORTANT!: It is recommended to use the terminal Git on Windows, for the 
> Git contains Linux programs, such as 'sed', 'cat', ...etc, that are required
> for handling **Chameleon Jek**.

* 1 - Make Clone **Chameleon Jek** and enter the same folder:

```
$ git clone https://github.com/williamcanin/chameleon-jek.git "chameleon-jek"
$ cd "chameleon-jek"
```

* 2 - For Windows and Mac OS X users, there is no configurator and installer script for **Chameleon Jek**. Users will have to manually install the applications (requirements table top) according to installers of Operating System.

After installing the applications, continue with the steps below:

* 3 - Installing Bundler:

```
$ gem install bundler  
```

* 4 - Installing "Gems" necessary for **Chameleon Jek**:

```
$ bundle install
```

* 5 - Installing dependencies (Bower), compressing and minificando "stylesheets" and "javascript", and compiling **Chameleon Jek**:

```
$ npm install
```

* 6 - Starting Jekyll server (with Livereload) at the **Chameleon Jek**:

```
$ rake gulp:serve
```

## Configurations

**Text**

The text settings are on file **"_config.yml"**. 

This file is divided into two sections containing variables, where the values are implemented in the template **Chameleon Jek**. These sections are:

* *SECTION CONFIG PUBLIC*: In this section you should set the value of each of these variables according to your need.
* *SECTION CONFIG PRIVATE*: In this section you will **NOT** must change any variable (except you know what you're doing). This section contains variables that will be handled by **Chameleon Jek**, making a change without knowing, you may see errors or take the performace of **Chameleon Jek**.

> IMPORTANT: Do not modify the place of variables in any of the sections.

**Appearance color**

Color settings in the appearance of **Chameleon Jek**, it is applied by Rake command.

To change the color of the **Chameleon Jek**, do it:

Example:

```
$ rake theme:color:dark
```

Use `$ rake help` and see how it applies other than colors.



## Deploy - GitHub

With **Chameleon Jek** you can deploy to GitHub with only a command line. Follow the steps below:

* 1 - Preparing deploy environment.
 
Before you deploy, enter the folder **Chameleon Jek** and remove the folder **".git"** which was generated by the clone  **Chameleon Jek**.

[ If you do not know to serve the folder ".git", read more about the Git [Here](https://git-scm.com/book/en/v1) ]

* 2 - Start a new environment for Git with the command:

```
$ git init
```


* 3 - Add the remote address of your repository on GitHub. Example:

```
$ git add remote origin <url do repositório>
```


* 4 - Now your  **Chameleon Jek** is ready to be sent to your repository on GitHub.

Let us understand but which deploy resources that the **Chameleon Jek** boasts:

-> The deploy feature **Chameleon Jek**, are three (3) types of branch:

* master
* dev
* gh-pages

* 4.1 - To deploy to the **master** branch, use the command:

```
$ rake deploy:master
```

* 4.2 - To deploy to the **dev** branch, use the command:

```
$ rake deploy:dev
```

*If you want to use a different name instead of **dev**, use the command:*

```
$ rake deploy:dev BRANCH="name_branch"
```

> NOTE: This branch **dev** (development) it is especially to develop 
> project in order to make a *merge* future in the branch **master**.

* 4.3 - To deploy to the **gh-pages** branch, use the command:

```
$ rake deploy:ghpages
```

The branch **gh-pages** it is a branch in which your site will be visible, so, longer be possible to see the **Chameleon Jek** work through the web browser 
(with the address of your GitHub Pages, of course :)). 

## DEMO 

See a demonstration of how the  **Chameleon Jek** will behave in the browser.

[Chameleon Jek- Demo](http://williamcanin.github.io/chameleon-jek/)

## Issues

Make your views on the **Chameleon Jek**, in:

## [Leave your suggestions, compliments, criticisms or whatever suits you.](https://github.com/williamcanin/chameleon-jek/issues/1)

## Versions

| Launch    | Version   | Held update? |  Type version
| --------------| ----------| --------------------|---------
| 2015/08/10    | 1.0.4     |  Yes                | Beta
| 2016/01/15    | 1.0.7     |  Yes                | Stable


## License & Copyright

License: [MIT License (MIT)](https://opensource.org/licenses/MIT)

William C. Canin | © Copyright 2015 - 2016

*You can change the structure of Chameleon Jek as you wish, provided they do not manipulate the copyrights of William C.Canin the project*

## CREDITS:

* Name: William C. Canin 
* Country: Brazil - SP
* EMail: william.costa.canin@gmail.com    
* GitHub: [williamcanin](http://github.com/williamcanin)
* Home page: [http://williamcanin.com](http://williamcanin.com)

---

[Voltar para topo](https://github.com/williamcanin/chameleon-jek/blob/dev/README-en_US.md)