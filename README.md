# dupa_increment_count
Simple debug marker you can have inserted anywhere just by binding this script to a keypress. The counter resets once your `/tmp/increment_marker.dupa` is removed (so, practically on every system boot).

Then, it will insert an unique marker with current time every time you press the key:
```
dupa_1 at 00:36:26
dupa_2 at 00:36:28
```

Or, given that you just typed:
```
console.log('<your cursor here>')
```
...press the assigned key, aaand...
```
console.log('dupa_3 at 00:41:29')
```


# Dependencies
[xvkbd](http://t-sato.in.coocan.jp/xvkbd/)

# Installation
1. `$ git clone git@github.com:pawelduda/dupa_increment_count.git`
2. `$ chmod +x dupa_increment_count/dupa_increment_marker.sh`
3. Optional: `$ ln -s dupa_increment_count/dupa_increment_marker.sh ~/dupa_incremenet_marker.sh`
4. Bind a key to the command, like so:

![Bind a key to the command, like so](set_custom_shortcut.png)

# But why?
Because I wanted to incorporate this into my workflow and maybe someone else will find it useful.

# Future goals:
## Make it programming language-aware

### --debug flag
Triggering the script with a `--debug` flag while working with vim and editing a Ruby file:
```ruby
class Foo < Bar
  def xyz
    |
  end
end
```
Will turn it into:
```ruby
class Foo < Bar
  def xyz
    binding.pry;
  end
end
```
Positioning the cursor anywhere in the marker and pressing the hotkey again will turn it back into:
```ruby
class Foo < Bar
  def xyz
    |
  end
end
```

### --marker flag
Triggering the script with a `--marker` flag while working with vim and editing a Ruby file:
```ruby
class Foo < Bar
  def xyz
    |
  end
end
```
Will turn it into:
```ruby
class Foo < Bar
  def xyz
    IO.puts('dupa_1 at 11:22:33');
  end
end
```
Positioning the cursor anywhere in the marker and pressing the hotkey again will turn it back into:
```ruby
class Foo < Bar
  def xyz
    |
  end
end
```

So, combining the above `--debug` and `--marker` flags will do this:
```ruby
class Foo < Bar
  def xyz
    IO.puts('dupa_1 at 11:22:33');binding.pry;
  end
end
```
