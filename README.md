![shell-cloudflare](https://static.frapsoft.com/markdown/github/shell-cloudflare.jpg)  

# shell-cloudflare

shell script for cloudflare caching and development mode.

### Tasks
* clear cloudflare cache
* turn development mode on / off

### Configuration

setup your cloudflare settings:  

```
# Cloudflare Settings
token=""
email=""
domain=$1
action=""
```

### Usage  

`chmod u+x cloudflare.sh` make it executable    
`./cloudflare.sh domain.com cache` clear cache  
`./cloudflare.sh domain.com devon` turn development mode on  
`./cloudflare.sh domain.com devoff` turn development mode off  

### Twitter

[![frapsoft on twitter](https://static.frapsoft.com/markdown/github/twitter.png)](https://twitter.com/frapsoft)

## License

Copyright (c) 2016 Maik Ellerbrock  
MIT: <https://opensource.org/licenses/mit-license.php>