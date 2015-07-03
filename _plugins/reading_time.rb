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

        words = input.split.size;
        minutes = ( words / words_per_minute ).floor
        minutes_label = minutes === 1 ? " minute" : " minutes"
        minutes > 0 ? "Estimated reading time: #{minutes} #{minutes_label}" : "within 1 minute"
    end
end

Liquid::Template.register_filter(ReadingTimeFilter)
