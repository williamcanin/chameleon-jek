# File: Configs.rb
# Language: Ruby
# Country/State: Brazil/SP
# Author : William C. Canin <http://williamcanin.com>
# Description: Script config for "Chameleon Jek".

# Do not change this file #


require "rubygems"
require 'rake'
require 'yaml'
require 'time'
require 'fileutils'
require 'ostruct'

class Variables

  SOURCE = "."
  CONFIG = {
    'posts' => File.join(SOURCE, "_posts/blog"),
    'pages' => File.join(SOURCE, "pages"),
    'fonts_dir' => File.join(SOURCE, "/assets/fonts"),
    'theme_dir' => File.join(SOURCE, "/assets/sass/layouts/themes/"),
    'bower_dir' => File.join(SOURCE,"/assets/vendor"),
    'build_dir' => File.join(SOURCE,"/_build"),
    'fonts_awesome_dir' => File.join(SOURCE, "/assets/vendor/font-awesome-custom/fonts/font-awesome"),
    'fonts_bootstrap_dir' => File.join(SOURCE, "/assets/vendor/bootstrap-sass/assets/fonts/bootstrap"),
    'fonts_raleway_dir' => File.join(SOURCE, "/assets/vendor/fonts-raleway/fonts/fonts-raleway"),
    'bowerrc' => File.join(SOURCE, "/.bowerrc"),
    'jshintrc' => File.join(SOURCE, "/.jshintrc"),
    'ftppass' => File.join(SOURCE, "/.ftppass"),
    'gitignore' => File.join(SOURCE, ".gitignore"),
    'markdown_ext' => "md"

  }
end # end Variables




class Configs < Variables


   def test
      resp = $configyml['credential_cache_yesno']

      if resp == "yes"
        puts "yes"
      else
        puts "no"
      end

      if File.exists?("./.origin.log")
        puts "exist .origin.log"
      else
        puts "does not exist .origin.log"
      end
  end




# Create .gitignore
  def gitignore
    if File.exists?(CONFIG['gitignore'])
      puts CONFIG['gitignore'] + " set!"
    else
      f = File.new(CONFIG['gitignore'] , "w+")
      f.puts(".sass-cache")
      f.puts("_build")
      f.puts("_includes")
      f.puts("node_modules")
      f.puts("assets/vendor")
      f.puts(".git")
      f.puts("deploy.sh")
      f.puts(".grunt")
      f.puts(".ftppass")
      f.puts(".bundle")
      f.puts("./**/.DS_Store")
      f.puts("./**/*.log")
      f.puts("*.tar.gz")
      f.puts(".tmp")
      f.puts("*.zip")
      f.puts("*.*~")
      f.puts("*.log")
      f.puts("assets/css")
      f.puts("assets/fonts")
      f.puts("assets/javascripts/vendor/")
      f.puts("assets/javascripts/scripts.min.js")
      f.puts("*.lock")
      f.puts(".bowerrc")
      f.puts(".jshintrc")
      f.puts(".administration")

    end
  end # Create .gitignore

# Create .bowerrc
  def bowerrc
    if File.exists?(CONFIG['bowerrc'])
     puts CONFIG['bowerrc'] + " set!"
   else
    f = File.new(CONFIG['bowerrc'] , "w+")
    f.puts("{")
    f.puts("\"directory\": \"#{CONFIG['bower_dir']}\"")
    f.puts("}")

  end
end # Create .bowerrc

# Create .ftppass
def ftppass
  if File.exists?(CONFIG['ftppass'])
   puts CONFIG['ftppass'] + " set!"
 else
  f = File.new(CONFIG['ftppass'] , "w+")
  f.puts("{")
  f.puts("\"key\": {")
  f.puts("\"username\": \"username\",")
  f.puts("\"password\": \"password\"")
  f.puts("}")
  f.puts("}")

end
end # Create ftppass


# Create .jshintrc
def jshintrc
 if File.exists?(CONFIG['jshintrc'])
  puts CONFIG['jshintrc'] + " set!"
else
  f = File.new(CONFIG['jshintrc'] , "w+")
  f.puts('{')
  f.puts('"bitwise": true,')
  f.puts('"browser": true,')
  f.puts('"curly": true,')
  f.puts('"eqeqeq": true,')
  f.puts('"eqnull": true,')
  f.puts('"esnext": true,')
  f.puts('"immed": true,')
  f.puts('"jquery": true,')
  f.puts('"latedef": true,')
  f.puts('"newcap": true,')
  f.puts('"noarg": true,')
  f.puts('"node": true,')
  f.puts('"strict": false,')
  f.puts('"trailing": true')
  f.puts('}')
end
end # Create .jshintrc

def inotify_watchers
# cmd =
# system("echo")
# system("echo Increasing the amount of inotify watchers (Debian|RedHat). Ctrl+C Cancel")
# system("echo Tell computer administrator password:")
# cmd = "echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysl.conf && sudo sysctl -p"
# system(cmd)
end

def bower_dependences
  cmd = "node node_modules/bower/bin/bower install"
  system(cmd)
  cmd = "grunt build"
  system(cmd)
end

def theme_confs
  color = ENV["color"]
  if Dir.exists?(CONFIG['theme_dir'])
    f = File.new(CONFIG['theme_dir'] + "_config.scss", "w+")
    # f.puts("/* Using task: $grunt theme-{name}")
    # f.puts("name: light | blue | pink | black")
    # f.puts("*/")
    f.puts("$theme: \"#{color}\" !default;")
  end
end

def post_create
  # system("rake gitignore")
  abort("rake aborted: '#{CONFIG['posts']}' directory not found.") unless FileTest.directory?(CONFIG['posts'])
  title = ENV["TITLE"] || "new-post"
  author = ENV["AUTHOR"]
  tags = ENV["TAGS"] || "[]"
  article = ENV["ARTICLE"]
  published = ENV["PUBLISHED"]
  comment = ENV["COMMENT"]
  categories = ENV["CATEGORIES"] || ""
  categories = "\"#{categories.gsub(/-/,' ')}\"" if !categories.empty?
  slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  begin
    date = (ENV['date'] ? Time.parse(ENV['date']) : Time.now).strftime('%Y-%m-%d')
  rescue => e
    puts "Error - date format must be YYYY-MM-DD, please check you typed it correctly!"
    exit -1
  end
  filename = File.join(CONFIG['posts'], "#{date}-#{slug}.#{CONFIG['markdown_ext']}")
  filepath = File.join("#{date}-#{slug}.#{CONFIG['markdown_ext']}")
  if File.exist?(filename)
    abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
  end

  puts "Creating new post: #{filename}"
  open(filename, 'w') do |file|
    file.puts "---"
    file.puts "layout: post"
    file.puts "title: \"#{title.gsub(/-/,' ')}\""
    file.puts("author: \"#{author}\"")
    file.puts("article: \"#{article}\"")
    file.puts("published: \"#{published}\"")
    file.puts("comment: \"#{comment}\"")
    file.puts("cover: \"\"")
    file.puts("filepath: \"#{filepath}\"")
    file.puts("date: \"#{date}\"")
    file.puts("tags: #{tags}")
    file.puts("categories: #{categories}")
    file.puts "---"

  end
end


def page_create
  # system("rake gitignore")
  abort("rake aborted: '#{CONFIG['page']}' directory not found.") unless FileTest.directory?(CONFIG['pages'])
  title = ENV["TITLE"] || "new-page"
  contact = ENV["CONTACT"]
  permalink = ENV["PERMALINK"]
  comment = ENV["COMMENT"]
  categories = ENV["CATEGORIES"] || ""
  categories = "\"#{categories.gsub(/-/,' ')}\"" if !categories.empty?
  slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  begin
    date = (ENV['date'] ? Time.parse(ENV['date']) : Time.now).strftime('%Y-%m-%d')
  rescue => e
    puts "Error - date format must be YYYY-MM-DD, please check you typed it correctly!"
    exit -1
  end
  filename = File.join(CONFIG['pages'], "#{date}-#{slug}.#{CONFIG['markdown_ext']}")
  if File.exist?(filename)
    abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
  end

  puts "Creating new page: #{filename}"
  open(filename, 'w') do |file|
    file.puts("---")
    file.puts("layout: page")
    file.puts("title: \"#{title.gsub(/-/,' ')}\"")
    file.puts("date: \"#{date}\"")
    file.puts("send_google_forms: #{contact}")
    file.puts("comment: \"#{comment}\"")
    file.puts("cover: \"\"")
    file.puts("permalink: \"/#{permalink}/\"")
    file.puts("categories: #{categories}")
    file.puts "---"

  end
end

# Usage: rake deploygit pull="{ y | n }" type="{ source | build }" branch="your_branch" messagecommit="Your_message_commit"
def deploygit
  website = $configyml['website']
  base_website = $configyml['base_website']
  credential = $configyml['credential_cache_yesno']
  messagecommit = ENV['messagecommit']
  pullsn = ENV['pull']
  branchgit = ENV['branch']
  type = ENV['type']

  if type == "build"
    cmd = "sed -i \"s|^url:.*|url: 'http:\/\/#{website}'|g\" _config.yml"
    system(cmd)
    cmd = "sed -i \"s|^baseurl:.*|baseurl: '#{base_website}'|g\" _config.yml"
    system(cmd)
    cmd = "grunt build"
    system(cmd)
    dirdeploy = "#{CONFIG['build_dir']}"
    cyml = $configyml['build_repository_project']
  elsif type == "source"
    cmd = "sed -i \"s|^url:.*|url: 'http:\/\/localhost:4000'|g\" _config.yml"
    system(cmd)
    cmd = "sed -i \"s|^baseurl:.*|baseurl: ''|g\" _config.yml"
    system(cmd)
    dirdeploy = "."
    cyml = $configyml['source_repository_project']
  else
    abort("rake aborted: '#{type}' incorrect!")
  end

  cmd = "cd #{dirdeploy} && git init ."
  system(cmd)
  cmd = "cd #{dirdeploy} && git checkout -b #{branchgit}"
  system(cmd)
  cmd = "cd #{dirdeploy} && git checkout #{branchgit}"
  # cmd = "rm ./.git/config"
  # system(cmd)
  cmd = "cd #{dirdeploy} && git config --local user.name " + $configyml['first_last_name']
  system(cmd)
  cmd = "cd #{dirdeploy} && git config --local user.email " + $configyml['user_email']
  system(cmd)
  cmd = "cd #{dirdeploy} && git config --local core.excludes " + CONFIG['gitignore']
  system(cmd)
  cmd = "cd #{dirdeploy} && git config --local color.ui true"
  system(cmd)



  if credential == "yes"
      cmd = "cd #{dirdeploy} && git config --" + $configyml['credential_cache_type'] + " credential.helper 'cache --timeout="+ $configyml['credential_cache_time'] + "'"
      system(cmd)
  else
      cmd = "cd #{dirdeploy} && git credential-cache exit"
      system(cmd)
  end


  cmd = "cd #{dirdeploy} && git config --global http.postBuffer 104857600"
  system(cmd)


  if File.exists?("./.origin.log") # remote

    cmd = "rm -rf ./.origin.log"
    system(cmd)

    cmd = "cd #{dirdeploy} && git remote remove origin"
    system(cmd)

    cmd = "cd #{dirdeploy} && git remote add origin " + $configyml['sshttps'] + $configyml['github_user'] + "/" + cyml
    system(cmd)

    f = File.new("./.origin.log" , "w+")
    f.puts($configyml['sshttps']+ $configyml['github_user'] + "/" + cyml)
    cmd = "git remote add origin " + $configyml['sshttps'] + $configyml['github_user'] + "/" + cyml
    system(cmd)



  else

   f = File.new("./.origin.log" , "w+")
   f.puts($configyml['sshttps']+ $configyml['github_user'] + "/" + cyml)
   cmd = "cd #{dirdeploy} && git remote add origin " + $configyml['sshttps'] + $configyml['github_user'] + "/" + cyml
   system(cmd)

  end # remote

  cmd = "cd #{dirdeploy} && git add --all"
  system(cmd)
  cmd =  "echo  Add all file to branch Git!"
  system(cmd)
  cmd = "cd #{dirdeploy} && git commit -m '" + $configyml['project_name'] + ": #{messagecommit}'"
  system(cmd)
  cmd = "echo -Git commit completed!"
  system(cmd)
  if $pullsn == "y"
   cmd = "cd #{dirdeploy} && git pull origin #{branchgit}"
   system(cmd)
   cmd = "echo -Pull completed!"
   system(cmd)
 end
 cmd = "cd #{dirdeploy} && git push origin #{branchgit}"
 system(cmd)
 cmd = "echo Deploy Completed"
 system(cmd)
 cmd = "echo Git config Ok!"
 system(cmd)
end # deploygit





def make_install
  cmd = "npm install"
  system(cmd)
  cmd = "grunt copy"
  system(cmd)
  # cmd = "grunt build"
  # system(cmd)
end


def clean
  cmd = "rm -rf assets/css assets/fonts assets/vendor node_modules _build/* _includes assets/javascripts/scripts.min.js .origin.log .bowerrc .ftppass .gitignore .jshintrc .sass-cache"
  system(cmd)
  # cmd = "ruby _plugins/gemreset.rb"
  # system(cmd)
  cmd = "echo Cleaned compilation [Ok]"
  system(cmd)
end

end # end Configs