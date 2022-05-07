# [example.plainedit.com/1](http://example.plainedit.com/1/)

# WHOAMI

My name is:

```bash hide_input
whoami
```


## MKDIR

Create new Folder

```bash hide_output
mkdir TEST
```


## LS

Show your folders

```bash hide_input render_html 
ls -la
```


## PHP version

Check PHP version

```bash
php -version
```

## PHP script

Show global variable

```php
class Fruit {
    public $name;
  
    function __construct($name) {
        $this->name = $name;
    }
    function __toString() {
        return $this->name;
    }
}

$apple = new Fruit("Apple");
echo (string ) $apple;
```

## PING

Show your folders

```
ping -q -c 1 softreck.com ; echo $?
```



## STOP
