# Python tips and tricks



## Virtual env
Create a virtual environment for your project
```
python3 -m pip install virtualenv # Install virtualenv if you haven't yet.
cd <project>
python3 -m virtualenv --no-site-packages .
```

Activate the project ( you do this for evry time you want to start up this project.
```
cd <project>
. bin/activate
```

## Auto virtualenv
- Add this script to your bash_alias/basrc file and restart your shell
```
function load_virtualenv() {
  VIRTUALENVS=~/.virtualenvs
  if [[ -f .virtualenv ]]
  then
    VIRTUALENV=$(cat .virtualenv)
    if [[ ! -e $VIRTUALENVS/$VIRTUALENV ]]; then
      python3 -m virtualenv --no-site-packages $VIRTUALENVS/$VIRTUALENV
    fi
  fi
  . $VIRTUALENVS/$VIRTUALENV/bin/activate
}
```
- To enable a virtual env named `my-virtualenv` for the current folder just do:
```
echo "my-virtualenv" > .virtualenv
```
- Run load_virtualenv when you want to load en virtual env.
