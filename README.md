# canard-ascii

## Features

Canard ascii is a simple application of [Cadavre exquis](https://fr.wikipedia.org/wiki/Cadavre_exquis). It's composed of series of dispatchers, providers, a register, a database and a load balancer. Each providers return a word based on a specific place in the sentence. See the section #infrastructure

## Requirements

On your own computer:
 - [Ansible](https://www.ansible.com/)

At least 3 servers with:
 - A [ssh](https://fr.wikipedia.org/wiki/Secure_Shell) access
 - A [sudoer](https://fr.wikipedia.org/wiki/Sudo) user
 - [Python](https://www.python.org/)

## Configuration

First let's add your servers IP address in `inventory.cfg` file by replacing current IP address next to `ansible_host`.
Make sure to attribute different IP address in each group of 3 services.

Then, change IP address in roles.
For register address:
 - dispatcher/REGISTER_URLS
 - provider-adj/REGISTER_URLS
 - provider-subject/REGISTER_URLS
 - provider-verb/REGISTER_URLS

For dispatchers address:
 - loadbalancer/site.conf.j2:
   ```
   upstream canardascii {
     server <dispatcher1>;
     server <dispatcher2>;
     server <dispatcher3>;
   }
   ```

For providers address:
 - provider-verb/ADVERTISER_URL (dispatcher1)
 - provider-subject/ADVERTISER_URL (dispatcher2)
 - provider-adj/ADVERTISER_URL (dispatcher3)

For loadbalancer address:
 - loadbalancer/vars:
   ```
   DEFAULT_SERVER_NAME: 141.95.110.78
   ```

For postgres address:
 - register/POSTGRESQL_ADDON_HOST


## Run
 
**To deploy the application simply execute :**

```bash
chmod u+x ./run.sh
./run.sh
```