#!/bin/bash

# Function to apply a yaml file and check if the command was successful
apply_yaml() {
    file=$1
    echo "Applying $file ..."
    kubectl apply -f $file

    if [ $? -eq 0 ]; then
        echo "$file applied successfully."
    else
        echo "Failed to apply $file. Stopping the script."
        exit 1
    fi
}

# Function to restart a statefulset and check if the command was successful
restart_statefulset() {
    statefulset_name=$1
    namespace=$2
    echo "Restarting statefulset: $statefulset_name in namespace: $namespace ..."
    kubectl rollout restart statefulset/$statefulset_name -n $namespace

    if [ $? -eq 0 ]; then
        echo "Statefulset $statefulset_name restarted successfully."
    else
        echo "Failed to restart statefulset $statefulset_name."
        exit 1
    fi
}

# Apply the configuration YAML
apply_yaml "0_hive-config.yaml"

# Restart the statefulsets
restart_statefulset "metastore" "bigdata"
restart_statefulset "hive" "bigdata"

echo "All operations completed successfully."