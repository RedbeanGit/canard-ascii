# canard-ascii

## Features
Canard ascii is a simple application of [Cadavre exquis](https://fr.wikipedia.org/wiki/Cadavre_exquis). It's compose of a dispatcher, a register and 4 providers. Each providers return a word based on a specific place in the sentence. See the section #infrastructure


## Infrastructure

7 machines : 
- Loadbalancer: Adressed by the client and provide and redirect onto one Provider via the register.
- Register : On one machine. Permit to address the 
- Providers : Return a random word inside a hard-coded list.
- Postgres : Associated with registers. DB to store url of providers. 
- Dispatcher : Cacth the value of the provider and send it to the client.

## Configuration
 
**For launching the application simply execute :**

```bash
chmod u+x ./run.sh
./run.sh 
```

**To stop the application :**
```bash
vagrant halt

vagrant destroy #to remove virtuals machines 
```
## Dependencies
- Docker (20.10.12)
- Ansible (2.12.1)
- Vagrant (2.2.6)