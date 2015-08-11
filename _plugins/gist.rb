# ===========================================================================================
# Using: 
# -------------------------------------------------------------------------------------------
# 1 - Move the 'gist.rb' script in "_plugins" folder in the root of your project. Note: If the folder does not exist, create.
# 2 - In "_config.yml" file, create a variable called "github_user" and enter your User GitHub.
# 3 - Use the tag in your posts:
#
# {% gist ID_GIST_POST %}
#
# Where "ID_GIST_POST" should contain the "ID" of Gist posted on https://gist.github.com/
# -------------------------------------------------------------------------------------------
# Script by: William C. Canin
# Language: Ruby
# Info: https://gist.github.com/williamcanin/0bbebb1f9a5385171035
# # ===========================================================================================

class Gist < Liquid::Tag
Syntax = /^\s*([^\s]+)(\s+(\d+)\s+(\d+)\s*)?/

def initialize(tagName, markup, tokens)
super

if markup =~ Syntax then
@ID_GIST = $1
else
raise "No search valid! :("
end
end

def render(context)
    @configyml = YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)), '../_config.yml'))
    @github_user = @configyml['github_user']
"
<script src=\"https://gist.github.com/#{@github_user}/#{@ID_GIST}.js\"></script>
"
end

Liquid::Template.register_tag "gist", self
end