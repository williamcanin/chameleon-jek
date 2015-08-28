# File: Rakefile
# Language: Ruby
# Country/State: Brazil/SP
# Author : William C. Canin <http://williamcanin.github.com>
# Page author: http://williamcanin.com
# Description: Script for theme settings "Chameleon Jek".
# Manual tasks:
# * Deploy to GitHub Pages
# * Change the theme
# * Create a new post header
# To learn the commands of the manual tasks, use: rake help

require './libs/configs.rb'


# Task load file _config.yml
task :loadYML do
  $configyml = YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)), '_config.yml'))
end


# Task test
desc "Test"
   task :test => [:loadYML] do
    confs = Configs.new
    confs.test
end

# Task change theme
# Usage: rake theme color={ light | blue | pink | black }
desc "Begin change theme - Usage: rake help"
task :theme do
  confs = Configs.new
  confs.theme_confs
  # sh `grunt sass:build && jekyll b`
end # Task change theme

#"Usage: rake post TITLE=\"A ttitle\" AUTHOR=\"Your-Name\" ARTICLE=\"#Posting number\" PUBLISHED=\"false or true\" COMMENT=\"false or true\" FILE=\"file name\" TAGS=[tag1,tag2] CATEGORIES=blog or projects"
desc "Create new post - Usage: rake help"
task :post do
confs = Configs.new
confs.post_create
end # task :post

#"Usage: rake page TITLE=\"A ttitle\" CONTACT={ true | false } PERMALINK=Page1 CATEGORIES={ normal | projects | about }"
desc "Create new page - Usage: rake help"
task :page do
confs = Configs.new
confs.page_create
end # task :page

# Task Deploy GitHub
desc "Deploy for GitHub Pages - Usage: rake help"
task :deploygit => [:loadYML] do
config = Configs.new
config.gitignore
config.bowerrc
config.ftppass
config.jshintrc
config.deploygit
end # Task Deploy GitHub

# Task preinstall - Responsible for settings
task :preinstall do
    config = Configs.new
    config.bowerrc
    config.gitignore
    config.ftppass
    config.jshintrc
    cmd = "echo && echo \"Wait ...\""
    system(cmd)
end # Task preinstall - Responsible for settings


# Task postinstall Bower
task :postinstall do
  config = Configs.new
  config.inotify_watchers
  config.bower_dependences
end # Task postinstall Bower


# Task reset settings
task :reset do
config = Configs.new
config.gitignore
config.bowerrc
config.ftppass
config.jshintrc
# config.fonts_config
end
# Task reset settings

# Task install All
task :make_install do
config = Configs.new
config.make_install
end
# Task install All


# Task clean All
task :clean do
config = Configs.new
config.clean
end
# Task clean All

# Task help manual tasks
desc "Help: DeployGit, New post, New page, theme change...others."
task :help do
puts "------------------------------------------------------------"
puts "Function                               Command"
puts "------------------------------------------------------------"
puts "Compiling Chameleon theme:          rake make_install"
puts ""
puts "Cleaning compilation:               rake make_clean"
puts ""
puts "Change theme:                       rake theme color={ light | blue | pink | black | green | orange }"
puts ""
puts "Deploy project for GitHub Pages:    rake deploygit pull=\"{ y | n }\" type=\"{ source | build }\" branch=\"your_branch\" messagecommit=\"Your_message_commit\""
puts ""
puts "Create a new post (header):         rake post TITLE=\"\" AUTHOR=\"\" ARTICLE=\"#number\" PUBLISHED=\"\" COMMENT=\"\" FILE=\"\" TAGS=[tag1,tag2] CATEGORIES={ blog | projects }"
puts ""
puts "Create a new page (header):         rake page TITLE=\"A ttitle\" CONTACT={ true | false } COMMENT={ true | false } PERMALINK=Page1 CATEGORIES={ normal | projects | about }"
puts ""
end