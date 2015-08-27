# Theme [Chameleon](https://github.com/williamcanin/chameleon-theme-jekyll) Jekyll (Blog/Portfolio) Beta

![ScreenShot](https://raw.githubusercontent.com/williamcanin/chameleon-theme-jekyll/master/assets/images/preview/preview.png)

## Intro

**Chameleon Theme** is the theme for [Jekyll](http://jekyllrb.com) built especially for those who want to have a blog and a portfolio quickly, lightness and greater ability to customize of theme. Its base is made with [Twitter Bootstrap](http://getbootstrap.com), that gives you greater practicalities to open your page in a mobile device.

Using tools like GruntJS and Bower for their management and creating dependencies, development practitioners will find it easier to manipulate the **Chameleon Theme**.

The **Chameleon Theme** also uses the language [Ruby](https://www.ruby-lang.org) to perform Deploy on GitHub, with deployment options for source code and compiled project (folder: _build) to a branch of his choice on GitHub, change theme (colors), header creation of pages and posts and other functions. 

> You can change the structure of Chameleon Theme as you wish, provided they 
> do not manipulate the copyright of the project.

This project has the copyright to {[William C. Canin](http://github.com/williamcanin)} - (c) copyright 2015


## Requirements


| Prerequisite    | How to check 		 | How to install | Version required 
| --------------- | -------------------- | -------------- | ------------------ |
| Git             | `git --version`      | [Git](http://git-scm.com/) | >= 1.9.0 |
| Ruby            | `ruby -v`    		 | [Ruby](https://www.ruby-lang.org) | >= 1.9.3 |
| Gem             | `gem -v`             | **Ruby** contains **Gem** | >= 1.8.23 |
| Python          | `python --version`   | [Python](https://www.python.org/) | Optional |
| Node.js         | `node -v`    		 | [Nodejs](http://nodejs.org/) | Optional |
| Npm             | `npm --version`      | **It depends on O.S** | Optional |
| GruntJs         | `grunt --version`    | `npm install -g grunt grunt-cli` | Optional |
| Bower           | `bower -v`   		 | `npm install -g bower` | Optional |
| Bundler         | `bundler -v` 		 | `gem install bundler` | >= 1.9.5 |
| Rake            | `rake --version` 		 | `gem install bundler` | >= 10.3.|


For Windows users, you must install the DevKit and Pygments.
For more notes of the Dev Kit installation, see: [Devkit Install](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit#installation-instructions)

------

------

## Unloading, installing dependencies, compiling Chameleon Theme and start the server Jekyll.

* 1 - Perform unloading through the **Git**...

```
$ git clone https://github.com/williamcanin/chameleon-theme-jekyll.git
```

* 2 - ...and go to the folder:

```
$ cd chameleon-theme-jekyll
```

* 3 - Install Bundler:

```
 gem install bundler  
```

* 4 - Install dependences Bundler:

```
 bundle install
```

* 5 - Run the command to the dependencies and the compilation of **Chameleon Theme**:

```
$ rake make_install
```

* 6 - Compile Chameleon Theme:

```
$ grunt build
```

* 7 - Start server (with watch):

```
$ grunt spy
```

or

* 7.1 - Start server (normal):

```
$ grunt serve
```

## Deploy for GitHub

* 1 - Open the file **_config.yml**, and in the session **Configuration GitHub Deploy** fill in the details of your remote server on GitHub.

> Meaning of the variables in the session "Configuration GitHub Deploy".

* **project_name**: Your website name
* **first_last_name**: Your name and surname last
* **user_email**: Your email to set up Git
* **github_user**: Important !!! Your user [GitHub](http://github.com)
* **source_repository_project**: Repository to store the site's source code.
* **build_repository_project**: Repository to deploy your site built on GitHub. If you do not have one, create in your [New repository](https://help.github.com/articles/creating-a-new-repository/) and then create a branch with the name of `gh-pages` and make deploy this branch.
* **credential_cache_yesno**: Active cache credentials for Git.
* **credential_cache_type**: Kind of like the cache credentials will be stored locally or globally (local / global).
* **credential_cache_time**: How long the cached credentials will be stored (in seconds)
* **sshttps**: Use SSH (`git@github.com:`) or https ('https: // github.com / `) to configure the remote address in carrying out the deployment to GitHub. If you use SSH, create a ssh key and exports to GitHub.

* 2.1 - Run the following command to deploy of source code to github:
```
$ rake deploygit pull="n" type="source" branch="branch_where_this_code" messagecommit="First commit" [ENTER]
```

> Nota: Remember to inform the variable **source_repository_project** in
> `config.yml` file with the same directory name created on GitHub.

* 2.2 - If you want to make the deploy of the already compiled project, ie the folder **_build**, do: 

> Note: Remember to inform the variable **build_repository_project** in
> `Config.yml` file to the same directory name created on GitHub.
> Generally deploy the compiled site is done in the brach' gh-pages`.
> To learn how to host your website in the branch' gh-pages`, visit: 
> [GitHub Pages](https://pages.github.com/). 

Example:

```
$ rake deploygit pull="n" type="build" branch="branch_where_the_compiled_source" messagecommit="Commit build site" [ENTER]
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

### Responsive to dispositives mobile

![ScreenShot](https://raw.githubusercontent.com/williamcanin/chameleon-theme-jekyll/master/assets/images/preview/responsive-mobile.jpg)



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

* 1 - Uncomment function "image" and task "imgcompress" in "Gruntfile.js".
* 2 - Run command: `npm install grunt-image --save-dev`
* 3 - Run task: `grunt imgcompress`

**Custom Header**


The *Chameleon Theme* brings the opportunity for the user to insert an image or just a simple text on the main page. For this, the user will have to activate the variable **str_page_heading_text** or **str_page_heading_img** (according to your preference, image or text) in the file **_ config.yml**. If you prefer the image, put a picture in the *"assets/images/header"* and insert into the variable **str_page_heading_img** more extension of the image.

----

# Next Versions - Updates

| Date        | Version   | Accomplished update |  Type
| ----------- | ----------| --------------------|---------
| 2015/08/10  | 1.0.4     |  Yes                | Beta
| 2015/11/10  | 1.0.7     |  No                 | Beta
| 2016/02/10  | 2.0.0     |  No                 | Stable (Final)


## Issues

Be sure to get in touch.

Make their views on the Chameleon Theme, Issue on:

## [Leave your suggestions, compliments, criticisms or whatever suits you.](https://github.com/williamcanin/chameleon-theme-jekyll/issues/1)
