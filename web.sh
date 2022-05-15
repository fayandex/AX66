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
                        "'` [[ $type = trojan || ! $type ]] && echo "password" || echo "id" `'": "'`[ $id ] && echo "$id" || echo "3e52e654-d66f-4d84-9a8a-d4194e6d28fe" `'"
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
