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
desc "Deploy for GitHub"
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
# Usage: rake theme color={ light | blue | pink | black | green | orange }
desc "Begin change theme - Usage: rake help"
task :theme do
  confs = Main.new
  confs.theme_confs
end # Task change theme

#"Usage: rake post TITLE='' AUTHOR='' ARTICLE='#number' PUBLISHED={true|false} COMMENT={true|false} TAGS=[tag1,tag2]
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

#"Usage: rake page CATEGORIES={ normal | projects | about }"
desc "Create new page Collapse - Usage: rake help"
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
desc "Commands Gulp"
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