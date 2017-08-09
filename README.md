Run `bootstrap.sh` to install essential applications and libraries to the system. Run `kashoo.sh` to install (almost) everything needed to do development for Kashoo.

Add the following to `.bash_profile`:

```
for file in ~/.bash_profile_includes/*.sh; do
  [[ -r $file ]] && source $file;
done
```
