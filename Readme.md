# Dotfiles

This is an attempt to get some more unity in the way I use my command-line in osx and linux. I have made one important step about a thousand years ago: the usage of [zsh](http://www.zsh.org/).

Zsh is an interactibve shell designed for interactive use, although it is also a powerful scripting language.

As many shell-related stuff, zsh came with a 'dotfile' to configure the general usage and look and feel. I would like to have as much consistency in the usage and look and feel in my shells. And it shoudn't be too different under linux or mac os.

That is why I have divided the files in some includes. These includes are in the following categories:

* general configuration
* aliasses
* host-specific files
* files to support intended use (like desktop or webserver systems)

The initial commit in this repository is the set of dotfiles I use on my linux webserver. That is why there are the following files:

*.zshrc*  
The general configuration. This file should be exactly the same on all systems.

*.zsh.alias*  
The aliasses file. Also intended to be the same on all systems.

*.zsh.host*  
Host specific aliasses and settings.

*.zsh.web*  
Webserver specific aliasses, settings and functions.

Also there is a file called *.zsh.hist* which holds the history. This should be auto-generated by zsh.

## The bin directory
Ofcourse this is not actually a portion of the dotfiles, but still essential enough to add here. The bin directory provides some scripts that eases some of my repetitive tasks. They are mainly written in python (2.7) and needs to be executable and in your path. *.zshrc* takes care of this.

*bin/diskinfo*  

	usage: diskinfo [-h] [-o OUTPUT] [-v]  

	Pretty print the output of disk information.  

	optional arguments:  
	  -h, --help            show this help message and exit  
	  -v                    Prints a verbose version of the information  

*bin/restart*  
	Usage: restart [-i]  
	options  
  	-r, --restart=      restart your choice  
  	-k, --kill=         kill your choice  
  	-s, --start=        start your choice  
  	-i, --interactive   interactive mode, the -r command line argument will be ignored  
  	-h, --help          this help text  
  	-v                  verbose mode  

your choice of webapps for the options mentioned above is one of the options in the *$HOME/.restart.conf* file.
This file is an ini-style config file and should list something like the following:  
  
	[DEFAULT]  
	djangocommand: /manage.py  
	runcmd: runfcgi  
	host: 127.0.0.1  
	method: threaded  
	
	[foo]  
	name: Bar application  
	description: The main webapp running on http://www.foobar.nl/  
	pidfile: /tmp/foo.django.pid  
	location: /webdir/foobar.nl/fooapp  
	port: 3000  

#new post
Also added a simple Python script to create a new post in a frontmatter markdown post

