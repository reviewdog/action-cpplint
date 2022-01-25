# GitHub Action: Run cpplint with reviewdog

[![Docker Image CI Status](https://github.com/reviewdog/action-cpplint/workflows/Docker%20Image%20CI/badge.svg?branch=master)](https://github.com/reviewdog/action-cpplint/actions)
[![Release](https://img.shields.io/github/release/reviewdog/action-cpplint.svg?maxAge=43200)](https://github.com/reviewdog/action-cpplint/releases)

[![github-pr-check sample](https://user-images.githubusercontent.com/1439172/67361002-68025080-f5a2-11e9-97b7-530d0531edb4.png)](https://github.com/reviewdog/action-cpplint/pull/2)
[![github-pr-review sample](https://user-images.githubusercontent.com/1439172/67361077-9c760c80-f5a2-11e9-98e4-975052cd6fd4.png)](https://github.com/reviewdog/action-cpplint/pull/2)


This action runs [cpplint](https://pypi.org/project/cpplint/) with [reviewdog](https://github.com/reviewdog/reviewdog) on pull requests to improve code review experience.

## Inputs

### `github_token`

**Required**. Must be in form of `github_token: ${{ secrets.github_token }}`'.

### `level`

Optional. Report level for reviewdog [info,warning,error].
It's same as `-level` flag of reviewdog.
Default is `error`.

### `reporter`

Reporter of reviewdog command [github-pr-check,github-pr-review].
Default is `github-pr-check`.

### `reviewdog-flags`
Additional reviewdog flags.
Default is `''`.

### `flags`

Optional. List of arguments to send to cpplint.
Default is `--extensions=h,hpp,c,cpp,cc,cu,hh,ipp`.

### `filter`

Optional. List of filter arguments to send to cpplint.
Default is `--filter=""`.

### `targets`

Optional. List of file list arguments to send to cpplint.
Default is `--recursive .`.

## Example Usage

### [.github/workflows/reviewdog.yml](.github/workflows/reviewdog.yml)

```yml
name: Reviewdog
on: [pull_request]

jobs:
  cpplint:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - uses: reviewdog/action-cpplint@master
      with:
        github_token: ${{ secrets.github_token }}
        reporter: github-pr-review
        flags: --linelength=50 # Optional
        filter: "-readability/braces\
          ,-whitespace/braces\
          ,-whitespace/comments\
          ,-whitespace/indent\
          ,-whitespace/newline\
          ,-whitespace/operators\
          ,-whitespace/parens\
          " # Optional
```
