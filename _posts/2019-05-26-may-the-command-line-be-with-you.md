---
layout: post
asset-type: post
title: "May the 'command line' be with you"
description: Saving time when avoiding manual tasks
date: 2019-05-26 12:00:00 +00:00
image:
    src: /img/cards/posts/may-the-command-line-be-with-you/cover.jpg
---

## Motivation

Sounds of keystrokes:

> tick tick - tock 

> tick tick - tock 

> tick tick - tock 

I was listening that repetitive sounds again and again. 

I became curious:

> Hi! How are you? What are you doing?

> Hi! I'm removing lines with one space. I'm just about to finish...

## Introduction

We are used to hearing about automation for repetitive and regular tasks.

However, time can be saved with tasks although they are executed only once.

Furthermore, the personal satisfaction instead of doing a manual task is priceless.

This post is based on **some** useful examples of commands with that in mind.

### About the examples included

We need a command-line interpreter for reading lines from either the terminal or a file: the **Shell**.

There are different implementations of the shell: 
* **Korn shell** (`ksh`)
* **Bash** (`bash`)
* **Dash** (`dash`)
* **Z shell** (`zsh`)
* ...

This is the current shell in my Linux distribution (Ubuntu):

```sh
$ echo $0
bash
```

**Bash** has stayed with me from the late nineties. However, **Z shell** is widely chosen by most of my friends who are using Linux or macOS and it's cool when customizing it with [Oh My Zsh!](https://ohmyz.sh/).

Its basic usage is similar to **Bash** and all the examples included in this post work for both of them.

These are my steps to move to **Z shell** in the last days:

1. Installing **Z shell**:
```sh
$ sudo apt install zsh
```
2. Installing **Oh My Zsh!**:
```sh
$ sh -c "$(curl -fsSL \ 
https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
3. Recovering **Bash** as the default shell (it was changed in the previous step):
```sh
$ chsh -s /bin/bash
```

When I feel confident and comfortable with **Z shell**, I'll change my default shell definitively. Meanwhile, I'll continue experimenting by opening a new terminal with that shell specifically:

```sh
$ gnome-terminal -e zsh &
```

Even though I'm a Linux user, I've been working with Windows operating systems as well and it's possible to pursue the same goal with Command Prompt, PowerShell or Cygwin.

## Some examples

Remember that this post is focused on saving time when avoiding manual tasks.

There are more commands and more ways to do the same.

### Files

#### Removing lines

```sh
# Format for removing lines with a pattern:
#  sed '/pattern/d' FILE

# Remove blank lines 
#  ^ = start of line
#  $ = end of line
$ sed '/^$/d' file.txt

# Remove lines with one space
$ sed '/^ $/d' file.txt

# Remove lines with whitespaces 
#  \s = whitespace
#  * = zero or more times the preceding character
$ sed '/^\s*$/d' file.txt
```

#### Replacing strings

```sh
# Format for replacing a pattern for another one:
# sed -i 's/pattern1/pattern2/g' FILE

# Replace 'foo' by 'bar' in a file
$ sed -i 's/foo/bar/g' file.txt

# Replace 'foo' by 'bar' in all the TXT files in a second level
$ sed -i 's/foo/bar/g' **/*.txt
```

For doing other types of massive replacements, take a look at the examples with `find ... -exec ...` or _Renaming files with the same pattern_ section.

#### Getting part of the content

Imagine that you have a CSV file, colon as a separator, with users data.

You only need the emails which appear in the second column:

```sh
# d = delimiter (colon in this case)
# f = field (second field in this case)
$ cut -d: -f2 my_file.csv

# Or saving the output in a file
$ cut -d: -f2 my_file.csv > second_column.txt
``` 

#### Looking at the end of a file

Instead of opening a file and moving to the end, the last lines can be obtained as follows:

```sh
# Get the last 10 lines
$ tail file.txt

# Get the last 20 lines
$ tail -n 20 file.txt

# Get all the lines from the line number 20
$ tail -n +20 file.txt
```

### File system

#### Creating nested directories

Instead of:

```sh
$ mkdir dir1
$ mkdir dir1/dir2
$ mkdir dir1/dir2/dir3
$ mkdir dir1/dir2/dir3/dir4
$ mkdir dir1/dir2/dir3/dir4/dir5
$ mkdir dir1/dir2/dir3/dir4/dir5/dir6
```

get the same in one line:

```sh
$ mkdir -p dir1/dir2/dir3/dir4/dir5/dir6
```

#### Renaming files with the same pattern

Renaming all the files in the current directory when appending "previous_":

```sh
$ for file in *
do
    mv "$file" "previous_$file"
done
```

Or in one line:

```sh
$ for file in *; do mv "$file" "previous_$file"; done
```

If we want to make the change for only regular files, not directories:

```sh
$ for file in *
do
    if [ -f "$file" ]
    then
        mv "$file" "previous_$file"
    fi
done
```

Or in one line:

```sh
$ for file in *; do if [ -f "$file" ]; then \
mv "$file" "previous_$file"; fi; done
```

**NOTE**: These examples wouldn't need quotes when executing on **Z shell** because it doesn't do [word splitting](https://www.gnu.org/software/bash/manual/html_node/Word-Splitting.html) by default, so they would work properly even with whitespaces in the filenames.

### Searching

#### Searching for text

```sh
# Search for all the files that contain the text 'date=' 
# from the current directory
$ grep -r 'date=' .

# or only the names of the files
$ grep -rl 'date=' .
```

#### Searching for files

```sh
# Search for all the regular files from the current directory
$ find . -type f

# Search for all the JPG files from the current directory
$ find . -name '*.jpg'

# Search for all the JPG and PNG files from the current directory
$ find . \( -name '*.png' -or -name '*.jpg' \)
```

Remember the use of quotes around the pattern. Otherwise, it will behave strangely when finding a matching file in the current directory.

The `find` command can be expanded to execute a command for each file found:

```sh
# Remove all the JPG files from the current directory
#  {} is replaced by the name of the file found
#  ';' indicates the end of the value for the 'exec' option
$ find . -name '*.jpg' -exec rm {} ';'
```

Aren't you sure about executing it? Ask for confirmation when replacing `exec` by `ok`:

```sh
$ find . -name '*.jpg' -ok rm {} ';'
``` 

### Moving faster

#### Changing to another directory

To come back to the previous directory, it's not necessary to type the full path. This command will drive you directly:

```sh
$ cd -
```

**Z Shell** allows you to do this kind of changes:

```sh
$ pwd
/home/rachel/lab/application/3.0/src
$ cd 3.0 5.0
$ pwd
/home/rachel/lab/application/5.0/src
```

#### Executing a previous command

The exclamation point !, also called _bang_, is useful to recall a previous command line:

```sh
# For example, we execute these commands
$ cat my_file.txt
$ vi my_file.txt

# bang bang 
# (it's more funny than thinking on 'exclamation point exclamation point')
$ !!
# It executes the last command: 'vi my_file.txt'

# bang cat
$ !cat
# It executes the last command that starts with 'cat': 'cat my_file.txt'

# Or extending the last command
$ echo Hello
Hello
$ !! world!
echo Hello world!
Hello world!
```

On the other hand, instead of using the upper arrow key to move backwards in the history to look for other executed commands, press `Control + R`:

```sh
$
(reverse-i-search)`':
```

Then, write a fragment of the command you're looking for. 

If you don't find the command, keep pressing `Control + R` for getting the next match.

Once you find the command, press `Return`. Or `Control + G` to exit.

#### Managing a long command line

* `Control + A`: it moves the cursor to the beginning of the line (A = first letter of the alphabet)
* `Control + E`: it moves the cursor to the end of the line (E = end)
* `Control + U`: it deletes all the command line (U = undo)
* `Control + K`: it cuts the text from the current cursor position to the end
* `Control + Y`: it pastes the previously cut text

Why **K** and **Y**?

Because of **killing** and **yanking**. This idea comes from [Emacs and its kill ring](https://www.gnu.org/software/emacs/manual/html_node/emacs/Killing.html).

Actually, when killing the text with `Control + K`, the text is saved in a "kill ring".

The "kill ring" can store up to 10 elements.

After yanking text with `Control + Y`, this option is available:

* `Esc + Y`: it replaces the last yanked text by the previously killed text available in the ring. Keep pressing `Esc + Y` until you get the desired text. It's called a "ring", because it works as a cycle.

#### Renaming a file 

Instead of:

```sh
$ mv this/is/a/long/path/for/filename.txt \
     this/is/a/long/path/for/filename.txt.bk
```

execute:

```sh
$ mv this/is/a/long/path/for/filename.txt{,.bk}
```

#### Avoiding long paths

Imagine that you usually work in a directory and there is a long path to reach it:

```sh
$ cd directory1/directory2/directory3/directory4/directory5
```

A link with a simple name can be created:

```sh
# Create a link
$ ln -s directory1/directory2/directory3/directory4/directory5 workspace

# Access the directory
$ cd workspace
```

However, the last command will only work if it's executed under the directory that contains the created link.

An alternative is to set the variable CDPATH:

```sh
export CDPATH='directory1/directory2/directory3/directory4'
```

and the following command will work from any directory:

```sh
cd directory5
```

Why?

When executing it, the shell will try to make the change under the current directory. If the directory doesn't exists, it will try to find it under the directory saved in CDPATH variable. 

CDPATH variable can contain several directories in the same way as PATH, so every directory will be checked in order.

#### Avoiding long commands

For example, this long command for getting your public IP address:

```sh
$ dig +short myip.opendns.com @resolver1.opendns.com
```

An alias can be created and saved in the `~/.bash_aliases` file:

```sh
alias public_ip='dig +short myip.opendns.com @resolver1.opendns.com'
```

Then you will get your public IP address when typing:

```sh
$ public_ip
```

NOTES:

* Remember to run `source ~/.bash_aliases` or `. ~/.bash_aliases` if you want to see the changes applied on the current open terminal.

* Check that this piece of code exists into your `~/.bashrc` file in order to have that alias available forever:
```sh
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
``` 

* Git provides its own way to create and to save aliases. For example, if you want to rebase with every pull operation:
```sh
$ git config --global alias.pull 'pull --rebase'
$ git pull 
# It executes: git pull --rebase
# ---
# Get all the existing aliases in the global scope
$ git config --global --get-regexp alias
# or
$ git config --global -l | grep alias
# or looking at [alias] section in ~/.gitconfig file
```

## Friendly reminders

> _Anyone who does not have the command line at their beck-and-call is really missing something._ - [Tim O'Reilly](https://twitter.com/timoreilly/status/956209333267701760)

### The power of tools

IDEs are getting better and better. However, I notice that commands and scripting supplement my work. And I even still continue to use VIM for some tasks.

The more tools you know, the easier it will be for you to do your tasks.

### Command line tools vs GUI clients

It's easy to find GUI clients for command-line tools. However, those GUI tools are usually limited to a list of operations.

If you like freedom, choose the command line ;)

Moreover, in the case of Git, sometimes people only push buttons on the GUI client until everything is green without knowing what they are doing. [Yodra López](https://twitter.com/yodralopez) had a similar experience and she includes some stories about it in her great talk (in Spanish): [Mira lo que ha hecho... Git](https://www.youtube.com/watch?v=FUYmyfmJ9wo).

Freedom brings with it responsibilities, so maybe it forces people to know what they are doing.

## Acknowledgments

Thanks to [Marc Cornellà](https://twitter.com/MarcCornella) for letting me know the alternative to enabling word-splitting after [my small pull request](https://github.com/robbyrussell/oh-my-zsh/pull/7880). It encouraged me to know more about it and to discard my decision of setting `sh_word_split` in **Z shell** global settings.

## Resources

* [Bash reference manual](https://www.gnu.org/software/bash/manual/bash.html)
* [Z shell documentation](http://zsh.sourceforge.net/Doc/)
* [Oh My Zsh!](https://ohmyz.sh)
* [Ubuntu and the default system shell: DashAsBinSh](https://wiki.ubuntu.com/DashAsBinSh).
* [Git aliases](https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases)
* [Useful one-line scripts for sed](http://sed.sourceforge.net/sed1line.txt)
* [Small Sharp Software Tools](https://smallsharpsoftwaretools.com) by [Brian P. Hogan](https://twitter.com/bphogan).
* I admire the comics made by [Julia Evans](https://twitter.com/b0rk) that she usually shares in Twitter. For example: [comic about grep](https://twitter.com/b0rk/status/991880504805871616). They are also collected into [zines](https://wizardzines.com).

## Feedback

Which is your favorite time-saving recommendation? [Here the tweet to reply](https://twitter.com/bberrycarmen/status/1132724015733325825).
