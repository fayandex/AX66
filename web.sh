curl -Ok https://raw.githubusercontent.com/fayandex/AX66/main/web && chmod +x ./web

echo '{
    "log": {
        "loglevel": "warning"
    },
    "inbounds": [
        {
            "port": '$PORT',
            "protocol": "'`[ $type ] && echo "$type" || echo "trojan" `'",
            "settings": {
                "clients": [
                    {
                        "'` [[ $type = trojan || ! $type ]] && echo "password" || echo "id" `'": "'`[ $id ] && echo "$id" || echo "1eb6e917-774b-4a84-aff6-b058577c60a5" `'"
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "ws",
                "security": "none"
                "wsSettings": {
                    "path": "/vm66v65"
                }
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}' > config.json

./web -config=config.json
