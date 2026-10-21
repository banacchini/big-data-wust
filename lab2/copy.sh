#!/usr/bin/env bash

SSH_KEY="${SSH_KEY:-$HOME/.ssh/lab_key}"

# -3 way copy (przez naszą maszynę), -i używa klucza, -o żeby się nie pytał o potwierdzenie hosta, -o żeby nie zapisywał hosta w known_hosts
SCP_OPTS=(-3 -i "$SSH_KEY" -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=ERROR)

if [ "$#" -lt 3 ]; then
  echo "Usage: $0 <user@host:/src/dir> <user@host:/dst/dir> <file>[:<new-name>] ..." >&2
  exit 1
fi

src="$1"
dst="$2"

shift 2 # usuwamy 2 pierwsze argumenty (src i dst), żeby móc odpalić pętle po plikach

src_host="${src%%:*}" # obcina wszystko po pierwszym ":"
src_dir="${src#*:}" # obcina wszystko przed pierwszym ":" (włącznie)
dst_host="${dst%%:*}" 
dst_dir="${dst#*:}"

status=0

for arg in "$@"; do
    name="${arg%%:*}" 
    new="${arg#*:}" #jak nie ma dwukropka to się zwróci to samo co w name
    new="${new:-$name}" # jeśli nie podano nowej nazwy (ale był dwukropek), to używamy starej

    # %/ zdejmuje końcowy "/" z katalogu /tmp i /tmp/ to to samo
    echo "$src_host:${src_dir%/}/$name -> $dst_host:${dst_dir%/}/$new"
    scp "${SCP_OPTS[@]}" "$src_host:${src_dir%/}/$name" "$dst_host:${dst_dir%/}/$new" || status=1
done

exit $status