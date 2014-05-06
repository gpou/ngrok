Description
===========
[![Cookbook Version](http://img.shields.io/cookbook/v/ngrok.svg)][cookbook]
[![Build Status](http://img.shields.io/travis/onbeep-cookbooks/ngrok.svg)][travis]

[cookbook]: https://community.opscode.com/cookbooks/ngrok
[travis]: http://travis-ci.org/onbeep-cookbooks/ngrok

Installs & configures the ngrok client program. Ngrok can be used for establishing
network tunnels from the outside world to the inside world.


Requirements
------------
Chef 11+ is required. For the latest list of supported platforms please see `metadata.rb`.


Attributes
----------
| Attribute               | Default                | Required?    | Description                                   |
|-------------------------|:----------------------:|--------------|-----------------------------------------------|
| `auth_token`            | `''`                   | **Required** | Authentication Token for ngrok.com            |
| `tunnels`               | `{}`                   | **Required** | Dictionary of tunnel configurations.          |
| `config_file`           | `/etc/ngrok.conf`      | Default      | Config file for ngrok client.                 |
| `download_site`         | `https://dl.ngrok.com` | Default      | Site from which to download ngrok.            |
| `zip_file`              | `ngrok.zip`            | Default      | Ngrok archive to download.                    |
| `http_proxy`            | `nil`                  | *Optional*   | For running ngrok client behind a HTTP proxy. |
| `inspect_addr`          | `nil`                  | *Optional*   | Change web inspection interface.              |
| `server_addr`           | `nil`                  | *Optional*   | Custom ngrok server (other than ngrok.com)    |
| `trust_host_root_certs` | `nil`                  | *Optional*   | Trust custom server TLS connections           |

For more information on these configuration Attributes, see https://ngrok.com/usage

Usage
-----
1. Create an ngrok account: http://ngrok.com
2. Copy your ngrok auth_token to the `['ngrok']['auth_token']` Attribute.
3. Add an Attribute for the tunnels you'd like to establish. e.g. `{'webserver' => {'proto' => {'http+https' => '80'}}}`
4. Add the ngrok Cookbook in your Run List.



Author
------
Greg Albrecht <gba@onbeep.com>


Copyright
---------
Copyright 2014 OnBeep, Inc.


License
-------
Apache License, Version 2.0

See LICENSE
