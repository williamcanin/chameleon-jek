# --------------------------------------------------------------------
#
# Plugin:       Read Time
# Description:  Outputs the reading time
# Author:       zahcleat - https://gist.github.com/zachleat/5792681
#
# Install:       Put into your _plugins dir in your Jekyll site
# Usage:        Read this in about {{ page.content | reading_time }}
# Example:      Read this in “about 4 minutes”
#
# --------------------------------------------------------------------


module ReadingTimeFilter
    def reading_time( input )
        words_per_minute = 180

        @configyml = YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)), '../_config.yml'))
        @language = @configyml['language']

        words = input.split.size;
        minutes = ( words / words_per_minute ).floor

        if @language == 'portuguese'
          minutes_label = minutes === 1 ? " minuto" : " minutos"
          minutes > 0 ? "Tempo estimado de leitura: #{minutes} #{minutes_label}" : "menos de 1 minutos"
        else
          minutes_label = minutes === 1 ? " minute" : " minutes"
          minutes > 0 ? "Estimated reading time: #{minutes} #{minutes_label}" : "within 1 minute"
        end

    end
end

Liquid::Template.register_filter(ReadingTimeFilter)
