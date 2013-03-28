require 'fileutils'

shell_framework_git = "https://github.com/sorin-ionescu/prezto.git"
shell_framework_dest = ".zprezto"

# additional completion files for ZSH
additional_completions = %w(https://raw.github.com/bobthecow/git-flow-completion/master/git-flow-completion.zsh)

base_path = Dir.pwd
dest_path = ENV['HOME']

local_settings_file = ".local.zshrc"

dot_files = %w(.zshrc .gemrc .gitconfig .zprofile .zlogin .zlogout .zshenv .zpreztorc .coloritrc)

zsh_theme = "domnikl"

task :default => 'dotfiles:install'

fortunes = %w(fortunes/programming)

namespace :dotfiles do
  
  desc "main task to install all required libs and files"
  task :install => [:framework, :completions, :theme, :symlinks, :bundle, :fortunes, :help] do
    FileUtils.touch(File.join(dest_path, '.z'))
    FileUtils.touch(File.join(dest_path, local_settings_file))
  end
  
  desc "download fresh copy of prezto"
  task :framework => :clean do
    system "git clone --recursive #{shell_framework_git} #{dest_path}/#{shell_framework_dest}"
  end
  
  desc "setup additional ZSH completions"
  task :completions do
    puts "downloading additional completions for ZSH ..."
    
    additional_completions.each do |completion|
      system "wget -q -nc #{completion}"
    end
  end
  
  desc "build bundle"
  task :bundle do
    system 'bundle install'
  end
  
  desc "cleanup installation"
  task :clean do
    puts "cleaning dotfiles ..."
    
    dot_files.each do |dot_file|
      FileUtils.rm_rf(File.join(dest_path, dot_file))
    end
    
    puts "cleaning framework ..."
    FileUtils.rm_rf(File.join(dest_path, shell_framework_dest))
  end
  
  desc "setup ZSH theme"
  task :theme do
    puts "setup ZSH theme '#{zsh_theme}' ..."
    
    setup_name = "prompt_#{zsh_theme}_setup"
    src_path_theme = File.join(base_path, 'themes', setup_name)
    dest_path_theme = File.join(dest_path, shell_framework_dest, 'modules', 'prompt', 'functions', setup_name)
    
    FileUtils.ln_sf(src_path_theme, dest_path_theme)
  end
  
  task :help do
    puts
    puts "=> run 'chsh -s' to change your used shell to activate settings"
  end
  
  desc "setup symlinks for dotfiles"
  task :symlinks => :clean do
    dot_files.each do |dot_file|
      puts "symlinking #{dot_file} .."
      FileUtils.ln_s(File.join(base_path, dot_file), File.join(dest_path, dot_file))
    end
  end

  desc "compile fortunes"
  task :fortunes do
    if system "which strfile"
      fortunes.each do |f|
          system "strfile #{f} #{f}.dat"
      end
    else
      puts "skipping compiling fortunes because of missing strfile tool"
    end
  end
end


