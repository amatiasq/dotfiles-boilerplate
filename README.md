# dotfiles-boilerplate

Boilerplate for my dotfiles configuration

## Installation

To use it you should fork this repo in your account and addapt it to your needs.

Once you did that you can test it by runing this command in a new computer:

> NOTE: Remember to change `$GH_USERNAME` with your github username and `$GH_REPO` with your repository name.

```bash
curl https://raw.githubusercontent.com/$GH_USERNAME/$GH_REPO/master/.dotfiles/install.sh | bash
```

It will try to pull `github.com/$USER/dotfiles` repository. Remember `$USER` is your system's user name.

## Configuration

This will work out of the box but you probably want to manage the files to be included.

You can define the paths you want to include in the [`~/.dotfiles/include`](https://github.com/amatiasq/dotfiles-boilerplate/blob/master/.dotfiles/include) file. Use `!` to exclude a subpath.

#### Split up changes in commits

If you want to avoid all unrelated changes to be pushed in the same commit you can create commit messages for specific paths using [`~/.dotfiles/include.d/`](https://github.com/amatiasq/dotfiles-boilerplate/tree/master/.dotfiles/include.d) directory.

Every file in this repository should contain a set of paths (allows for exclusion with `!` as prefix). The system will add all files under that paths and commit them using the file name as commit message.

[Here](https://github.com/amatiasq/dotfiles-boilerplate/blob/master/.dotfiles/include.d/Config%20-%20.dotfiles) you have an example about how it's used.

## Usage

Relax. This should set up everything so it will pull, commit and push for you every time the system goes to sleep mode and wakeup. If any error occurs you'll find a `dotsync-error.txt` file in your `~/Desktop`.

If you want to manually run the syncrhonization you can execute `~/.dotfiles/bin/dotsync`.

Use `dot pull boilerplate master` to get any updates in the boilerplate.
