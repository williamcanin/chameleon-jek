class Image < Liquid::Tag
Syntax = /^\s*([^\s]+)(\s+(\d+)\s+(\d+)\s*)?/

def initialize(tagName, markup, tokens)
super

if markup =~ Syntax then
@img = $1
else
raise "No image search!"
end
end

def render(context)
    @configyml = YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)), '../_config.yml'))
    @url = @configyml['url'] + @configyml['baseurl']
"
<div class=\"row\">
    <div class=\"col-sm-12 video-posts\">

        <img class=\"img-responsive img-centered\" src=\"#{@url}/assets/images/posts/#{@img}\" alt=\"\">

    </div>
</div>
"
end

Liquid::Template.register_tag "image", self
end

