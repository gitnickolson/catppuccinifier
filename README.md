<h1 align="center">Catppuccinifier</h1>

This is a small project that I created because I wanted to colorize my ASCII art. The tool is built around the Catppuccin color palette - one of my favorites.

## What it does

The Catppuccinifier colorizes your text documents by randomly assigning a color to each character. You can choose one out of the four [Catppuccin themes](https://catppuccin.com/palette/) that will be used to colorize your text.

If you want to use another color palette you can simply swap the hex codes of a specific color palette with the ones you desire in `lib/themes/theme_colors.rb`.

## How to use

Prerequisites:
Make sure to have ruby 4.0.3 (or higher) and a corresponding version of bundler installed.

1. Clone the repository

```zsh
git clone https://github.com/gitnickolson/catppuccinifier.git
```

2. Enter the directory

```zsh
cd catppuccinifier
```

3. Install dependencies

```zsh
bundle install
```

4. Start the program

```zsh
bundle exec bin/catppuccinify
```

You will then be prompted to enter the filepath to the file you want to print colorized.

The result will be printed to your terminal.

## Example usage

```zsh
> bundle exec bin/catppuccinify
Please enter the path to the file you want to catppuccinify.

> ~/ascii_art/spark_collection.txt
Please choose a catppuccin theme:
1. Latte
2. Frappe
3. Macchiato
4. Mocha

> 4
```

You can also use it by passing the filepath and the theme as CLI args

```
> bundle exec bin/catppuccinify ~/ascii_art/spark_collection.txt 4
```

The theme parameters can be passed as numerics or as their respective titles written out.

That means that these are both valid

```
> bundle exec bin/catppuccinify ~/ascii_art/spark_collection.txt 2
> bundle exec bin/catppuccinify ~/ascii_art/spark_collection.txt Frappe
```

Example output
![Example output](colorized_spark_collection.png)


## Adding Catppuccinifier to your zsh autocompletion
Add the following line to your `.zshrc` configuration file (and don't forget to replace the example path with the actual path that leads to your Catppuccinifier directory)

```
source ~/path/to/directory/catppuccinifier/plugin.zsh
```