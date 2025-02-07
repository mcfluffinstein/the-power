# The Power
The Power is a simple test/learning framework to help you understand the GitHub API's. Add extra goodies to your GitHub Appliance or Organization on GitHub.com.

![the-power](https://github.com/gm3dmo/the-power/actions/workflows/the-power.yml/badge.svg)


## Table of Contents

1. [What is the Power?](#what-is-the-power)
2. [Setup Instructions](docs/setup.md)
3. [Contributing to The Power](CONTRIBUTING.md)
4. [Known Issues/Problems/Solutions](docs/known-issues.md)
5. [Testcases](docs/testcases.md)

## What is The Power?
The Power is a collection of scripts that demonstrate the GitHub APIs to create a usefully configured GitHub organization. The Power adds the following to a blank appliance or organization in <=30 seconds:

* Users
* A [team](https://docs.github.com/en/github/setting-up-and-managing-organizations-and-teams/about-teams) of users.
* A private repository named *testrepo* with a [branch](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-and-deleting-branches-within-your-repository) called *new_branch*,  a protected branch called *protected_branch*
* [Branch protection](https://docs.github.com/en/github/administering-a-repository/about-protected-branches) rules set up on `protected_branch`.
* A [pull request](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/about-pull-requests) on *testrepo*.
* A working [*CODEOWNERS*](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/about-code-owners) file configured for the *README.md* file on *testrepo*.
* A *requirements.txt* file with vulnerabilities to trigger [Dependabot](https://docs.github.com/en/code-security/dependabot)
* A [webhook](https://docs.github.com/en/developers/webhooks-and-events/about-webhooks) on *testrepo* that outputs to a smee.io url.
* A [Release](https://docs.github.com/en/github/administering-a-repository/managing-releases-in-a-repository).
* GitHub Pages configured for *testrepo*.
* A GitHub [Gist](https://docs.github.com/en/github/writing-on-github/creating-gists).
* Mermaid diagrams using [create-commit-mermaid.sh](create-commit-mermaid.sh) that demos some example diagram types on [the mermaid project](https://mermaid-js.github.io/mermaid/#/n00b-gettingStarted).

There are many other features and test-cases you can use or adapt to build scenarios of your own.

### The Power is a tool for learning
- Designed to be as simple as possible to understand. 
- Almost exclusively uses only `curl` and `jq` to complete most tasks. Only a few of the more complex scenarios have other dependencies.

### The Power is vast
There are hundreds of pre-baked scripts to:

* Create commits, secrets, hooks, issue comments, environments.
* Bulk up your appliance by creating hundreds or thousands of users/orgs/repos/teams/pull requests.
* Set up a Tiny GitHub App in less than 1 minute.
* Demonstrate GitHub Actions Workflows.
* Demonstrate CodeQL.

### The Power is configurable
The Power is driven by it's configuration file `.gh-api.examples.conf`. You can edit this to create new organizations, teams, users to use in test cases.

### Why The Power
There are lots of great tools like [Postman](https://www.postman.com/), [JMeter](https://jmeter.apache.org/) for interacting with API's and building testsuites and many of the latest API's come with their own interactive documentation built-in like the [swagger petstore](https://petstore.swagger.io/). The Power is a solution for times and places where those tools just aren't available. 
