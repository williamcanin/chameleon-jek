# Date Lang Jekyll

"Data Lang Jekyll" is a plugin for templates in Jekyll in order to 
include the date (% m% d,% Y - with name of month extensive ) in 
Posts and Pages.

## Usage

* Step 1: Enter **_includes** folder of your template Jekyll and download the *Date Lang Jekyll*

```
cd /go/to/path/_includes
git clone https://github.com/williamcanin/date-lang-jekyll.git "date"
```

* Step 2 : Enter **date** folder

```
cd ./date
```

* Step 3: Setting the Date Lang Jekyll

After performing the clone *Date Lang Jekyll*, you must configure it with the script **"setup.sh"**.

**Generating content of languages**

The first configuration is to generate the contents of the language files as they are encoded using hexadecimal. For this, do:

```
$ ./setup.sh --init
```

**Choosing your language**

After generating the content of languages, *Date Lang Jekyll* will ask a question if you want to choose your language and keep only him.
You can cancel, however will keep all languages of *Date Lang Jekyll*.

You must choose the numbering. Below is an example of how you will return to your console:

| Column 1 | Column 2 | Column 3 | Column 4 | Column 5 |
|----------|----------|----------|----------|----------|
|1) ch_CH  | 3) en_US | 5) fr_FR | 7) ja_JP | 9) ru_RU |
|2) de_DE  | 4) es_ES | 6) it_IT | 8) pt_PT |10) Cancel|

**Setting variables for posts and pages**

By default, the variables of the posts and pages of *Date Lang Jekyll* is: 
**post** and **page**, but the * Date Lang Jekyll * has option to change the name of these variables posts and pages. 

*Questions:*

> As well as change the name of variables "posts" and "pages"?

R: When you create a list of posts on Jekyll for example, it requires a variable that esteje present in a loop (for) in Jekyll to store this list.

Example:

```
{% for posting in site.posts %}
   {{ posting.title }}
{% endfor %}  
```

Note that the loop (for) me will return a list of posts and will store in the variable **"posting"** and show the post title.

> But if my variable is **posting** and the default *Date Lang Jekyll* 
> is **post**, how do I change?

R:  To make this change of variables for posts and pages. Use the following command:

**Changing variable to posts**

```
$ bash ./setup.sh --post posting 
```

**Changing variable to pages**

```
$ bash ./setup.sh --page pages
```


* Step 4: Including plugin *Date Lang Jekyll*

Lets test?!

Jekyll in the template, insert the plug *Date Lang Jekyll* with the following line:

```
{% include date/lang/en_US/en_US.jk %}
```


## Demo 

See a demonstration of how the date will be:

[DEMO](http://williamcanin.com/date-lang-jekyll)


## License

[MIT License (MIT)](https://opensource.org/licenses/MIT)
