# Benchmark setup scripts

## Setup

Fill in the `config.sh` according to the template file (`config-template`):

```sh
cp config-template config.sh
vim config.sh
```

Initialize the link between machines:

```sh
bash connection_setup.sh
```

If there is an unmounted local disk, mount it first (please modify the script yourself):

```sh
bash ssd_setup.sh
```

Transfer the scripts to the central node and initialize the machines in the cluster:

```sh
bash copy_to_central.sh
source config.sh
ssh ${USER}@${HOST_CENTRAL} "bash central_setup.sh"
```

## Deploy

The next steps will be done on the central control node.

```sh
ssh ${USER}@${HOST_CENTRAL}
source config.sh
```

Generate a topology file used by `tiup`:

```sh
bash generate_topology.sh
```

Check the environment and deploy cluster:

```sh
tiup cluster check -u ${USER} topology.yaml
tiup cluster deploy tikv-min v6.2.0 -u ${USER} topology.yaml
tiup cluster start tikv-min --init
```

## Bench

The next steps will be done on the ycsb worker node.

```sh
ssh ${USER}@${HOST_CENTRAL}
source config.sh
ssh ${USER}@${HOST_YCSB}
```

Do it:

```sh
bash bench/do.sh
```

