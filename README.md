#JSONiq Query Examples for MongoDB

##Configure & Run
In order to run these examples, you need to create an account on http://28.io.
You also need to install the 28 CLI tool:
```bash
$npm install 28 -g
$28 login your@email.com
```

You can then edit the mongodb-config.json file with the credential of your own MongoDB.

To create a project and attach your MongoDB:
```bash
$28 projects create my-project
$28 datasources set my-project -c mongodb-config.json
```

To upload the queries:
```bash
$cd queries/
$28 upload my-project
```

To run a query:
```bash
$cd queries/
$28 run my-project public/top_contributors.jq
```

## JSONiq Development
The Atom and Cloud9 editors have great support for JSONiq.
The Atom extension for JSONiq is available [here](https://atom.io/packages/language-jsoniq).

The `28 watch` command will deploy your queries to 28.io everytime they are updated locally.
```bash
$cd queries/
$28 watch my-project
```
