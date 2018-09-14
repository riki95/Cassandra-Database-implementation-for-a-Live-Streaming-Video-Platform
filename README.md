# A NOSQL Database implementation for a Live Streaming Video Platform

This is an implementation of a Live Streaming Video Platform using Cassandra. We took inspiration from [Twitch](https://www.twitch.tv/) and we created a dataset in order to reproduce the distribution of the data across clusters.
The Dataset is not so big but you can easily generate more data and spread it out across more servers with different number of replicas.

## Getting Started

First of all, you need to install [Cassandra](http://cassandra.apache.org/) on your computer or server.

To download my repo:

```
git clone https://github.com/riki95/A-NOSQL-Database-implementation-for-a-Live-Streaming-Video-Platform
```
Now you're ready to reproduce my experiments.

## Database Set Up

Now that you installed Cassandra and downloaded my repo, you can write
```
cqlsh
```
on the terminal to start Cassandra and then you can:

* Create the database with **create.cql** inside the **Implementation** folder.
* Popolate the database with **data.cql** file inside the **Implementation** folder. If you want to enlarge the dataset, you have to add rows here.

That's all, the database is created.

## Experiments

Now you can do a lot of experiments. For example, you could install [Cassandra Cluster Manager](https://academy.datastax.com/planet-cassandra/getting-started-with-ccm-cassandra-cluster-manager) so that you can check information about the active cluster you have, where data are splitted and so on.

Otherwise you can check inside the **Workload** folder and you will find a **workload.cql** file that you can use to run some queries on this dataset. These are very stressing queries since we focussed on the tables with the maximum number of Input-Output operations.

## Authors

* **Riccardo Basso** - *Università degli studi di Genova* - Advanced Data Management 2017-2018
* **Simone Hu** - *Università degli studi di Genova* - Advanced Data Management 2017-2018
