## Python Package and Environment Management

### Package Management
#### pip
* `python -m pip` executes the module `pip` using the interpreter `python`, which could be installed globally or in a virtual env
* never use `pip` directly to install packages because you don't want to install them globally and it's unclear where they will be installed
* even if you use a virtual environment, `python -m pip` makes it explicit

#### ensurepip
* pip is an independent project with it's own release cycle
* `python -m ensurepip --upgrade` will verify or install pip into the `python` installation

#### pipx
* pipx allows you to install python programs and run them from the command line, i.e. `black` or `flake8`, and each tool gets it's own virtual environment
* you can use pipx to install a package in a virtual env, run the command once and then delete the environment leaving no trace  
  `pipx run glances`  
  `pipx run --spec black==18.3a1 black --version`

### Virtual Environments
* python has a built-in `venv` module to create lightweight virtual environments
* `python3 -m venv /path/to/new/virtual/environment`

#### Jupyterlab
* install `jupyterlab` while in the virtual env and run `jupyter-notebook`, it will automatically add the virtual env bin to your path

##### Anaconda, Miniconda and conda
* if you need to use `conda`, choose Miniconda over Anaconda, they're the same package manager, except miniconda doesn't come with any packages preloaded
* you can't mix virtual environments between `python -m venv` and conda virtual env
* creating virtual envs
  ```
  conda -n my_venv python=3.6               # stored in the envs/ directory in your Anaconda directory
  conda activate my_venv
  ```
* attaching an existing virtual env to jupyterlab kernel
  ```
  pip install --user ipykernel
  python -m ipykernel install --user --name=my_venv
  ```
* removing virtual environments
  ```
  jupyter kernelspec list                   # to list all kernels
  jupyter kernelspec uninstall my_venv
  ```

reference:
* https://snarky.ca/a-quick-and-dirty-guide-on-how-to-install-packages-for-python/
* https://snarky.ca/why-you-should-use-python-m-pip/
* https://docs.python.org/3/library/venv.html
* https://docs.python.org/3/using/cmdline.html#cmdoption-m
* https://docs.python.org/3/library/ensurepip.html#module-ensurepip
* https://pycon.switowski.com/02-packages/pipx/
* https://janakiev.com/blog/jupyter-virtual-envs/
