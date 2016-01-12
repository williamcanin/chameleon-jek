# File: Configs.rb
# Language: Ruby
# Country/State: Brazil/SP
# Author : William C. Canin <http://williamcanin.com>
# Description: Script config.rb for Deploy, change Theme , Create header Post and Page.

require 'yaml'
# require "rubygems"
# require 'rake'
# require 'time'
# require 'fileutils'
# require 'ostruct'

class Variables

  SOURCE = "."
  CONFIG = {
    'posts_blog' => File.join(SOURCE, "_posts/blog"),
    'posts_portfolio' => File.join(SOURCE, "_posts/portfolio"),
    'pages' => File.join(SOURCE, "_pages"),
    'theme_dir' => File.join(SOURCE, "/src/sass/layouts/themes/"),
    'markdown_ext' => "markdown"
  }

end



class Main < Variables

  def theme_confs(color)
    if color == 'green'
      system('sed -i \'s|^  fl_bgColor: .*|  fl_bgColor: "#2D4F25"|g\' _config.yml')
      system('sed -i \'s|^  fl_spinnerColor: .*|  fl_spinnerColor: "#fff"|g\' _config.yml')
    elsif color == 'blue'
      system('sed -i \'s|^  fl_bgColor: .*|  fl_bgColor: "#2D4F25"|g\' _config.yml')
      system('sed -i \'s|^  fl_spinnerColor: .*|  fl_spinnerColor: "#fff"|g\' _config.yml')
     elsif color == 'pink'
      system('sed -i \'s|^  fl_bgColor: .*|  fl_bgColor: "#BF589D"|g\' _config.yml')
      system('sed -i \'s|^  fl_spinnerColor: .*|  fl_spinnerColor: "#fff"|g\' _config.yml')
     elsif color == 'dark'
      system('sed -i \'s|^  fl_bgColor: .*|  fl_bgColor: "#000"|g\' _config.yml')
      system('sed -i \'s|^  fl_spinnerColor: .*|  fl_spinnerColor: "#fff"|g\' _config.yml')
     elsif color == 'orange'
      system('sed -i \'s|^  fl_bgColor: .*|  fl_bgColor: "#BD3F15"|g\' _config.yml')
      system('sed -i \'s|^  fl_spinnerColor: .*|  fl_spinnerColor: "#fff"|g\' _config.yml')
     elsif color == 'light'
      system('sed -i \'s|^  fl_bgColor: .*|  fl_bgColor: "#F1F1F1"|g\' _config.yml')
      system('sed -i \'s|^  fl_spinnerColor: .*|  fl_spinnerColor: "#333"|g\' _config.yml')
     elsif color == 'red'
      system('sed -i \'s|^  fl_bgColor: .*|  fl_bgColor: "#A9181A"|g\' _config.yml')
      system('sed -i \'s|^  fl_spinnerColor: .*|  fl_spinnerColor: "#fff"|g\' _config.yml')
     else
      puts
      puts ("\"Chameleon Jeky\" does not support this theme color.")
      puts ("Use: color={ green | blue | dark | red | orange | pink | light }")
      abort("rake aborted!")
    end

    if Dir.exists?(CONFIG['theme_dir'])
      f = File.new(CONFIG['theme_dir'] + "_config.scss", "w+")
      f.puts("$theme: \"#{color}\" !default;")
      system("printf \"\n$(tput setaf 76)✔ Succesfully! Chameleon Jek changed to color: $(tput sgr0)" + color +"\n\n\"")
    end
  end


  # Create post
  def post_create(category, dir_post)

    count_posts = Dir.glob(CONFIG['posts_blog']+"/*.*").size
    next_number_post = count_posts + 1

    # Variables for post/blog
    abort("rake aborted: '#{CONFIG['posts_blog']}' directory not found.") unless FileTest.directory?(CONFIG['posts_blog'])
    title = ENV["TITLE"] || "new-post"
    author = ENV["AUTHOR"] || "author-post"
    tags = ENV["TAGS"] || '["tag1","tag2"]'
    # article = ENV["ARTICLE"] || '#'
    article = next_number_post
    published = ENV["PUBLISHED"] || false
    comment = ENV["COMMENT"] || false





    # Variables for post/portfolio
    modal_id = ENV["MODAL_ID"] || ''

    slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    begin
      date_hour = (ENV['date'] ? Time.parse(ENV['date']) : Time.now).strftime('%Y-%m-%d %R:%S')
      date = (ENV['date'] ? Time.parse(ENV['date']) : Time.now).strftime('%Y-%m-%d')
    rescue => e
      puts "Error - date format must be YYYY-MM-DD, please check you typed it correctly!"
      exit -1
    end

    filepath = File.join("#{date}-#{slug}.#{CONFIG['markdown_ext']}")

    filename = File.join(CONFIG[dir_post], "#{date}-#{slug}.#{CONFIG['markdown_ext']}")

    if File.exist?(filename)
      abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
    end

  if category == 'blog'

    puts "Creating new post: #{filename}"
    open(filename, 'w') do |file|
      file.puts("---")
      file.puts("layout: post")
      file.puts("title: #{title.gsub(/-/,' ')}")
      file.puts("author: #{author}")
      # file.puts("#")
      # file.puts("# NOTE: Article must be in single quotation marks and start with # (hashtag)")
      # file.puts("# and then immediately the number of his post.")
      file.puts("article: '##{article}'")
      file.puts("published: #{published}")
      file.puts("comment: #{comment}")
      file.puts("cover: ")
      file.puts("filepath: #{filepath}")
      file.puts("date: #{date_hour}")
      file.puts("tags: #{tags}")
      file.puts("categories: #{category}")
      file.puts("# An introduction is mandatory !!!")
      file.puts("introduction: >")
      file.puts("   Informe a introdução aqui! Tell the introduction here!")
      file.puts("---")
    end
    puts
    puts "Created successfully!"
  elsif category == 'portfolio'
    puts "Creating new post: #{filename}"
    open(filename, 'w') do |file|
      file.puts("---")
      file.puts("layout: default")
      file.puts("title: #{title.gsub(/-/,' ')}")
      file.puts("author: #{author}")
      file.puts("modal_id: #{modal_id}")
      file.puts("date: #{date_hour}")
      file.puts("img: ")
      file.puts("project_date: ")
      file.puts("published: #{published}")
      file.puts("#")
      file.puts("# It is a project? Place the customer's address. ( \"yes\" | \"no\" )")
      file.puts("show_client: \"no\"")
      file.puts("name_client: ")
      file.puts("url_client: ")
      file.puts("# \"dimension_image\" is It is the image size: big, medium or small.")
      file.puts("dimension_image: ")
      file.puts("type: ")
      file.puts("categories: #{category}")
      file.puts("---")
    end
    puts
    puts "Created successfully!"
  else
    puts
    puts "Post not created."
    puts
  end

  end # Create post

  # Create page
  def page_create(category, dir_page)
    # system("rake gitignore")
    abort("rake aborted: '#{CONFIG['pages']}' directory not found.") unless FileTest.directory?(CONFIG['pages'])
    title = ENV["TITLE"] || "new-page"
    permalink = ENV["PERMALINK"] || "permalink-page"
    published = ENV["PUBLISHED"] || false
    categories = ENV["CATEGORIES"] || ""
    categories = "#{categories.gsub(/-/,' ')}" if !categories.empty?
    slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    begin
      date_hour = (ENV['date'] ? Time.parse(ENV['date']) : Time.now).strftime('%Y-%m-%d %R:%S')
      date = (ENV['date'] ? Time.parse(ENV['date']) : Time.now).strftime('%Y-%m-%d')
    rescue => e
      puts "Error - date format must be YYYY-MM-DD, please check you typed it correctly!"
      exit -1
    end
    filename = File.join(CONFIG[dir_page], "#{date}-#{slug}.#{CONFIG['markdown_ext']}")
    if File.exist?(filename)
      abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
    end

    puts "Creating new page: #{filename}"
    open(filename, 'w') do |file|
      file.puts("---")
      file.puts("layout: page")
      file.puts("title: #{title.gsub(/-/,' ')}")
      file.puts("date: #{date_hour}")
      file.puts("comment: ")
      file.puts("published: #{published}")
      file.puts("cover: ''")
      file.puts("permalink: /#{permalink}/")
      if category == 'normal'
        file.puts("categories: normal")
      elsif category == 'about'
        file.puts("categories: about")
      elsif category == 'project'
        file.puts("categories: project")
      elsif category == 'portfolio'
        file.puts("categories: portfolio")
      end
      file.puts "---"

      if category == "portfolio"
        file.puts ""
        file.puts "This is a page portfolio. For the menu, there's no need to write anything here."
      end

      puts
      puts "Created successfully!"
    end

  end # end Create page


  def insecure_world_writable
    # puts ("Set Insecure world writable ...")
    # system("sudo chown -R william:william .")
    # system("sudo chmod go-w -R .")
    # puts ("Set Insecure world writable. Done!")
  end

  # Deploy for GitHub
  #
  # Before using, do:
  # git init
  # git remote add [<options>] <name> <url>
  #
  def deploy(branch)
    branch_dev = ENV["BRANCH"] || "dev"
    if branch == "gh-pages"
      # Dependences plugin: gulp-gh-pages
      system('gulp javascripts')
      system('gulp stylesheets')
      # system('gulp url_deploy') # DISABLED
      system('sed -i \'s|^url: .*|url: "'+ $config_yml['site_url'] +'"|g\' _config.yml')
      system('sed -i \'s|^baseurl: .*|baseurl: "'+ $config_yml['site_baseurl'] +'"|g\' _config.yml')
      system('gulp clean')
      system('gulp jekyll-build')
      system('gulp copys')
      system('gulp htmlminify')
      system('gulp imageminify')
    # system('gulp clean') # DISABLED
    elsif branch == "master"
      system("git add .")
      system("git commit -m \"Deploy: $(date \"+%Y-%m-%dT%H:%M:%S\")\"")
      system('gulp imageminify')
      system("git push origin -u master")
    elsif branch == "dev"
      # To deploy in a different branch, use: $ rake deploy:dev BRANCH="your_branch"
      system("git branch -q -f #{branch_dev}")
      system("git checkout #{branch_dev}")
      system("git add .")
      system("git commit -m \"Deploy: $(date \"+%Y-%m-%dT%H:%M:%S\")\"")
      system('gulp imageminify')
      system("git push origin -u #{branch_dev}")
    else
      puts "[ Error in parameter 'branch']"
    end
  end # end Deploy for GitHub


  # Commands Gulp in Rakefile
  def gulp(task)
    if task == "dev"
      system("gulp dev")
    elsif task == "help"
      system("gulp")
    elsif task == "serve"
      insecure_world_writable
      system("gulp serve")
    elsif task == "jekyllbuild"
      system("gulp jekyll-build")
    elsif task == "imageminify"
      system("gulp imageminify")
    end
    puts
    puts "✔ Finished!"
  end


  def help
    system("src/lib/shell/rake/rake_help.lib")
  end

end # End Main