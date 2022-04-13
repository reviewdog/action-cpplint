#!/bin/sh

if [ -n "${GITHUB_WORKSPACE}" ] ; then
  git config --global --add safe.directory "${GITHUB_WORKSPACE}" || exit
  cd "${GITHUB_WORKSPACE}" || exit
fi

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

[[ -n "${INPUT_FLAGS}" ]] && set -- "$@" ${INPUT_FLAGS}
[[ -n "${INPUT_FILTER}" ]] && set -- "$@" --filter="${INPUT_FILTER}"

cpplint "$@" ${INPUT_TARGETS} 2>&1 \
    | reviewdog -efm="%f:%l: %m" -name="cpplint" -reporter="${INPUT_REPORTER}" -level="${INPUT_LEVEL}" "${INPUT_REVIEWDOG_FLAGS}"
