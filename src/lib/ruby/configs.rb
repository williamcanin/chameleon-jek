# File: Configs.rb
# Language: Ruby
# Country/State: Brazil/SP
# Author : William C. Canin <http://williamcanin.com>
# Description: Script config.rb for Deploy, change Theme , Create header Post and Page.

require 'yaml'
require 'digest/md5'
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
    'theme_dir' => File.join(SOURCE, "/src/scss/base/variables/to_color/"),
    'markdown_ext' => "markdown"
  }

end

class Main < Variables

  def theme_confs(color)
    if color == 'green'
      system('sed -i \'s|^  fl_bgColor: .*|  fl_bgColor: "#2D4F25"|g\' _config.yml')
      system('sed -i \'s|^  fl_spinnerColor: .*|  fl_spinnerColor: "#fff"|g\' _config.yml')
      system('sed -i \'s|^navbar_collapse_icon: .*|navbar_collapse_icon: "nav-icon-white.svg"|g\' _config.yml')
    elsif color == 'blue'
      system('sed -i \'s|^  fl_bgColor: .*|  fl_bgColor: "#414950"|g\' _config.yml')
      system('sed -i \'s|^  fl_spinnerColor: .*|  fl_spinnerColor: "#fff"|g\' _config.yml')
      system('sed -i \'s|^navbar_collapse_icon: .*|navbar_collapse_icon: "nav-icon-white.svg"|g\' _config.yml')
     elsif color == 'pink'
      system('sed -i \'s|^  fl_bgColor: .*|  fl_bgColor: "#BF589D"|g\' _config.yml')
      system('sed -i \'s|^  fl_spinnerColor: .*|  fl_spinnerColor: "#fff"|g\' _config.yml')
      system('sed -i \'s|^navbar_collapse_icon: .*|navbar_collapse_icon: "nav-icon-white.svg"|g\' _config.yml')
     elsif color == 'dark'
      system('sed -i \'s|^  fl_bgColor: .*|  fl_bgColor: "#000"|g\' _config.yml')
      system('sed -i \'s|^  fl_spinnerColor: .*|  fl_spinnerColor: "#fff"|g\' _config.yml')
      system('sed -i \'s|^navbar_collapse_icon: .*|navbar_collapse_icon: "nav-icon-white.svg"|g\' _config.yml')
     elsif color == 'orange'
      system('sed -i \'s|^  fl_bgColor: .*|  fl_bgColor: "#BD3F15"|g\' _config.yml')
      system('sed -i \'s|^  fl_spinnerColor: .*|  fl_spinnerColor: "#fff"|g\' _config.yml')
      system('sed -i \'s|^navbar_collapse_icon: .*|navbar_collapse_icon: "nav-icon-white.svg"|g\' _config.yml')
     elsif color == 'light'
      system('sed -i \'s|^  fl_bgColor: .*|  fl_bgColor: "#F1F1F1"|g\' _config.yml')
      system('sed -i \'s|^  fl_spinnerColor: .*|  fl_spinnerColor: "#333"|g\' _config.yml')
      system('sed -i \'s|^navbar_collapse_icon: .*|navbar_collapse_icon: "nav-icon-dark.svg"|g\' _config.yml')
     elsif color == 'red'
      system('sed -i \'s|^  fl_bgColor: .*|  fl_bgColor: "#A9181A"|g\' _config.yml')
      system('sed -i \'s|^  fl_spinnerColor: .*|  fl_spinnerColor: "#fff"|g\' _config.yml')
      system('sed -i \'s|^navbar_collapse_icon: .*|navbar_collapse_icon: "nav-icon-white.svg"|g\' _config.yml')
    elsif color == 'white'
      system('sed -i \'s|^  fl_bgColor: .*|  fl_bgColor: "#FFF"|g\' _config.yml')
      system('sed -i \'s|^  fl_spinnerColor: .*|  fl_spinnerColor: "#333"|g\' _config.yml')
      system('sed -i \'s|^navbar_collapse_icon: .*|navbar_collapse_icon: "nav-icon-dark.svg"|g\' _config.yml')
     else
      puts
      puts ("\"Chameleon Jeky\" does not support this theme color.")
      puts ("Use: color={ green | blue | dark | red | orange | pink | light | white }")
      abort("rake aborted!")
    end

    if Dir.exists?(CONFIG['theme_dir'])
      f = File.new(CONFIG['theme_dir'] + "_set.scss", "w+")
      f.puts("$to_color: \"#{color}\" !default;")
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


  # Generator MD5 Email of Gravatar
  def generator_md5_gravatar_email(action)
    if action == 'generator_md5'
      email = $config_yml['email_gravatar']
      if email.empty?
        system('sed -i \'s|^gravatar_md5:.*|gravatar_md5: |g\' _config.yml')
        puts "The Email gravatar is empty in 'config.yml'"
      else
        email_md5 = Digest::MD5.hexdigest(email)
        system('sed -i \'s|^gravatar_md5:.*|gravatar_md5: "'+ email_md5 +'"|g\' _config.yml')
        puts "Email: #{email}"
        puts "MD5: #{email_md5}"
        puts "Done!"
      end
    elsif action == 'clean'
      system('sed -i \'s|^gravatar_md5:.*|gravatar_md5: |g\' _config.yml')
      puts "Clean. Done!"
    else
      puts "Error"
    end

  end
  # Generator MD5 Email of Gravatar


  # Create page
  def page_create(type, dir_page)
    # system("rake gitignore")
    abort("rake aborted: '#{CONFIG['pages']}' directory not found.") unless FileTest.directory?(CONFIG['pages'])
    title = ENV["TITLE"] || "new-page"
    permalink = ENV["PERMALINK"] || "permalink-page"
    if type == 'thanks'
      permalink_thanks = $config_yml['permalink_thanks_formspree']
    end
    published = ENV["PUBLISHED"] || false
    comment = ENV["COMMENT"] || false
    inmenu = ENV["INMENU"] || 'false'
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
      if type == 'normal'
        file.puts("layout: page")
      elsif type == 'about'
        file.puts("layout: about")
      elsif type == 'portfolio'
        file.puts("layout: portfolio")
      elsif type == 'contact'
        file.puts("layout: contact")
      elsif type == 'thanks'
        file.puts("layout: thanks")
      end
      file.puts("title: #{title.gsub(/-/,' ')}")
      file.puts("date: #{date_hour}")
      file.puts("inmenu: '#{inmenu}'")
      if type == 'portfolio'
        file.puts("comment: #{comment}")
      end
      file.puts("published: #{published}")
      file.puts("cover: ")
      if type == 'thanks'
        file.puts("permalink: #{permalink_thanks}")
      else
        file.puts("permalink: /#{permalink}/")
      end

      file.puts "---"
      if type == "portfolio"
        file.puts ""
        file.puts "This is a page portfolio. For the menu, there's no need to write anything here."
      end

      puts
      puts "Created successfully!"
    end

  end # end Create page


  def insecure_world_writable
    puts ("Set Insecure world writable ...")
    system("sudo chown -R william:william .")
    system("sudo chmod go-w -R .")
    puts ("Set Insecure world writable. Done!")
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
      system('gulp imageminify')
      # Obsolete
      #
      # system('gulp url_deploy')
      #
      # Obsolete
      system('sed -i \'s|^url: .*|url: "'+ $config_yml['site_url'] +'"|g\' _config.yml')
      system('sed -i \'s|^baseurl: .*|baseurl: "'+ $config_yml['site_baseurl'] +'"|g\' _config.yml')
      system('gulp clean')
      system('gulp jekyll-build')
      # Obsolete
      #
      # system('gulp copys')
      # system('gulp htmlminify')
      #
      # Obsolete
      system('gulp deploy')
    # system('gulp clean') # DISABLED
    elsif branch == "master"
      system('gulp imageminify')
      system("git add .")
      system("git commit -m \"Deploy: $(date \"+%Y-%m-%dT%H:%M:%S\")\"")
      system("git push origin -u master")
    elsif branch == "dev"
      # To deploy in a different branch, use: $ rake deploy:dev BRANCH="your_branch"
      system('gulp imageminify')
      system("git branch -q -f #{branch_dev}")
      system("git checkout #{branch_dev}")
      system("git add .")
      system("git commit -m \"Deploy: $(date \"+%Y-%m-%dT%H:%M:%S\")\"")
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
      # insecure_world_writable
      system("gulp serve")
    elsif task == "jekyllbuild"
      system("gulp jekyll-build")
    elsif task == "imageminify"
      system("gulp imageminify")
    end
    puts
    puts "✔ Finished!"
  end

# Maintenance Page / Or not
  def maintenance_enable_disable(status)
    if status == 'enable'
      system("bash src/lib/shell/rake/under_maintenance.lib enable")
      system('sed -i \'s|^under_maintenance: .*|under_maintenance: "yes"|g\' _config.yml')
    elsif status == 'disable'
      system("bash src/lib/shell/rake/under_maintenance.lib disable")
      system('sed -i \'s|^under_maintenance: .*|under_maintenance: "no"|g\' _config.yml')
    else
      puts "Error parameter 'maintenance_enable_disable'"
    end
  end


  def help
    system("bash src/lib/shell/rake/rake_help.lib")
  end

end # End Main