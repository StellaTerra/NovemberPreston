#!/usr/bin/env bash
set -euo pipefail

readonly preview_url="http://127.0.0.1:4000/"
readonly log_path="/tmp/november-preston-jekyll.log"

if ! bundle check >/dev/null 2>&1; then
  echo "Installing missing Ruby dependencies..."
  bundle install
fi

if pgrep -f '[j]ekyll serve.*--port 4000' >/dev/null; then
  echo "Jekyll is already running at ${preview_url}"
  exit 0
fi

nohup bundle exec jekyll serve \
  --host 0.0.0.0 \
  --port 4000 \
  --livereload \
  --livereload-port 35729 \
  --force_polling \
  >"${log_path}" 2>&1 &

readonly server_pid=$!

for _ in $(seq 1 30); do
  if ! kill -0 "${server_pid}" 2>/dev/null; then
    echo "Jekyll exited before the preview became available:" >&2
    sed -n '1,160p' "${log_path}" >&2
    exit 1
  fi

  if curl --fail --silent "${preview_url}" >/dev/null; then
    echo "Jekyll is running at ${preview_url}"
    echo "Log: ${log_path}"
    exit 0
  fi

  sleep 1
done

echo "Jekyll did not become available within 30 seconds:" >&2
sed -n '1,160p' "${log_path}" >&2
exit 1
