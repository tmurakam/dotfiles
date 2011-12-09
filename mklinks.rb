#!/usr/bin/env ruby
Dir.glob("dot.*").each do |f|
    next if (f =~ /~$/)
    fname = f.sub(/^dot\./, ".")
    cmdline = "ln -s ~/dotfiles/#{f} ~/#{fname}"
    puts cmdline
    system cmdline
end
