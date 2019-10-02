lunch_others_targets=()
for device in $(cat vendor/devilian/devilian.devices)
do
    for var in user userdebug; do
        lunch_others_targets+=("devilian_$device-$var")
    done
done
