# **Developer guide for initializing the repo**

Following the below setup guidlines installs and enables below features in the repo:

- pre-commit hooks
- Solhint
- Prettier-plugin for solhint
- Slither-Analyzer

# **Setup :**

### i. Copy the `dev-utils` folder in the repo. It contains the below files:

1. `.pre-commit-config.yaml`: File containing all the necessary hooks.

   - `pre-commit`: python package [documentation](https://pre-commit.com/index.html)
   - `Supported hooks`: [list](https://pre-commit.com/hooks.html)
   - `Custom hooks`: [link](https://pre-commit.com/index.html#new-hooks)

1. `.solhint.json`

   - Add all the solhint related configurations in this file
   - By default the setting is to follow recommended flag.
   - Solhint is configured with prettier-plugin (for auto format)
   - All supported rules can be found [here](https://github.com/protofire/solhint/blob/master/docs/rules.md)

1. `*.sh`: Other utility scripts as per necessity

   - `restricted-user.sh`: Script to allow only selective users to commit on the restricted branches

______________________________________________________________________

### ii. Once the dev-utils folder is added in the repo, configure the `package.json`

1. If repo **does not** have package.json already run   `$ npm init`   (command will add a package.json in repo), else skip step 1.
1. Add | Append the following `scripts` in package.json at the root of your repo:
   ```json
   "scripts": {
       "install-pip-packages": "pip3 install -r requirements.txt",
       "initialize-pre-commit": "pre-commit install -c ./dev-utils/.pre-commit-config.yaml",
       "prepare": "npm-run-all install-pip-packages initialize-pre-commit",
       "solhint": "./node_modules/.bin/solhint -f table -c ./dev-utils/.solhint.json",
       "prettier:solidity": "./node_modules/.bin/prettier --write **/*.sol"
   }
   ```
1. Add | Append the following `devDependencies` in package.json at the root of your repo:
   ```json
   "devDependencies": {
       "npm-run-all": "^4.1.5",
       "prettier": "^2.5.1",
       "prettier-plugin-solidity": "^1.0.0-beta.19",
       "solhint": "^3.3.6",
       "solhint-plugin-prettier": "^0.0.5"
   }
   ```
1. Add a `requirements.txt` with the following | Append the following to the existing `requirements.txt` file at the root of your repo:
   ```txt
   pre-commit
   slither-analyzer
   ```
   - To understand requirements.txt file format check [this](https://pip.pypa.io/en/stable/reference/requirements-file-format/)

______________________________________________________________________

### iii. Run the below command

```bash
# For fresh installation.
$ npm i

## or ##

# If a package-lock.json file already exists in the repo
$ npm ci
```

______________________________________________________________________

**NOTE**:

- These are the basic pre-requisites of setting up a repo with pre-commit hooks
- Files in dev-utils are added only reference and can be updated as per the need of the project
