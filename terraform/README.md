#  terraform + helmchart module

## customer usage
create new stage e.g. gustl - the environment you would like to deploy ehrbase
```shell
# create folder
cd stages
mkdir gustl

# create main.tf with reference to the module ehrbase
# create namespace.tf a kubernetes namespace to be used
# create providers.tf - currently we need only kubernetes + helm
# create variables.tf - your customer variables

## IMPORTANT ##
# k8s_config_path -> path to your kubeconfig file with credentials to the kubernetes cluster
# k8s_config_context -> the context you are useing in your kubeconfig file
```

