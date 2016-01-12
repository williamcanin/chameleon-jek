# File: Rakefile
# Language: Ruby
# Country/State: Brazil/SP
# Author : William C. Canin <http://williamcanin.github.com>
# Page author: http://williamcanin.com
# Description: Script configuration Chameleon Jek.

require './src/lib/ruby/configs.rb'

task :load_config_yml do
  $config_yml = YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)), '_config.yml'))
end

# Deploy GitHub
#
# Before using, do:
# git init
# git remote add [<options>] <name> <url>
# # Dependences plugin: gulp-gh-pages
desc "Deploy for GitHub - Usage: rake help"
namespace :deploy do
  task :ghpages => [:load_config_yml] do
    config = Main.new
    config.deploy("gh-pages")
  end
  task :master => [:load_config_yml] do
    config = Main.new
    config.deploy("master")
  end # Task Deploy GitHub
  task :dev => [:load_config_yml] do
    # To deploy in a different branch, use: $ rake deploy:dev BRANCH="your_branch"
    config = Main.new
    config.deploy("dev")
  end
end

# Task change theme
desc "Change color theme"
namespace :theme do
  namespace :color do
    task :green  do
      config = Main.new
      config.theme_confs("green")
    end
    task :blue  do
      config = Main.new
      config.theme_confs("blue")
    end
    task :dark  do
      config = Main.new
      config.theme_confs("dark")
    end
    task :red  do
      config = Main.new
      config.theme_confs("red")
    end
    task :orange  do
      config = Main.new
      config.theme_confs("orange")
    end
    task :light  do
      config = Main.new
      config.theme_confs("light")
    end
    task :pink  do
      config = Main.new
      config.theme_confs("pink")
    end
  end
end



#Task create header Post
desc "Create new post (Blog|Portfolio) - Usage: rake help"
namespace :post do
  task :blog do
    confs = Main.new
    confs.post_create('blog','posts_blog')
  end
  task :portfolio do
    confs = Main.new
    confs.post_create('portfolio','posts_portfolio')
  end
end

#Task create header Page
desc "Create new page - Usage: rake help"
namespace :page do
  task :normal do
    confs = Main.new
    confs.page_create('normal','pages')
  end
  task :about do
    confs = Main.new
    confs.page_create('about','pages')
  end
  task :portfolio do
    confs = Main.new
    confs.page_create('portfolio','pages')
  end
end

 # Commands Gulp in Rakefile
desc "Commands Gulp - Usage: rake help"
namespace :gulp do
  task :dev do
    confs = Main.new
    confs.gulp("dev")
  end
  task :help do
    confs = Main.new
    confs.gulp("help")
  end
  task :serve do
    confs = Main.new
    confs.gulp("serve")
  end
  task :jekyllbuild do
    confs = Main.new
    confs.gulp("jekyllbuild")
  end
  task :imageminify do
    confs = Main.new
    confs.gulp("imageminify")
  end
end


# Generator MD5 Email of Gravatar
desc "Generator MD5 for email gravatar - Usage: rake help"
namespace :gravatar do
  task :md5 => [:load_config_yml] do
    confs = Main.new
    confs.generator_md5_gravatar_email('generator_md5')
  end
  task :clean do
    confs = Main.new
    confs.generator_md5_gravatar_email('clean')
  end
end


# Help
desc "Help"
task :help  do
  confs = Main.new
  confs.help
end


# Default configuration
def ask(message, valid_options)
  if valid_options
    answer = get_stdin("#{message} #{valid_options.to_s.gsub(/"/, '').gsub(/, /,'/')} ") while !valid_options.include?(answer)
  else
    answer = get_stdin(message)
  end
  answer
end

def get_stdin(message)
  print message
  STDIN.gets.chomp
end