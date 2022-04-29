![logo](http://logo.plainedit.com/2/cover.png)

# [Examples - examples.plainedit.com](https://examples.plainedit.com/)

PLAINEDIT takes markdown, evaluates code blocks with interpreters and prints the output of those processes to a different codeblock.


## MENU

+ [Sourcecode - bash.plainedit.com](http://bash.plainedit.com/)
+ [Documentation - docs.plainedit.com](http://docs.plainedit.com/)
+ [News - blog.plainedit.com](http://blog.plainedit.com/)
+ [Website - www.plainedit.com](http://www.plainedit.com/)
+ [Offer - offer.plainedit.com](http://offer.plainedit.com/)
+ [logo.plainedit.com](https://logo.plainedit.com/)


## Examples

### show only code
example with FLAGS
+ [IN ](1/in.md)
+ [OUT ](1/out.md)

### show only code at selected script
example with FLAGS
+ [IN ](2/in.md)
+ [OUT ](2/out.md)



## Install

Install from repo: https://github.com/plainedit/bash.git
```bash
./install.sh
```

Update works such git pull for bash repo: https://github.com/plainedit/bash.git
```bash
./update.sh
```

clean folders from temp files
```bash
./clean.sh
```


## Start using PlainEdit

List of projects
```bash
./plainedit
```

Run macro for 1/in.md
```bash
./plainedit 1
```

INPUT and OUTPUT file
```bash
./plainedit "in.md" "out.md"
```

## Projects

Working with projects structure folder

files structure
```
1
    in.md
    out.md
2
    in.md
    out.md
```

The same, with folders
```bash
./plainedit "1/in.md" "1/out.md" 
```

Config Path where the project folder exist
```bash
./plainedit --path "/media/tom/projects/plainedit/examples/1" "in.md" "out.md"
```

Authorisation
```bash
./plainedit "1/in.md" "1/out.md" "1/auth.md"
```


---

You can use the to maintain and preview the content for your website in Markdown files:

+ [edit](https://github.com/plainedit/examples/edit/master/README.md)
+ [plainedit/examples](https://github.com/plainedit/examples)
